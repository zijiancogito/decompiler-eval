import re
import sys


def parse_jump_instruction(instruction):
    # br %cond, label %x, label %y
    pattern = "label %([0-9]+)"
    find = re.findall(pattern, str(instruction))
    findi = [] # jump targets (int)
    for i in find:
        findi.append(int(i))
    return findi

def find_inputs(block, tmp_dict, in_symbols_table, input_funcs=[]):
    for instruction in block.instructions:
        if instruction.opcode == 'call':
