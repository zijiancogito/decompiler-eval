import sys
import os
import re
import json

import argparse
sys.path.append('/home/eval/decompiler-eval/src/analyze/read/exp')
from length import get_c_exp_len

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

def analyze_all(compilers, decompilers, optimizations, dec_dir, src_dir, log_dir, func_filter):
    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                
                logs = []
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_exps = get_c_exp_len(dec_path, func_filter)
                    src_exps = get_c_exp_len(src_path, func_filter)

                    log_lines = gen_log(dec_file, dec_exps, src_exps)
                    logs.extend(log_lines)

                log(logs, os.path.join(log_sub_dir, f"exp-len-{decompiler}.csv"))

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
    parser.add_argument('-f', '--func-filter', nargs='+', help='function filter')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    analyze_all(args.compilers, args.decompilers, args.optimizations, args.dec, args.src, args.log, args.func_filter)
