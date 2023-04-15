import sys
import os
import re

def isValid(line):
    l = line.strip()
    if re.match('[{}]*', l):
        return False
    return True

def line_of_function(function):
    loc = 0
    for l in str(function).strip().split('\n'):
        if isValid(l):
            loc += 1
    return loc

def get_c_lines(c_file, func):
    # sys.path.append('utils/functools')
    # import

    funcs, funcs_name = [], []
    locs = {}
    for fname, fcode in zip(funcs_name, funcs):
        locs[fname] = line_of_function(fcode)
    return locs
