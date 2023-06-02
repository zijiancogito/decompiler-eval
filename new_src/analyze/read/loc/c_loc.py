import sys
import os
import re
sys.path.append('../../../utils/functools')
from extractFunc import ExtractFuncs

def isValid(line):
    l = line.strip()
    if re.match('[\{\}]', l):
        return False
    if l == "":
        return False
    return True

def line_of_function(function):
    loc = 0
    for l in str(function).strip().split('\n'):
        if isValid(l):
            loc += 1
    return loc

def get_c_lines(code_file, functions=['func0']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)

    locs = {}
    for fname, fcode in zip(funcs_name, funcs):
        if fname not in functions:
            continue
        locs[fname] = line_of_function(fcode)
    return locs

if __name__ == '__main__':
    locs = get_c_lines('../../test/0.c', ['func0'])
    print(locs)
