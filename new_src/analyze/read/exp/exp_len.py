import sys
import os
import re
import json

import argparse
sys.path.append('.')
from length import get_c_exp_len

def process_df2(dec_dir, src_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                dec_files = os.listdir(dec_dir, compiler, opt_level, decompiler)
                
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")

                    dec_exps = get_c_exp_len(dec_path, ['func0'])
                    src_exps = get_c_exp_len(src_path, ['func0'])

                    if 'func0' in dec_exps and 'func0' in src_exps:
                        dec_exp_str = json.dump(json.load(dec_exps))
                        src_exp_str = json.dump(json.load(src_exps))
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    elif 'func0' in dec_exps and 'func0' not in src_exps:
                        dec_exp_str = json.dump(json.load(dec_exps))
                        src_exp_str = "None"
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    elif 'func0' not in dec_exps and 'func0' in src_exps:
                        dec_exp_str = "None"
                        src_exp_str = json.dump(json.load(src_exps))
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    else: 
                        dec_exp_str = "None"
                        src_exp_str = "None"
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    logs.append(log_line)
                log(logs, os.path.join(log_sub_dir, f"exp-len-{decompiler}.csv"))

def process_cf(dec_dir, src_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0']
    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                dec_files = os.listdir(dec_dir, compiler, opt_level, decompiler)
                
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")

                    dec_exps = get_c_exp_len(dec_path, ['func_1'])
                    src_exps = get_c_exp_len(src_path, ['func_1'])

                    if 'func_1' in dec_exps and 'func_1' in src_exps:
                        dec_exp_str = json.dump(json.load(dec_exps))
                        src_exp_str = json.dump(json.load(src_exps))
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    elif 'func_1' in dec_exps and 'func_1' not in src_exps:
                        dec_exp_str = json.dump(json.load(dec_exps))
                        src_exp_str = "None"
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    elif 'func_1' not in dec_exps and 'func_1' in src_exps:
                        dec_exp_str = "None"
                        src_exp_str = json.dump(json.load(src_exps))
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    else: 
                        dec_exp_str = "None"
                        src_exp_str = "None"
                        log_line = f"{dec_file}\t{dec_exp_str}\t{src_exp_str}"
                    logs.append(log_line)
                log(logs, os.path.join(log_sub_dir, f"exp-len-{decompiler}.csv"))

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='exp_len.py')
    parser.add_argument('-D', '--data', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.dec, args.src, args.log)
    elif args.dataset == 'cf':
        process_cf(args.dec, args.src, args.log)
