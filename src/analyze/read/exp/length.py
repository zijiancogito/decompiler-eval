import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from extractFunc import ExtractFuncs


def function_exp_len(function):
    exp_dict = {}
    for l in str(function).strip().split('\n'):
        l_len = len(l)
        if l_len in exp_dict:
            exp_dict[l_len] += 1
        else:
            exp_dict[l_len] = 1
    return exp_dict

def get_len_over_80(code_file):
    extract_func = ExtractFuncs()
    funcs, _ = extract_func.getFuncs(code_file)
    for fcode in funcs:
        for l in str(fcode).strip().split('\n'):
            if len(l.strip()) > 150:
                print(f"{l}\t{len(l.strip())}")
            
def get_c_exp_len(code_file, functions=['func0']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    
    exp_dict = {}
    for fname, fcode in zip(funcs_name, funcs):
        if len(functions) > 0 and fname not in functions:
            continue
        exp_dict[fname] = function_exp_len(fcode)
    return exp_dict

def exp_score(dec_exps, src_exps):
    total_dec_exps = 0
    total_src_exps = 0
    total_dec_locs = 0
    total_src_locs = 0
    dec_over_80 = 0
    src_over_80 = 0
    for func in dec_exps:
        for l in dec_exps[func]:
            total_dec_exps += l * dec_exps[func][l]
            total_dec_locs += dec_exps[func][l]
            if l > 80:
                dec_over_80 += 1
    
    for func in src_exps:
        for l in src_exps[func]:
            total_src_exps += l * src_exps[func][l]
            total_src_locs += src_exps[func][l]
            if l > 80:
                src_over_80 += 1
    
    if total_dec_locs == 0:
        avg_dec = 0
    else:
        avg_dec = round(float(total_dec_exps) / total_dec_locs, 2)
    avg_src = round(float(total_src_exps) / total_src_locs, 2)
    
    return avg_dec, avg_src, dec_over_80, src_over_80

         
            