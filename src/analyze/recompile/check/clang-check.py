import sys
import os
import subprocess

from tqdm import tqdm
import re

import argparse

def clang_check(path):
    opt = "--analyze"
    extra_opt = "--extra-arg"
    err_lim = "-ferror-limit=10000"
    _chk = subprocess.run(["clang-check", extra_opt, err_lim, opt, path], capture_output=True)
    return _chk.stderr.decode(encoding='utf8')
    
def parse_err(err_str):
    err_pat = r'error: ([^\n]+)'
    err_msgs = re.finditer(err_pat, err_str)
    err_filter = r'\'[^\n\']*\''
    err_dict = {}
    for e in err_msgs:
        err_type = re.sub(err_filter, '', e.group(1)).strip()
        if err_type in err_dict:
            err_dict[err_type] += 1
        else:
            err_dict[err_type] = 1
    return err_dict

def process_df2(dec_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

    logs = []
    errs = {}
    log_file = os.path.join(log_dir, f"compile-err.csv")

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                for dec_file in tqdm(dec_files, desc=f"{compiler}-{opt_level}-{decompiler}"):
                    dec_path = os.path.join(dec_dir, compiler, compiler, opt_level, decompiler, dec_file)
                    
                    err_str = clang_check(dec_path)
                    err_dict = parse_err(err_str)
                    for err_type in err_dict:
                        if err_type in errs:
                            errs[err_type] += err_dict[err_type]
                        else:
                            errs[err_type] = err_dict[err_type]
                
    for err_type in errs:
        logs.append(f"{err_type}\t{errs[err_type]}")
        print(f"{err_type}\t{errs[err_type]}")
    log(logs, log_file)

def process_cf(dec_dir, log_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0']
    
    log_file = os.path.join(log_dir, f"compile-err-{decompiler}.csv")
    logs = []
    errs = {}

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))

                for dec_file in tqdm(dec_files, desc=f"{compiler}-{opt_level}-{decompiler}"):
                    dec_path = os.path.join(dec_dir, compiler, compiler, opt_level, decompiler, dec_file)
                    
                    err_str = clang_check(dec_path)
                    err_dict = parse_err(err_str)
                    for err_type in err_dict:
                        if err_type in errs:
                            errs[err_type] += err_dict[err_type]
                        else:
                            errs[err_type] = err_dict[err_type]
                
    for err_type in errs:
        logs.append(f"{err_type}\t{errs[err_type]}")
        print(f"{err_type}\t{errs[err_type]}")
    log(logs, log_file)
    
# def process_poj

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    """
    path = "/home/eval/decompiler-eval/src/test/0-de.c"
    errors = clang_check(path)
    parse_err(errors)
    """
    parser = argparse.ArgumentParser(prog='clang-check.py')
    parser.add_argument('-D', '--dataset', choices=['df2', 'cf', 'poj'], type=str, help='Datasets')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.dec, args.log)
    elif args.dataset == 'cf':
        process_cf(args.dec, args.log)
    elif args.dataset == 'poj':
        process_df2(args.dec, args.log)
    