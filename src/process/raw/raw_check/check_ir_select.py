import sys
import os
import shutil

import argparse

def has_select(file_path):
    has = False
    with open(file_path, 'r') as f:
        content = f.read()
        if "select" in content:
            has = True
    return has

def check_dir(dir_path):
    files = os.listdir(dir_path)
    cnt = 0
    for f in files:
        f_path = os.path.join(dir_path, f)
        if has_select(f_path):
            cnt += 1
    return cnt, len(files)

def check_all(root_dir, optimizations):
    for opt_level in optimizations:
        sub_dir = os.path.join(root_dir, opt_level)
        cnt_select, cnt_all = check_dir(sub_dir)
        print(f"{opt_level}:\t{cnt_select}/{cnt_all} files has SELECT {root_dir}")
        
def remove_dir(dir_path):
    files = os.listdir(dir_path)
    cnt = 0
    for f in files:
        f_path = os.path.join(dir_path, f)
        if has_select(f_path):
            os.unlink(f_path)
            cnt += 1
    return cnt, len(files)

def remove_all(root_dir, optimizations):
    for opt_level in optimizations:
        sub_dir = os.path.join(root_dir, opt_level)
        cnt_select, cnt_all = remove_dir(sub_dir)
        print(f"{opt_level}:\t{cnt_select}/{cnt_all} files has been removed from {root_dir}")
  
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_ir_select.py', description='Check ir files which have select instruction')
    parser.add_argument('-i', '--ir', type=str, help="ir dir")
    parser.add_argument('-o', '--option', choices=['remove', 'check'], help="output dir")
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")

    args = parser.parse_args()
    
    if args.option == 'remove':
        remove_all(args.ir, args.optimizations)
    elif args.option == 'check':
        check_all(args.ir, args.optimizations)