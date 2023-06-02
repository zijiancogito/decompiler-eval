import sys
import os
import re

import argparse
from tqdm import tqdm

sys.path.append('../../../utils/functools')
from extractFunc import ExtractFuncs

def count_goto_stmt_function(function):
    count = 0
    count = re.finditer(r'goto', function)
    return count

def count_goto_stmt_file(code_file, functions=['func_1']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    goto_dict = {}
    for fname, fcode in zip(funcs_name, funcs):
        if fname not in functions:
            continue
        goto_dict[fname] = count_goto_stmt_function(fcode)
    return goto_dict

def process_cf(dec_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0']

    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                logs = []
                print(f"{compiler}-{opt_level}-{decompiler}:")
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    gotos = count_goto_stmt_file(dec_path, functions=['func_1'])
                    if 'func_1' in gotos:
                        log_line = f"{dec_path}\t{gotos['func_1']}"
                    else:
                        log_line = f"{dec_path}\t0"
                logs.append(log_line)
                
            log_file = os.path.join(log_sub_dir, f"goto-{decompiler}.csv")
            log(logs, log_file)
            
def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='goto.py', description='Goto Stmt')
    parser.add_argument('-D', '--dataset', choices=['cf'], type=str, help='Dataset')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    
    args = parser.parse_args()

    if args.dataset == 'cf':
        process_cf(args.dec, args.log)
