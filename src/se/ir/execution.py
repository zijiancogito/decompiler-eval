import re
import sys
sys.path.append('.')
from simulate_instruction import *


def find_output_variables(function):
    #TODO
    output_symbols_dict = {}
    for blk in  function.blocks:
        for insn in blk.instructions:
            opc = insn.opcode
            if opc == 'ret':
                opd = parse_ret(str(insn).strip())
                if opd != None:
                    output_symbols_dict[opd] = '' 
            # TODO : add other output type instructions
    return output_symbols_dict 
                
def find_input_variables(function):
    input_symbols_dict = {} 
    
    pattern_function_decl = "define [\s\S]+\(([\s\S]*)\)\n"
    match = re.match(pattern_function_decl, str(function).strip())
    if not match:
        return None
    params_str = match.group(1)
    params_with_type = [i.strip() for i in params_str.strip(',')]
    pattern_params = "[\S\s]+ (%[p0-9]+)"
    params = []
    for p in params_with_type:
        match = re.match(pattern_params, p)
        if match:
            input_symbols_dict.append(match.group(1))

    others = []
    for blk in function.blocks:
        for insn in blk.instructions:
            if insn.opcode == 'call':
                func_name, ps = parse_call(str(insn))
                if func_name == '__isoc99_scanf':
                    others.extend(ps[1:])
            # TODO: add more situations

    for i in params + others:
        input_symbols_dict[i] = None

    return input_symbols_dict
        
def parse_call(instruction):
    pattern = "[\s\S]*call [\s\S]*@([^(]+)\([\s\S]*\)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    func_name = match.group(1)
    params_str = match.group(2)

    # group1 is a const string
    # group2 is a % value
    pattern_params = "([^,]+\([^\)]+\))|([^,]+)"
    params_find = re.findall(pattern_params, params_str)
    params = []
    for p in params_find:
        if len(p[0]) > 0:
            pat = "@[\S]+"
            pat_find = re.findall(pat, p[0])
            if len(pat_find) > 0:
                params.append(pat_find[0])
        elif len(p[1]) > 0:
            pat = "%[\S]+"
            pat_find = re.findall(pat, p[1])
            if len(pat_find) > 0:
                params.append(pat_find[0])
        else:
            continue
    
    return func_name, params

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

def execution_block(block, tmp_dict):
    for instruction in block.instructions:
        res = execution_instruction(instruction, tmp_dict)
        if res == None:
            print(instruction)
    return None

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
        # TODO
        return None
    if opcode == "ashr":
        # TODO
        return None
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
        res = execution_cmpxchg(str(instruction).strip(), tmp_dict)
        if res == None:
            return None
        tmp_dict[res[0]] = res[1]
        return f"{res[0]} = {res[1]}"
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
        return None
    if opcode == "zext":
        return None
    if opcode == "sext":
        return None
    if opcode == "fptrunc":
        return None
    if opcode == "fpext":
        return None
    if opcode == "fptoui":
        return None
    if opcode == "fptosi":
        return None
    if opcode == "uitofp":
        return None
    if opcode == "sitpfp":
        return None
    if opcode == "ptrtoint":
        return None
    if opcode == "inttoptr":
        return None
    if opcode == "bitcast":
        return None
    if opcode == "addrspacecast":
        return None
    if opcode == "icmp":
        return None
    if opcode == "fcmp":
        return None
    if opcode == "phi":
        return None
    if opcode == "select":
        return None
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

        
def execution_callbr(instruction, tmp_dict):
    pattern_non_void = "(.*) = callbr .*"
    pattern_void = "callbr .*"

    pattern_label = "label ([\S]+)"
    pattern_param = ".* (%[0-9]+)"

    if re.match(pattern_void, instruction):
        return None
    match = re.match(pattern_non_void, instruction)
    if not match:
        return None
    result = match.group(1)
    find_label = re.find(pattern_label, instruction)
    label = find_label[0][0]
    find_param = re.findall(pattern_param, instruction)
    params = []
    for p in find_param:
        if re.match(pattern_label, p):
            continue
        if p in tmp_dict:
            params.append(tmp_dict[p[0]])
        else:
            params.append(p[0])
    
    exp = f"{result}({','.join(params)})"
    return result, exp

