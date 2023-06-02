import sys
import os
import re

from ir_loc import get_ir_lines
from c_loc import get_c_lines

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
                dec_files = os.listdir(dec_dir, compiler, opt_level, decompiler)
                
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
                        log_line = f"{dec_file}\t{dec_src['func0']}\tNULL"
                    elif 'func0' not in dec_src and 'func0' in dec_ir:
                        log_line = f"{dec_file}\tNULL\t{dec_ir['func0']}"
                    else:
                        log_line = f"{dec_file}\tNULL\tNULL"

                    logs.append(log_line)

                log(logs, os.path.join(log_sub_dir, f"loc-{decompiler}.csv"))

def process_cf(dec_dir, src_dir, ir_dir, log_dir):
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
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    ir_path = os.path.join(ir_dir, f"{dec_file.split('.')[0]}.ll")
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    functions = ['func_1']
                    dec_src = dec_vs_src(dec_path, src_path, functions)
                    dec_ir = dec_vs_ir(dec_path, ir_path, functions)
                    for function in dec_src:
                        if function in dec_ir:
                            log_line = f"{dec_path}-{function}\t{dec_src[function]}\t{dec_ir[function]}"
                            logs.append(log_line)
                        else:
                            log_line = f"{dec_path}-{function}\t{dec_src[function]}\t0"
                            logs.append(log_line)
                    for function in dec_ir:
                        if function not in dec_src:
                            log_line = f"{dec_path}-{function}\t0\t{dec_ir[function]}"
                            logs.append(log_line)
                    for function in functions:
                        if function not in dec_src and function not in dec_ir:
                            log_line = f"{dec_path}-{function}\t0\t0"
                            logs.append(log_line)
                log_file = os.path.join(log_sub_dir, f"loc-{decompiler}.csv")
                log(logs, log_file)

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

def dec_vs_src(src_path, dec_path, functions=['func0']):
    src_loc = get_c_lines(src_path, functions)
    dec_loc = get_c_lines(dec_path, functions)

    dec_src = {}
    for func in dec_loc:
        if func not in src_loc:
            continue
        dec_src[func] = round(dec_loc[func] / src_loc[func], 2)

    return dec_src

def dec_vs_ir(ir_path, dec_path, functions=['func0']):
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
    parser.add_argument('-D', '--data', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-i', '--ir', type=str, help='dir of IR')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.dec, args.src, args.ir, args.log)
    elif args.dataset == 'cf':
        process_cf(args.dec, args.src, args.ir, args.log)
