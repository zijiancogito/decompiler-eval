import sys
sys.path.append('../../processData')

import os
import re
from extractFunc import *

def isValid(line):
    l = line.strip()
    if l == '}':
        return False
    if l == '{':
        return False
    if l == '':
        return False
    return True

def line_of_function(function):
    loc = 0
    for l in str(function).strip().split('\n'):
        if isValid(l):
            loc += 1
    return loc

def get_c_function_lines(c_file):
    eF = ExtractFuncs()
    funcs, funcs_name = eF.getFuncs(c_file)
    locs = {}
    for fname, fcode in zip(funcs_name, funcs):
        if not re.match('func[0-9]', fname):
            continue
        loc = line_of_function(fcode)
        locs[fname] = loc
    return locs

