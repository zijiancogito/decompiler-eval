import sys
import os
import re
sys.path.append('../../utils/functools')
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

def get_c_cycles(function):
    conds = 0
    for l in str(function).strip().split('\n'):
        if isBranch(l):
            conds += 1S
    return conds + 1


    