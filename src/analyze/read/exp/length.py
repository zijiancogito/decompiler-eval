import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from extractFunc import ExtractFuncs


def function_exp_len(function):
    exp_dict = {}
    for l in str(function).strip().split('\n'):
        l_len = len(l.rstrip())
        if l_len in exp_dict:
            exp_dict[l_len] += 1
        else:
            exp_dict[l_len] = 1
    return exp_dict
            
def get_c_exp_len(code_file, functions=['func0']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    
    exp_dict = {}
    for fname, fcode in zip(funcs_name, funcs):
        if len(functions) > 0 and fname not in functions:
            continue
        exp_dict[fname] = function_exp_len(fcode)
    return exp_dict