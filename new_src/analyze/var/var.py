import sys
import os
import re
import argparse

import ir_var, c_var

def process_df2(dec_dir, src_dir, ir_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                dec_files =  os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))

                logs = []

                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    ir_path = os.path.join(ir_dir, opt_level, f"{dec_file.split('.')[0]}.ll")

                    dec_src = dec_vs_src(src_path, dec_path, ['func0'])
                    dec_ir = dec_vs_ir(ir_path, dec_path, ['func0'])

                    if 'func0' in dec_src and 'func0' in dec_ir:
                        log_line = f"{dec_file}\t{dec_src['func0']}\t{dec_ir['func0']}"
                    elif 'func0' in dec_src and 'func0' not in dec_ir:
                        log_line = f"{dec_file}\t{dec_src['func0']}\t0"
                    elif 'func0' not in dec_src and 'func0' in dec_ir:
                        log_line = f"{dec_file}\t0\t{dec_ir['func0']}"
                    else:
                        log_line = f"{dec_file}\t0\t0"
                    logs.append(log_line)

                log(logs, os.path.join(log_sub_dir, f"var-{decompiler}.csv"))
                
def process_cf(dec_dir, src_dir, ir_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    for compiler in compilers:
        log_sub_dir = os.path.join(log_dir, compiler)
        if not os.path.exists(log_sub_dir):
            os.makedirs(log_sub_dir)

        for decompiler in decompilers:
            logs = []
            
            dec_files = os.listdir(os.path.join(dec_dir, compiler, decompiler))
            for dec_file in dec_files:
                dec_path = os.path.join(dec_dir, compiler, decompiler, dec_file)
                ir_path = os.path.join(ir_dir, f"{dec_file.split('.')[0]}.ll")
                src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                dec_src = dec_vs_src(dec_path, src_path, ['func0'])
                dec_ir = dec_vs_ir(dec_path, ir_path, ['func0'])
                if 'func0' in dec_src and 'func0' in dec_ir:
                    log_line = f"{dec_file}\t{dec_src['func0']}\t{dec_ir['func0']}"
                elif 'func0' in dec_src and 'func0' not in dec_ir:
                    log_line = f"{dec_file}\t{dec_src['func0']}\t0"
                elif 'func0' not in dec_src and 'func0' in dec_ir:
                    log_line = f"{dec_file}\t0\t{dec_ir['func0']}"
                else:
                    log_line = f"{dec_file}\t0\t0"
                logs.append(log_line)
            
            log_file = os.path.join(log_sub_dir, f"var-{decompiler}.csv")
            log(logs, log_file)
            

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

def dec_vs_src(src_path, dec_path, functions=['func0']):
    src_vars = c_var.get_vars_from_file(src_path, functions)
    dec_vars = c_var.get_vars_from_file(dec_path, functions)

    dec_src = {}
    for func in dec_vars:
        if func not in src_vars:
            continue
        dec_src[func] = round(dec_vars[func] / src_vars[func], 2)
    return dec_src

def dec_vs_ir(ir_path, dec_path, functions=['func0']):
    ir_vars = ir_var.get_vars_from_file(ir_path, functions)
    dec_vars = c_var.get_vars_from_file(dec_path, functions)

    dec_ir = {}
    for func in dec_vars:
        if func not in ir_vars:
            continue
        dec_ir[func] = round(dec_vars[func] / ir_vars[func], 2)
    return dec_ir

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
    parser.add_argument('-e', '--experiment', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-i', '--ir', type=str, help='dir of IR')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.experiment == 'df2':
        process_df2(args.dec, args.src, args.ir, args.log)
    elif args.experiment == 'cf':
        process_cf(args.dec, args.src, args.ir, args.log)

