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

# def parse_select(instruction):
    