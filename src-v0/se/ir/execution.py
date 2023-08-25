import re
import sys
sys.path.append('.')
sys.path.append('../../')
from exp_tree.exp_tree import *
from simulate_instruction import *

def find_parameters(function, tmp_dict, input_index_table):
    pattern = "[\s\S]*define [^\n]+\(([^\n]*)\)"
    head = str(function).strip() # .split('\n')[1]
    match = re.match(pattern, head)
    if not match:
        return None
    params_str = match.group(1)
    pattern_params = "[^,]+ ([^,\s]+)"
    find = re.findall(pattern_params, params_str)

    for var in find:
        if "param" in input_index_table:
            t = ExpTree("symbol", f"param{input_index_table['param']}")
            tmp_dict[var] = t
            input_index_table['param'] += 1
        else:
            t = ExpTree("symbol", "param0")
            tmp_dict[var] = t
            input_index_table["param"] = 1

def find_input_symbols(plist, tmp_dict, input_index_table):
    for var in plist:
        if "scanf" in input_index_table:
            t = ExpTree("symbol", f"scanf{input_index_table['scanf']}")
            tmp_dict[var] = t
            input_index_table["scanf"] += 1
        else:
            t = ExpTree("symbol", "scanf0")
            tmp_dict[var] = t
            input_index_table["scanf"] = 1

def find_printf_symbols(plist, tmp_dict, output_index_table, output_symbols):
    for var in plist:
        if "printf" in output_index_table:
            output_symbols[f"printf{output_index_table['printf']}"] = copy_tree(tmp_dict[var])
            output_index_table["printf"] += 1
        else:
            output_symbols["printf0"] = copy_tree(tmp_dict[var])
            output_index_table["printf"] = 1

def find_ret_symbols(op, tmp_dict, output_index_table, output_symbols):
    if op != None:
        if 'return' in output_index_table:
            output_symbols[f"return{output_index_table['return']}"] = tmp_dict[op]
            output_index_table["return"] += 1
        else:
            output_symbols["return0"] = tmp_dict[op]
            output_index_table['return'] = 1

def execution_var(block, tmp_dict, input_index_table, output_index_table, output_symbols):
    for instruction in block.instructions:
        if instruction.opcode == 'call':
            func_name, ps, ret = parse_call(str(instruction).strip())
            if func_name == '__isoc99_scanf' or func_name == 'scanf':
                find_input_symbols(ps[1:], tmp_dict, input_index_table)
            elif func_name == 'f_scanf_nop':
                find_input_symbols([ret], tmp_dict, input_index_table)
            elif func_name == 'printf':
                find_printf_symbols(ps[1:], tmp_dict, output_index_table, output_symbols)
            elif func_name == 'f_printf':
                find_printf_symbols(ps, tmp_dict, output_index_table, output_symbols)
            else:
                ret = execution_instruction(instruction, tmp_dict)
                if ret != None:
                    input_index_table[func_name] = 1
        elif instruction.opcode == 'ret':
            op_ret = parse_ret(str(instruction).strip())
            find_ret_symbols(op_ret, tmp_dict, output_index_table, output_symbols)
        else:
            execution_instruction(instruction, tmp_dict)

def execution_cond(block, tmp_dict, input_index_table, next_block, pre_block):
    last_insn = None
    for instruction in block.instructions:
        last_insn = instruction
        if instruction.opcode == 'call':
            func_name, ps, ret = parse_call(str(instruction).strip())
            if func_name == '__isoc99_scanf' or func_name == 'scanf':
                find_input_symbols(ps[1:], tmp_dict, input_index_table)
            elif func_name == 'f_scanf_nop':
                find_input_symbols([ret], tmp_dict, input_index_table)
            elif func_name == 'printf' or func_name == 'f_printf':
                pass
            else:
                ret = execution_instruction(instruction, tmp_dict)
                if ret != None:
                    input_index_table[func_name] = 1
        elif instruction.opcode == 'phi':
            result = execution_phi(str(instruction).strip(), tmp_dict, pre_block)
            if result == None:
                return None
            tmp_dict[result[0]] = result[1]
        elif instruction.opcode == 'ret':
            pass
        else:
            execution_instruction(instruction, tmp_dict)

    curr_cond = None
    if last_insn.opcode == 'br':
        jump_kind, res = parse_br(str(last_insn).strip())
        if jump_kind == "jc":
            cond = res[0]
            true_dest = int(res[1])
            false_dest = int(res[2])
            if true_dest == next_block:
                curr_cond = copy_tree(tmp_dict[cond])
            elif false_dest == next_block:
                curr_cond = copy_tree(tmp_dict[cond])
                cmp = tmp_dict[cond].root_data
                if cmp == '>':
                    curr_cond.root_data = '<='
                elif cmp == '>=':
                    curr_cond.root_data = '<'
                elif cmp == '==':
                    curr_cond.root_data = '!='
                elif cmp == '!=':
                    curr_cond.root_data = '=='
                elif cmp == '<':
                    curr_cond.root_data = '>='
                elif cmp == '<=':
                    curr_cond.root_data = '>'
    
    return curr_cond

