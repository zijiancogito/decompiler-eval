import sys
import os
import re

import c_cycle
import ir_cycle
import argparse
from tqdm import tqdm

def process_cf(dec_dir, src_dir, ir_dir, log_dir):
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
                    ir_path = os.path.join(ir_dir, opt_level, f"{dec_file.split('.')[0]}.ll")
                    if not os.path.exists(ir_path):
                        continue
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_src = dec_vs_src(dec_path, src_path, r'func\_1')
                    dec_ir = dec_vs_ir(dec_path, ir_path, r'func\_1')
                    if 'func_1' in dec_src and 'func_1' in dec_ir:
                        log_line = f"{dec_file}\t{dec_src['func_1'][0]}\t{dec_src['func_1'][1]}\t{dec_src['func_1'][2]}\t{dec_ir['func_1'][0]}\t{dec_ir['func_1'][1]}\t{dec_ir['func_1'][2]}"
                    elif 'func_1' in dec_src and 'func_1' not in dec_ir:
                        log_line = f"{dec_file}\t{dec_src['func_1'][0]}\t{dec_src['func_1'][1]}\t{dec_src['func_1'][2]}\t0\t0\t0"
                    elif 'func_1' not in dec_src and 'func_1' in dec_ir:
                        log_line = f"{dec_file}\t0\t0\t0\t{dec_ir['func_1'][0]}\t{dec_src['func_1'][1]}\t{dec_src['func_1'][2]}"
                    else:
                        log_line = f"{dec_file}\t0\t0\t0\t0\t0\t0"
                    logs.append(log_line)
                
                log_file = os.path.join(log_sub_dir, f"cycle-{decompiler}.csv")
                log(logs, log_file)
                
def process_poj(dec_dir, src_dir, ir_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
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
                    ir_path = os.path.join(ir_dir, opt_level, f"{dec_file.split('.')[0]}.ll")
                    if not os.path.exists(ir_path):
                        continue
                    src_path = os.path.join(src_dir, f"{dec_file.split('.')[0]}.c")
                    dec_src = dec_vs_src(dec_path, src_path, '')
                    dec_ir = dec_vs_ir(dec_path, ir_path, '')
                        
                    for func in dec_src:
                        if func in dec_ir:
                            log_line = f"{dec_file}\t{func}\t{dec_src[func][0]}\t{dec_src[func][1]}\t{dec_src[func][2]}\t{dec_ir[func][0]}\t{dec_ir[func][1]}\t{dec_ir[func][2]}"
                        else:
                            log_line = f"{dec_file}\t{func}\t{dec_src[func][0]}\t{dec_src[func][1]}\t{dec_src[func][2]}\t0\t0\t0"
                        logs.append(log_line)
                    for func in dec_ir:
                        if func not in dec_src:
                            log_line = f"{dec_file}\t{func}\t0\t0\t0\t{dec_ir[func][0]}\t{dec_src[func][1]}\t{dec_src[func][2]}"
                        # log_line = f"{dec_file}\t0\t0\t0\t0\t0\t0"
                            logs.append(log_line)
                
                log_file = os.path.join(log_sub_dir, f"cycle-{decompiler}.csv")
                log(logs, log_file)

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

def dec_vs_ir(dec_path, ir_path, func_filter=r'func\_1'):
    ir_cycles = ir_cycle.get_ir_cycles(ir_path, func_filter)
    dec_cycles = c_cycle.get_c_cycles(dec_path, func_filter)

    dec_ir = {}
    for func in dec_cycles:
        if func not in ir_cycles:
            continue
        dec_ir[func] = (round(dec_cycles[func] / ir_cycles[func], 2), dec_cycles[func], ir_cycles[func])
    return dec_ir

def dec_vs_src(dec_path, src_path, func_filter=r'func\_1'):
    src_cycles = c_cycle.get_c_cycles(src_path, func_filter)
    dec_cycles = c_cycle.get_c_cycles(dec_path, func_filter)

    dec_src = {}
    for func in dec_cycles:
        if func not in src_cycles:
            continue
        dec_src[func] = (round(dec_cycles[func] / src_cycles[func], 2), dec_cycles[func], src_cycles[func])
    return dec_src

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='cycle.py', description='Cyclomatic complexity')
    parser.add_argument('-D', '--dataset', choices=['cf', 'poj'], type=str, help='Cyclomatic complexity')
    parser.add_argument('-i', '--ir', type=str, help='dir of IR')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    
    args = parser.parse_args()

    if args.dataset == 'cf':
        process_cf(args.dec, args.src, args.ir, args.log)
    elif args.dataset == 'poj':
        process_cf(args.dec, args.src, args.ir, args.log)