import sys
import os
import re

import argparse

cond_pattern = r'.*(\?).*(\:).*'

def has_cond(file_path):
    has = False
    with open(file_path, 'r') as f:
        content = f.readlines()
        for line in content:
            if re.match(cond_pattern, line):
                has = True
                break
    return has

def check_dir(dir_path):
    files = os.listdir(dir_path)
    cnt = 0
    for f in files:
        f_path = os.path.join(dir_path, f)
        if has_cond(f_path):
            cnt += 1
    return cnt, len(files)

def check_all(root_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sub_dir = os.path.join(root_dir, compiler, opt_level, decompiler)
                cnt_select, cnt_all = check_dir(sub_dir)
                print(f"{'{0:30}'.format(f'{compiler}-{opt_level}-{decompiler}')}:\t{cnt_select}/{cnt_all} files has SELECT in {root_dir}")

def remove_dir(dir_path):
    files = os.listdir(dir_path)
    cnt = 0
    for f in files:
        f_path = os.path.join(dir_path, f)
        if has_cond(f_path):
            os.unlink(f_path)
            cnt += 1
    return cnt, len(files)
                    
def remove_all(root_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sub_dir = os.path.join(root_dir, compiler, opt_level, decompiler)
                cnt_select, cnt_all = remove_dir(sub_dir)
                print(f"{'{0:30}'.format(f'{compiler}-{opt_level}-{decompiler}')}:\t{cnt_select}/{cnt_all} files has been removed from {root_dir}")
            
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_c_condexp.py', description='Check dec files which have ?: expressions')
    parser.add_argument('-d', '--dir', type=str, help="dir")
    parser.add_argument('-o', '--option', choices=['check', 'remove'], help="output dir")
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
    parser.add_argument('-D', '--decompilers', nargs='+', help="Decompilers")
    parser.add_argument('-C', '--compilers', nargs='+', help="Compilers")

    args = parser.parse_args()
    
    if args.option == 'remove':
        remove_all(args.dir, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'check':
        check_all(args.dir, args.optimizations, args.decompilers, args.compilers)
  