def parse_call(instruction):
    pattern = "([\S]+)*( = )*[\s\S]*call [\s\S]*@([^(]+)[^\(]*\(([\s\S]*)\)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    ret = match.group(1)
    func_name = match.group(3)
    params_str = match.group(4)

    # group1 is a const string
    # group2 is a % value
    pattern_params = "([^,]+\([^\)]+\))|([^,]+)"
    params_find = re.findall(pattern_params, params_str)
    params = []
    for p in params_find:
        if len(p[0]) > 0:
            pat = "@([^\s,]+)"
            pat_find = re.findall(pat, p[0])
            if len(pat_find) > 0:
                params.append(pat_find[0])
        elif len(p[1]) > 0:
            pat = "%[^\s,]+"
            pat_find = re.findall(pat, p[1])
            if len(pat_find) > 0:
                params.append(pat_find[0])
        else:
            continue
    
    return func_name, params, ret

def parse_ret(instruction):
    pattern_non_void = 'ret [\S]+ ([\S]+)'
    pattern_void = 'ret void'

    match_void = re.match(pattern_void, instruction)

    if match_void:
        return None
    match_non_void = re.match(pattern_non_void, instruction)
    if match_non_void:
        ret = match_non_void.groups(1)[0]
        if re.match("%[0-9]+", ret):
            return match_non_void.groups(1)[0]
        else:
            return None
    else:
        return None

def parse_br(instruction):
    # print(instruction)
    pattern1 = "br i1 (%[\S]+), label %([\S]+), label %([^\s,]+)"
    # pattern1 = "br i1 (%[\S]+), label %([\S]+), label %([\S]+)(,.*)*"
    pattern2 = "br label %([\S]+)"
    match1 = re.match(pattern1, instruction)
    if match1:
        cond = match1.group(1)
        true_dest = match1.group(2)
        false_dest = match1.group(3)
        # print(false_dest)
        return "jc", [cond, true_dest, false_dest]
    
    match2 = re.match(pattern2, instruction)
    if match2:
        dest = match2.group(1)
        return "jmp", dest
    return "none", None

def execution_instruction(instruction, tmp_dict):
    opcode = instruction.opcode
    if opcode == "ret":
        return None
    if opcode == "br":
        return None
    if opcode == "switch":
        return None
    if opcode == "indirectbr":
        return None
    if opcode == "invoke":
        return None
    if opcode == "callbr":
        result, exp = execution_callbr(str(instruction).strip(), tmp_dict)
        tmp_dict[result] = exp
    if opcode == "resume":
        return None
    if opcode == "catchswitch":
        return None
    if opcode == "catchret":
        return None
        # TODO
    if opcode == "unreachable":
        return None
    if opcode == "fneg":
        res = execution_fneg(str(instruction).strip(), tmp_dict) 
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "add":
        res = execution_add(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fadd":
        res = execution_fadd(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "sub":
        res = execution_sub(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fsub":
        res = execution_fsub(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "mul":
        res = execution_mul(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fmul":
        res = execution_fmul(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "udiv":
        res = execution_udiv(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "sdiv":
        res = execution_sdiv(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fdiv":
        res = execution_fdiv(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "urem":
        res = execution_urem(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "srem":
        res = execution_srem(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "frem":
        res = execution_frem(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "shl":
        res = execution_shl(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "lshr":
        res = execution_lshr(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "ashr":
        res = execution_ashr(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "and":
        res = execution_and(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "or":
        res = execution_or(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "xor":
        res = execution_xor(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "extractelement":
        res = execution_extractelement(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "insertelement":
        # TODO
        return None
    if opcode == "shufflevector":
        return None
    if opcode == "extractvalue":
        return None
    if opcode == "insertvalue":
        return None
    if opcode == "alloca":
        # TODO
        return None
    if opcode == "load":
        res = execution_load(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "store":
        res = execution_store(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fence":
        return None
    if opcode == "cmpxchg":
        return None
    if opcode == "atomicrmw":
        # TODO
        return None
    if opcode == "getelementptr":
        res = execution_getelementptr(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "trunc":
        res = execution_trunc(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "zext":
        res = execution_zext(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "sext":
        res = execution_sext(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fptrunc":
        res = execution_fptrunc(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fpext":
        res = execution_fpext(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fptoui":
        res = execution_fptoui(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fptosi":
        res = execution_fptosi(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "uitofp":
        res = execution_uitofp(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "sitofp":
        res = execution_sitofp(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "ptrtoint":
        res = execution_ptrtoint(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "inttoptr":
        res = execution_inttoptr(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "bitcast":
        res = execution_bitcast(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "addrspacecast":
        res = execution_addrspacecast(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "icmp":
        res = execution_icmp(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "fcmp":
        res = execution_fcmp(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "select":
        res = execution_select(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "freeze":
        return None
    if opcode == "call":
        res = execution_call(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
    if opcode == "va_arg":
        return None
    if opcode == "landingpad":
        return None
    if opcode == "catchpad":
        return None
    if opcode == "cleanuppad":
        return None

