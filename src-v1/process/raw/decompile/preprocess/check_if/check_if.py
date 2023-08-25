import sys
import os
from tqdm import tqdm
import shutil
import argparse
import re

def check_file(dec_file):
    """
    dec_file: txt of func0
    """
    flag = False
    with open(dec_file, 'r') as f:
        if ' if' in f.read():
            flag = True
    return flag

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in tqdm(log_list):
            f.write(f'{l}\n')

def replace_file(path):
    with open(path, 'w') as f:
        f.write("void func0 () {}")

def check_dir(de_dir, move_to):
    if not os.path.exists(move_to):
        os.makedirs(move_to)
    hasIfs = []
    des = os.listdir(de_dir)
    print(f"Checking filse in {de_dir}...")
    for de in tqdm(des):
        de_path = os.path.join(de_dir, de)
        if check_file(de_path):
            shutil.move(de_path, move_to)
            replace_file(de_path)
            hasIfs.append(de_path)
    print(f"Found {len(hasIfs)}/{len(des)} files have IF") 
    print("Writing results to log file...")
    log_dir = os.path.dirname(move_to)
    decompiler = os.path.basename(move_to)
    log(hasIfs, os.path.join(log_dir, f"{decompiler}.log"))

def replace_all(de_dir, move_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                de_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                move_sub_dir = os.path.join(move_dir, compiler, opt_level, decompiler)
                check_dir(de_sub_dir, move_sub_dir)
                print()
                
def check_all(de_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        for decompiler in decompilers:
            print("{0:12}".format(decompiler), end='\t')
        print()
        for opt_level in optimizations:
            print("{0:15}".format(opt_level), end='\t')
            for decompiler in decompilers:
                de_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(de_sub_dir)
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(de_sub_dir, dec_file)
                    if check_file(dec_path):
                        logs.append(dec_path)
                        # assert False, dec_path
                print("{0:12}".format(f"{len(logs)}/{len(dec_files)}"), end='\t')
            print()
        print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_if.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    parser.add_argument('-l', '--log', type=str, help='path to save file with IF')
    parser.add_argument('-o', '--option', type=str, choices=['check', 'replace'], help='Option')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    if args.option == 'replace':
        replace_all(args.dec, args.log, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'check':
        check_all(args.dec, args.optimizations, args.decompilers, args.compilers)

