import sys
sys.path.append('../exp_tree')
import os
import json
from exp_tree import *
from compare import *

import batch_ce_all as ce

def compare_file(ir_json_file, c_json_file, option):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    not_matched_var = 0
    matched_var = 0
    if len(c_json["expressions"]) > 1:
        return 0, 0, 0, 0
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            not_matched_var += 1
            # print(f"NotFound\t{ir_json_file}\t{c_json_file}\t{var}")
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][0][var]
        if compare_variable(ir_exp, c_exp, option):
            matched_var += 1
        # else:
            # print(f"NotMatch\t{ir_json_file}\t{c_json_file}\t{var}")
    all_ir_vars = len(ir_json["expressions"].keys())
    all_c_vars = len(c_json["expressions"][0].keys())

    return not_matched_var, matched_var, all_ir_vars, all_c_vars

def batch_compare(ir_json_dir, c_json_dir, option):
    ir_dirs = os.listdir(ir_json_dir)

    total_c = 0
    total_ir = 0
    total_match = 0
    total_not_match = 0
    total_func_match = 0
    total_funcs = 0
    total_correct = 0
    for ir_dir in ir_dirs:
        ir_files = os.listdir(os.path.join(ir_json_dir, ir_dir))
        for ir in ir_files:
            ir_json = os.path.join(ir_json_dir, ir_dir, ir)
            c_json = os.path.join(c_json_dir, ir_dir, ir)
            if not os.path.exists(c_json):
                continue

            n, m, ir_vars, c_vars = compare_file(ir_json, c_json, option)
            if ir_vars != 0:
                r = m / ir_vars
            else:
                r = 0
            if r == 1:
                total_func_match += 1
            total_correct = total_correct + r

            total_c += c_vars
            total_ir += ir_vars
            total_match += m
            
            total_funcs += 1
    average = total_correct / total_funcs
    functions = total_func_match / total_funcs

    print(f"Matched: {total_match} / C_Var: {total_c} / IR_Var: {total_ir} / Average: {average} / Matched Functions: {functions}")

if __name__ == '__main__':
    root = '/home/eval/DF/se/'
    compiler = sys.argv[1]
    decompiler = sys.argv[2]
    match_algo = sys.argv[3]

    dir = os.path.join(root, compiler, decompiler)
    for opt in ['o0', 'o1', 'o2', 'o3', 'os']:
        dec_dir = os.path.join(dir, opt)
        ir_dir = os.path.join(root, 'ir', opt)
        print(f"Compare {compiler} {decompiler} {opt}")
        if match_algo == 'fullmatch' or match_algo == 'feature':
            batch_compare(ir_dir, dec_dir, match_algo)
        elif match_algo == 'concrete':
            print("concrete")
            ce.batch_compare(ir_dir, dec_dir)

