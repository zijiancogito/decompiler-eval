import sys
sys.path.append('../exp_tree')
import os
import json
from exp_tree import *
from compare import *

import batch_ce_all as ce

root = '/home/eval/DF/se/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']
match_algos = ['fullmatch', 'feature', 'concrete']

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
    fails = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            not_matched_var += 1
            fails.append(var)
            # print(f"NotFound\t{ir_json_file}\t{c_json_file}\t{var}")
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][0][var]
        if compare_variable(ir_exp, c_exp, option):
            matched_var += 1
        else:
            fails.append(var)
        # else:
            # print(f"NotMatch\t{ir_json_file}\t{c_json_file}\t{var}")
    all_ir_vars = len(ir_json["expressions"].keys())
    all_c_vars = len(c_json["expressions"][0].keys())

    return not_matched_var, matched_var, all_ir_vars, all_c_vars, fails

def batch_compare(ir_json_dir, c_json_dir, option):
    ir_dirs = os.listdir(ir_json_dir)
    # TODO: return failed files
    fails = {}

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
            files[ir_json] = []

            n, m, ir_vars, c_vars, fail = compare_file(ir_json, c_json, option)
            fails[ir_json] = fail
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
    # total_match: count of matched vars in all files
    # total_c: count of vars in all c files
    # total_ir: count of vars in all ir files
    # total_funcs: count of functions in all files
    # r: ratio of matched vars in one file
    # total_correct: sum of ratio of matched vars in all files (sum of r)
    # average: average of ratio of matched vars in all files (average of total_correct)
    # total_func_match: count of function full matched (all vars in file are matched)
    # functions: ratio of full matched functions

    # print(f"Matched: {total_match} / C_Var: {total_c} / IR_Var: {total_ir} / Average: {'{:.2f}'.format(average)} / Matched Functions: {'{:.2f}'.format(functions)}")
    print(f"{total_match}\t{total_c}\t{total_ir}\t{round(average, 2)}\t{round(functions, 2)}")

    return fails

def write_fails(save_to, fails):
    with open(save_to, 'w') as f:
        for fail in fails:
            vars = fails[fail]
            f.write(fail)
            for var in vars:
                f.write(' ')
                f.write(var)
            f.write('\n')

save_dir = '/home/eval/DF/err_cmp'

def batch_one(compiler, decompiler):
    dir = os.path.join(root, compiler, decompiler)
    for opt in options:
        print(f"{compiler} {decompiler} {option}")
        dec_dir = os.path.join(dir, opt)
        ir_dir = os.path.join(root, 'ir', opt)
        print(f"Algorithm\tMatch\tCVars\tIRVars\tAverage\tFunctions")
        for algo in match_algos:
            print(f"{algo}", end='\t')
            algo_dir = os.path.join(save_dir, opt, compiler, decompiler, algo)
            if not os.path.exists(algo_dir):
                os.makedirs(algo_dir)
            save_to = os.path.join(algo, f'err.csv')
            if algo == 'fullmatch' or algo == 'feature':
                fails = batch_compare(ir_dir, dec_dir, match_algo)
                write_fails(save_to, fails)
            elif algo == 'concrete':
                fails = ce.batch_compare(ir_dir, dec_dir)
                write_fails(save_to, fails)

def batch_all():
    for compiler in compilers:
        for decompiler in decompilers:
            batch_one(compiler, decompiler)


if __name__ == '__main__':
    batch_all()
    # root = '/home/eval/DF/se/'
    # compiler = sys.argv[1]
    # decompiler = sys.argv[2]
    # match_algo = sys.argv[3]
    # dir = os.path.join(root, compiler, decompiler)
    # for opt in ['o0', 'o2', 'o2', 'o3', 'os']:
        # dec_dir = os.path.join(dir, opt)
        # ir_dir = os.path.join(root, 'ir', opt)
        # print(f"Compare {compiler} {decompiler} {opt}")
        # if match_algo == 'fullmatch' or match_algo == 'feature':
            # batch_compare(ir_dir, dec_dir, match_algo)
        # elif match_algo == 'concrete':
            # print("concrete")
            # ce.batch_compare(ir_dir, dec_dir)

