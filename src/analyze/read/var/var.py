import sys
import os
import re
import argparse

import ir_var, c_var

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
    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)

            for decompiler in decompilers:
                logs = []
                
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    ir_path = os.path.join(ir_dir, opt_level, f"{dec_file.split('.')[0]}.ll")
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_src = dec_vs_src(dec_path, src_path, func_filter)
                    dec_ir = dec_vs_ir(dec_path, ir_path, func_filter)
                    log_lines = gen_log(dec_file, dec_src, dec_ir, func_filter)
                    logs.extend(log_lines)
                
                log_file = os.path.join(log_sub_dir, f"var-{decompiler}.csv")
                log(logs, log_file)

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

def dec_vs_src(dec_path, src_path, functions=['func0']):
    src_vars = c_var.get_vars_from_file(src_path, functions)
    dec_vars = c_var.get_vars_from_file(dec_path, functions)

    dec_src = {}
    for func in dec_vars:
        if func not in src_vars:
            continue
        if src_vars[func] == 0:
            dec_src[func] = 0
        else:
            dec_src[func] = round(dec_vars[func] / src_vars[func], 2)
    return dec_src

def dec_vs_ir(dec_path, ir_path, functions=['func0']):
    ir_vars = ir_var.get_vars_from_file(ir_path, functions)
    dec_vars = c_var.get_vars_from_file(dec_path, functions)

    dec_ir = {}
    for func in dec_vars:
        if func not in ir_vars:
            continue
        if ir_vars[func] == 0:
            dec_ir[func] = 0
        else:
            dec_ir[func] = round(dec_vars[func] / ir_vars[func], 2)
    return dec_ir

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
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

