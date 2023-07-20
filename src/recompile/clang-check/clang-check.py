import os
import subprocess
import shutil

from tqdm import tqdm
import re

import argparse

import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools/')
import log

def clang_check(path, include_dir):
    opt = "--analyze"
    extra_opt = "--extra-arg"
    err_lim = "-ferror-limit=10000"
    extra_before = "--extra-arg-before"
    include = f"-I{os.path.abspath(include_dir)}"
    _chk = subprocess.run(["clang-check", extra_before, include, extra_opt, err_lim, opt, path], capture_output=True)
    if os.path.exists(f'{os.path.splitext(os.path.basename(path))[0]}.plist'):
        os.unlink(f'{os.path.splitext(os.path.basename(path))[0]}.plist')
    return _chk.returncode, _chk.stderr.decode(encoding='utf8')
  

def extract_err_msg(err_str):
    err_pat = r'[^\n]+(error|warning): ([^\n]+)'
    errs = []
    for l in err_str.split('\n'):
        mat = re.match(err_pat, l)
        if mat:
            errs.append(mat.group(2))
    return errs

def parse_err(err_str):
    err_pat = r'(error|warning): ([^\n]+)'
    err_msgs = re.finditer(err_pat, err_str)
    
    for e in err_msgs:
        raise NotImplementedError
      
def check_all(dec_dir, log_dir, include_dir, fail_dir, compilers, decompilers, optimizations):
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    
    for decompiler in decompilers:
        logs = []
        log_file = os.path.join(log_dir, f"raw-compile-err-{decompiler}.csv")
        
        failed_files = []
        failed_log_file = os.path.join(log_dir, f"file-compile-fail-{decompiler}.csv")
        
        for opt_level in optimizations:
            for compiler in compilers:
                failed_cnt = 0
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                fail_sub_dir = os.path.join(fail_dir, compiler, opt_level, decompiler)
                log_sub_dir = os.path.join(log_dir, decompiler, compiler, opt_level)
                if not os.path.exists(fail_sub_dir):
                    os.makedirs(fail_sub_dir)
                if not os.path.exists(log_sub_dir):
                    os.makedirs(log_sub_dir)

                dec_files = os.listdir(dec_sub_dir)
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    fail, err_str = clang_check(dec_path, include_dir)
                    if fail != 0:
                        failed_cnt += 1
                        errs = extract_err_msg(err_str)

                        log_sub_path = os.path.join(log_sub_dir, f"{dec_file}.log")
                        log.log_list2file(errs, log_sub_path)

                        logs.extend(errs)
                        failed_files.append(dec_path)
                        shutil.copy(dec_path, os.path.join(fail_sub_dir, dec_file))
                
                print(f"{decompiler}-{opt_level}-{compiler}:\t\t{failed_cnt}/{len(dec_files)} failed the check.")
                    
        logs.sort()
        log.log_list2file(logs, log_file)
        log.log_list2file(failed_files, failed_log_file)
        
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='clang-check.py')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-f', '--fail-dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-i', '--include', type=str, default='/home/eval/decompiler-eval/src/recompile/rebuild-source/headers', help='include dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    check_all(args.dec, args.log, args.include, args.fail_dec, args.compilers, args.decompilers, args.optimizations)