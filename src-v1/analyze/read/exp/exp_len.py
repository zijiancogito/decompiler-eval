import sys
import os
import re
import json

import numpy as np

import argparse
sys.path.append('/home/eval/decompiler-eval/src/analyze/read/exp')
from length import get_c_exp_len, exp_score, get_len_over_80

from tqdm import tqdm

def gen_log(dec_file, dec_exps, src_exps):
    logs = []
    for func in dec_exps:
        if func in src_exps:
            dec_exp_str = json.dumps(dec_exps[func])
            src_exp_str = json.dumps(src_exps[func])
            log_line = f"{dec_file}\t{func}\t{dec_exp_str}\t{src_exp_str}"
            logs.append(log_line)
    for func in src_exps:
        if func not in dec_exps:
            dec_exp_str = "None"
            src_exp_str = json.dumps(src_exps[func])
            log_line = f"{dec_file}\t{func}\t{dec_exp_str}\t{src_exp_str}"
            log_line = f"{dec_file}\t{func}\t{dec_exp_str}\t{src_exp_str}"
            logs.append(log_line)
    return logs

def print_line_over80(compilers, decompilers, optimizations, dec_dir):
    for decompiler in decompilers:
        print(decompiler)
        for compiler in compilers:
            for opt_level in optimizations:
                sub_dir =  os.path.join(dec_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(sub_dir)
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    get_len_over_80(dec_path)
        print()
                    

def analyze_all(compilers, decompilers, optimizations, dec_dir, src_dir, log_dir, func_filter):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        for decompiler in decompilers:
            print("{0:20}".format(decompiler), end='\t')
        print()
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')
            
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                
                logs = []
                max_dec_exps = 0
                max_src_exps = 0
                decs, srcs = [], []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_exps = get_c_exp_len(dec_path, func_filter)
                    src_exps = get_c_exp_len(src_path, func_filter)
                    avg_dec, avg_src, max_dec, max_src = exp_score(dec_exps, src_exps)
                    max_dec_exps += max_dec
                    max_src_exps += max_src
                    decs.append(avg_dec)
                    srcs.append(avg_src)
                    log_lines = gen_log(dec_file, dec_exps, src_exps)
                    logs.extend(log_lines)

                log(logs, os.path.join(log_sub_dir, f"exp-len-{decompiler}.csv"))
                
                dec_avg, src_avg = 0, 0
                if len(decs) > 0:
                    dec_avg = round(np.mean(decs), 2)
                if len(srcs) > 0:
                    src_avg = round(np.mean(srcs), 2)
                print("{0:20}".format(f"{dec_avg}/{src_avg} {max_dec_exps}/{max_src_exps}"), end='\t')
            print()
        print()

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='exp_len.py')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-o', '--opt', type=str, choices=['analyze', 'print'], help='option')
    parser.add_argument('-f', '--func-filter', nargs='*', help='function filter')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    if args.opt == 'analyze':
        analyze_all(args.compilers, args.decompilers, args.optimizations, args.dec, args.src, args.log, args.func_filter)
    elif args.opt == 'print':
        print_line_over80(args.compilers, args.decompilers, args.optimizations, args.dec)
