import sys
import os
import subprocess
import shutil

from tqdm import tqdm
import re

import argparse

def clang_check(path):
    opt = "--analyze"
    extra_opt = "--extra-arg"
    err_lim = "-ferror-limit=10000"
    extra_before = "--extra-arg-before"
    include = "-I/home/eval/data/POJ/raw/headers"
    _chk = subprocess.run(["clang-check", extra_before, include, extra_opt, err_lim, opt, path], capture_output=True)
    if os.path.exists(f'{os.path.splitext(os.path.basename(path))[0]}.plist'):
        os.unlink(f'{os.path.splitext(os.path.basename(path))[0]}.plist')
    return _chk.stderr.decode(encoding='utf8')
    
def parse_err(err_str):
    err_pat = r'(error|warning): ([^\n]+)'
    err_msgs = re.finditer(err_pat, err_str)
    err_filter = r'\'[^\n\']*\''
    err_dict = {}
    for e in err_msgs:
        # err_type = re.sub(err_filter, '', e.group(1)).strip()
        err_type = e.group(2)
        if err_type in err_dict:
            err_dict[err_type] += 1
        else:
            err_dict[err_type] = 1
    return err_dict

def check_all(compilers, decompilers, optimizations, dec_dir, log_dir):
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    for decompiler in decompilers:
        logs = []
        errs = {}
        log_file = os.path.join(log_dir, f"raw-compile-err-{decompiler}.csv")

        for opt_level in optimizations:
            for compiler in compilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                for dec_file in tqdm(dec_files, desc=f"{compiler}-{opt_level}-{decompiler}"):
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    
                    err_str = clang_check(dec_path)
                    logs.append(err_str)
        log(logs, log_file)


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
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    check_all(args.compilers, args.decompilers, args.optimizations, args.dec, args.log)
    