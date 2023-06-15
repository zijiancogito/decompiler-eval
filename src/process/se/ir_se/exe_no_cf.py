import os
import sys

from func_timeout import func_set_timeout
import llvmlite.binding as llvm
import re
import json

from instruction import execution_instruction

sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree/')
from exp_tree import ExpTree, copy_tree, exptree_to_json

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()


def process_functions(ir_file, save_to):
    llvm_ir = None
    with open(ir_file, 'r') as f:
        llvm_ir = f.read().strip()
    assert llvm_ir, f"Failed to read IR file {ir_file}."

    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    try:
        for function in mod.functions:
            if function.name != 'func0':
                continue
            exps, symbols= symbolic_execution(function)
            if exps != None:
                dump_to_file(save_to, exps, symbols)
            break
        return False 
    except:
        return True 

def dump_to_file(save_to, exps, symbols):
    js_dict = {}
    exps_json = {}
    for v in exps:
        exps_json[v] = exptree_to_json(exps[v])
    js_dict["expressions"] = exps_json
    js_dict["symbols"] = symbols
    with open(save_to, 'w') as out:
        json.dump(js_dict, out)

def symbolic_execution(function):
    """ tmp_dict, input_symbols_table, output_symbols_table are temporary dics """
    tmp_dict = {}
    input_symbols_table= {}
    output_symbols_table= {}

    """ execution results """
    output_expressions = {}

    find_parameters(str(function).strip(), tmp_dict, input_symbols_table)
    for block in function.blocks:
        execution_var(block,
                      tmp_dict,
                      input_symbols_table,
                      output_symbols_table, 
                      output_expressions)

    """ symbols in expressions """
    input_symbols = []
    for sym in input_symbols_table:
        if sym not in ['scanf', 'param']:
            input_symbols.append(f"{sym}{i}")
            continue

        for i in range(input_symbols_table[sym]):
            input_symbols.append(f"{sym}{i}")

    return output_expressions, input_symbols

def find_parameters(function, tmp_dict, input_symbols_table):
    pattern = "[\s\S]*define [^\n]+\(([^\n]*)\)"
    _match = re.match(pattern, function)
    if not _match:
        return None
    params_str = _match.group(1)
    pattern_params = "[^,]+ ([^,\s]+)"
    find = re.findall(pattern_params, params_str)

    for var in find:
        if "param" in input_symbols_table:
            index = input_symbols_table['param']
            tree = ExpTree("symbol", f"param{index}")
            tmp_dict[var] = tree
            input_symbols_table['param'] += 1
        else:
            tree = ExpTree("symbol", "param0")
            tmp_dict[var] = tree
            input_symbols_table["param"] = 1

def execution_var(block, 
                  tmp_dict,
                  input_symbols_table, 
                  output_symbols_table, 
                  output_expressions):
    for instruction in block.instructions:
        if instruction.opcode == 'call':
            func_name, plist, ret = parse_call(str(instruction).strip())
            if func_name == "__isoc99_scanf" or func_name == "scanf":
                find_scanf_symbols(plist[1:], tmp_dict, input_symbols_table)
            elif func_name == "f_scanf_nop":
                find_scanf_symbols([ret], tmp_dict, input_symbols_table)
            elif func_name == "printf" or func_name == "__isoc99_printf":
                find_printf_symbols(plist[1:], tmp_dict, output_symbols_table, output_expressions)
            elif func_name == "f_printf":
                find_printf_symbols(plist, tmp_dict, output_symbols_table, output_expressions)
            else:
                ret = execution_instruction(instruction, tmp_dict)

                if ret != None:
                    input_symbols_table[func_name] = 1
        elif instruction.opcode == 'ret':
            op_ret = parse_return(str(instruction).strip())
            if op_ret != None:
                find_return_symbols(op_ret, tmp_dict, output_symbols_table, output_expressions)
        else:
            execution_instruction(instruction, tmp_dict)


def parse_call(instruction):
    pattern = "([\S]+)*( = )*[\s\S]*call [\s\S]*@([^(]+)[^\(]*\(([\s\S]*)\)"
    _match = re.match(pattern, instruction)
    if not _match:
        return None
    ret = _match.group(1)
    func_name = _match.group(3)
    params_str = _match.group(4)

    pattern_params = "([^,]+\([^\)]+\))|([^,]+)"
    # group 1 is a const string @ value
    # group 2 is a % register or int value
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


def parse_return(instruction):
    pattern_non_void = "ret [\S]+ ([\S]+)"
    pattern_void = "ret void"

    match_void = re.match(pattern_void, instruction)
    if match_void:
        return None
    
    match_non_void = re.match(pattern_non_void, instruction)
    if match_non_void:
        ret = match_non_void.groups(1)[0]
        if re.match("%[0-9]+", ret):
            return ret
        else:
            return None
    return None


def find_scanf_symbols(plist, tmp_dict, input_symbols_table):
    """
        plist: list of scanf parameters
    """
    for var in plist:
        if "scanf" in input_symbols_table:
            index = input_symbols_table["scanf"]
            tree = ExpTree("symbol", f"scanf{index}")
            tmp_dict[var] = tree
            input_symbols_table["scanf"] += 1
        else:
            tree = ExpTree("symbol", f"scanf0")
            tmp_dict[var] = tree
            input_symbols_table["scanf"] = 1

def find_printf_symbols(plist, tmp_dict, output_symbols_table, output_expressions):
    """
        plist: list of printf parameters
    """
    for var in plist:
        if "printf" in output_symbols_table:
            index = output_symbols_table['printf']
            output_expressions[f'printf{index}'] = copy_tree(tmp_dict[var])
            output_symbols_table['printf'] += 1
        else:
            output_expressions['printf0'] = copy_tree(tmp_dict[var])
            output_symbols_table['printf'] = 1

def find_return_symbols(op, tmp_dict, output_symbols_table, output_expressions):
    if "return" in output_symbols_table:
        index = output_symbols_table['return']
        output_expressions[f'return{index}'] = copy_tree(tmp_dict[op])
        output_symbols_table['return'] += 1
    else:
        output_expressions['return0'] = copy_tree(tmp_dict[op])
        output_symbols_table['return'] = 1

if __name__ == '__main__':
    bname = os.path.basename(sys.argv[1])
    save_to = f"./test/{bname.split('.')[0]}.json" 
    process_functions(sys.argv[1], save_to)
