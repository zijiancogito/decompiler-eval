import sys
import os
import re

dec_root = '/home/eval/DF/se/de'
ir_root = '/home/eval/DF/se/ir'
log_root = '/home/eval/DF/err_log'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'ida', 'RetDec']
options = ['o1', 'o2', 'o3', 'os']

def compare_func(dec_se, ir_se, option):
    r = 0
    wrong_vars = []
    if option == 'feature' or option == 'fullmatch':
        sys.path.append('../../src/exp_tree/')
        from compare import tree_analyze
        r, wrong_vars = tree_analyze(ir_se, dec_se, option)
    elif option == 'concrete':
        sys.path.append('../../src/exp_tree')
        from concrete_execution import concrete_analyze
        r, wrong_vars = concrete_analyze(ir_se, dec_se)

    if r == 1:
        return True, []
    return False, wrong_vars

def log_err(save_to, logs):
    with open(save_to, 'w') as f:
        for log in logs:
            f.write(log)
            f.write('\n')

def analyze(de_dir, ir_dir, option):
    de_sub_dirs = os.listdir(de_dir)
    correct_funcs = 0
    compiler = de_dir.split('/')[-3]
    decompiler = de_dir.split('/')[-2]
    opt_level = de_dir.split('/')[-1]
    log_dir = os.path.join(log_root, compiler, decompiler, opt_level)
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    log_file = os.path.join(log_dir, 'err.csv')
    wrong_logs = []
    total_de_funcs = 0
    total_ir_funcs = 0
    for sub_dir in de_sub_dirs:
        ir_sub_dir = os.path.join(ir_dir, sub_dir)
        if not os.path.exists(ir_sub_dir):
            continue
        de_sub_dir = os.path.join(de_dir, sub_dir)
        funcs = os.listdir(de_sub_dir)
        for func in funcs:
            if not re.match('func[0-9]\.json', func):
                continue
            print(func)
            total_de_funcs += 1
            ir_json = os.path.join(ir_sub_dir, func)
            if not os.path.exists(ir_json):
                continue
            de_json = os.path.join(de_sub_dir, func)
            compare_result, wrong_vars = compare_func(de_json, ir_json, option)
            if compare_result == True:
                correct_funcs += 1
            else:
                wrong_logs.append(f"{de_json} {' '.join(wrong_vars)}")
        for f in os.listdir(ir_sub_dir):
            if re.match('func[0-9]\.json', f):
                total_ir_funcs += 1
    log_err(log_file, wrong_logs)
    print(total_de_funcs)
    print(total_ir_funcs)
    p = round(correct_funcs/total_de_funcs, 2)
    r = round(correct_funcs/total_ir_funcs, 2)
    return p, r

def analyze_all(option):
    for compiler in compilers:
        #print(compiler)
        #print("Decompiler\t----O0----\t----O1----\t----O2----\t----O3----\t----Os----")
        for decompiler in decompilers:
            #print("{0:15}".format(decompiler), end='\t')
            for opt_level in options:
                de_dir = os.path.join(dec_root, compiler, decompiler, opt_level)
                ir_dir = os.path.join(ir_root, opt_level)
                p, r = analyze(de_dir, ir_dir, option)
                #print(f"{p} {r}", end='\t')
            #print()
        #print()


if __name__ == '__main__':
    analyze_all('feature')
