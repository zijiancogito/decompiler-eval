import sys
import os
import re
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from extractFunc import ExtractFuncs

def isBranch(line):
    l = line.strip()
    if 'if' in line:
        return True
    if 'for' in line:
        return True
    if 'while' in line:
        return True
    if 'case' in line:
        return True
    if 'catch' in line:
        return True
    if '?' in line:
        return True
    return False

def function_cycles(function):
    conds = 0
    for l in str(function).strip().split('\n'):
        if isBranch(l):
            conds += 1
    return conds + 1

def get_c_cycles(code_file, func_filter):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    
    cycles = {}

    for fname, fcode in zip(funcs_name, funcs):
        if len(func_filter) != 0 and fname not in func_filter:
            continue
        cycles[fname] = function_cycles(fcode)
    return cycles
