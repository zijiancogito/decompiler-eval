import sys
import os
import re

from ir_loc import get_ir_lines
from c_loc import get_c_lines

import argparse
from tqdm import tqdm

def gen_log(dec_file, dec_src, dec_ir, func_filter):
    logs = []
    for func in dec_src:
        if func in dec_ir:
            log_line = f"{dec_file}\t{func}\t{dec_src[func]}\t{dec_ir[func]}"
            logs.append(log_line)
        else:
            log_line = f"{dec_file}\t{func}\t{dec_src[func]}\t0"
            logs.append(log_line)
    for func in dec_ir:
        if func not in dec_src:
            log_line = f"{dec_file}\t{func}\t0\t{dec_ir[func]}"
            logs.append(log_line)
    for func in func_filter:
        if func not in dec_src and func not in dec_ir:
            log_line = f"{dec_file}\t{func}\t0\t0"
            logs.append(log_line)
    return logs

def analyze_all(compilers, decompilers, optimizations, dec_dir, src_dir, ir_dir, log_dir, func_filter):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0']
    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, opt_level, compiler)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
                
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                logs = []
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    ir_path = os.path.join(ir_dir, opt_level, f"{dec_file.split('.')[0]}.ll")
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_src = dec_vs_src(dec_path, src_path, func_filter)
                    dec_ir = dec_vs_ir(dec_path, ir_path, func_filter)
                    log_lines = gen_log(dec_file, dec_src, dec_ir, func_filter)
                    logs.extend(log_lines)
                log_file = os.path.join(log_sub_dir, f"loc-{decompiler}.csv")
                log(logs, log_file)
                
def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

def dec_vs_src(dec_path, src_path, functions=['func0']):
    src_loc = get_c_lines(src_path, functions)
    dec_loc = get_c_lines(dec_path, functions)

    dec_src = {}
    for func in dec_loc:
        if func not in src_loc:
            continue
        dec_src[func] = round(dec_loc[func] / src_loc[func], 2)

    return dec_src

def dec_vs_ir(dec_path, ir_path, functions=['func0']):
    ir_loc = get_ir_lines(ir_path, functions)
    dec_loc = get_c_lines(dec_path, functions)

    dec_ir = {}
    for func in dec_loc:
        if func not in ir_loc:
            continue
        dec_ir[func] = round(dec_loc[func] / ir_loc[func], 2)

    return dec_ir

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='loc.py')
    parser.add_argument('-i', '--ir', type=str, help='dir of IR')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-f', '--func-filter', nargs='+', help='function filter')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    analyze_all(args.compilers, args.decompilers, args.optimizations, args.dec, args.src, args.ir, args.log, args.func_filter)