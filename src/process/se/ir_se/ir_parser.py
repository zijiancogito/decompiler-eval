import re
import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
from exp_tree import ExpTree

def get_label_of_block(block):
    pattern = "[\s]+([0-9]+):[\S\s]+"
    match = re.match(pattern, str(block))
    if match:
        return int(match.group(1))
    else:
        return 0
    
def find_parameters(function, tmp_dict, in_symbols_table):
    pattern = "[\s\S]*define [^\n]+\(([^\n]*)\)"
    _match = re.match(pattern, function)
    if not _match:
        return None
    params_str = _match.group(1)
    pattern_params = "[^,]+ ([^,\s]+)"
    find = re.findall(pattern_params, params_str)

    for var in find:
        if "param" in in_symbols_table:
            index = in_symbols_table['param']
            tree = ExpTree("symbol", f"param{index}")
            tmp_dict[var] = tree
            in_symbols_table['param'] += 1
        else:
            tree = ExpTree("symbol", "param0")
            tmp_dict[var] = tree
            in_symbols_table["param"] = 1
            
def find_inputs(block, tmp_dict, in_symbols_table):
    for instruction in block.instructions:
        if instruction.opcode == 'call':
            func_name, plist, ret = parse_call(str(instruction).strip())
            if re.match('f_rand_[0-9]+', func_name):
                if "rand" in in_symbols_table:
                    index = in_symbols_table["rand"]
                    tree = ExpTree("symbol", f"rand{index}")
                    tmp_dict[ret] = tree
                    in_symbols_table["rand"] += 1
                else:
                    tree = ExpTree("symbol", f"rand0")
                    tmp_dict[ret] = tree
                    in_symbols_table["rand"] = 1

def find_return(block):
    for instruction in block.instructions:
        if instruction.opcode == 'ret':
            op_ret = parse_ret(str(instruction).strip())
            return op_ret
    return None

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
# def parse_select(instruction):
#     pattern = "([^\s]+) = select[^,]+ ([^\s]+), ([^,]+), ([^,]+)"
#     match = re.match(pattern, instruction)
#     if not match:
#         return None
#     new_inst_1 = f"{match.group(1)} = {}
    
def parse_jump_instruction(instruction):
    pattern = "label %([0-9]+)"
    find = re.findall(pattern, str(instruction))
    findi = []
    for i in find:
        findi.append(int(i))
    return findi
    
def extract_bb_inst(block):
    bb_inst = None
    for instruction in block.instructions:
        if instruction.opcode == 'call':
            func_name, plist, ret = parse_call(str(instruction).strip())
            if func_name == "printf" or func_name == "__isoc99_printf":
                bb_inst = plist[-1]
                break
    return bb_inst

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
            pat = ".* ([^\s]+)"
            pat_match = re.match(pat, p[1])
            if pat_match:
                params.append(pat_match.group(1))
        else:
            continue

    return func_name, params, ret