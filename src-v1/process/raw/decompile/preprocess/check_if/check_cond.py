import sys
import os
from tqdm import tqdm
import argparse
import re

def check_file(dec_file):
    cond_p = r' (==|!=|>|>=|<|<=) '
    flag = False
    with open(dec_file, 'r') as f:
        content = f.read()
        if re.search(cond_p, content):
            flag = True
    return flag

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in log_list:
            f.write(f'{l}\n')
            
def replace(path):
    with open(path, 'w') as f:
        f.write("void func0() {}")

def replace_all(de_dir, log_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        for decompiler in decompilers:
            print("{0:12}".format(decompiler), end='\t')
        print()
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')

            for decompiler in decompilers:
                log_f = os.path.join(log_sub_dir, f'{decompiler}.csv')
                dec_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    flag = check_file(dec_path)
                    if flag == True:
                        logs.append(dec_path)
                        replace(dec_path)
                log(logs, log_f)
                print("{0:12}".format(f"{len(logs)}/{len(dec_files)}"), end='\t')
            print()
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
                dec_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    flag = check_file(dec_path)
                    if flag == True:
                        logs.append(dec_path)
                print("{0:12}".format(f"{len(logs)}/{len(dec_files)}"), end='\t')
            print()
        print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_cond.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    parser.add_argument('-l', '--log', type=str, help='path to save file with IF')
    parser.add_argument('-o', '--option', type=str, choices=['replace', 'check'], help="Option")
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    if args.option == 'replace':
        replace_all(args.dec, args.log, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'check':
        check_all(args.dec, args.optimizations, args.decompilers, args.compilers)