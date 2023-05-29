import sys
import os
import re
import argparse
from tqdm import tqdm

BinaryNinja = "\*\(fsbase[^\n]+;\n[^\n]+if [^\n]+\n[^\n]+\{\n[\s]+__stack_chk_fail\(\);\n[^\n]+\n[^\n]+\}"
BinaryNinja2 = "[^\n]*fsbase[^\n]+;\n[^\n]*if [^\n]+\n[^\n]*\{\n[^\n]*__stack_chk_fail\(\);\n[^\n]*\n[^\n]*\}"
Ghidra = "if[^\n]+\{\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);"
RetDec = "if[^\n]+\{\n[^\n]+\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);\n[^\n]+return[^\n]+;"
RetDec2 = "if[^\n]+{\n[^\n]+\n[\s]+__stack_chk_fail\(\);\n[^\n]+\n[^\n]*}"

def check_chk(file_path):
    content = None
    with open(file_path, 'r') as f:
        file_content = f.read()
        if re.search(BinaryNinja, file_content):
            # print(re.search(BinaryNinja, content).group(0))
            content = re.sub(BinaryNinja, '', file_content)
        if re.search(BinaryNinja2, file_content):
            # print(re.search(BinaryNinja, content).group(0))
            content = re.sub(BinaryNinja2, '', file_content)
        elif re.search(Ghidra, file_content):
            matched = re.findall(Ghidra, file_content)
            # print(re.search(Ghidra, content).group(0))
            content = re.sub(Ghidra, matched[0], file_content)
        elif re.search(RetDec, file_content):
            # print(re.search(RetDec, content).group(0))
            matched = re.findall(RetDec, file_content)
            content = re.sub(RetDec, matched[0], file_content)
        elif re.search(RetDec2, file_content):
            content = re.sub(RetDec2, '', file_content)
    return content

def rewrite(file_path, new_content):
    with open(file_path, 'w') as f:
        f.write(new_content)

def check_df2(de_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                # log_sub_dir = os.path.join(log_dir, compiler, opt_level)
                # if not os.path.exists(log_sub_dir):
                    # os.makedirs(log_sub_dir)
                # log_file = os.path.join(log_sub_dir, f"{decompiler}.csv")

                des = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                print(f"Checking {compiler} {opt_level} {decompiler} ...")
                for de_file in tqdm(des):
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    new_func = check_chk(de_path)
                    if new_func != None:
                        rewrite(de_path, new_func)
                        logs.append(de_file)
                print(f"{len(logs)}/{len(des)} files have been rewritten")
                   
def check_cf(de_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                # log_sub_dir = os.path.join(log_dir, compiler, opt_level)
                # if not os.path.exists(log_sub_dir):
                    # os.makedirs(log_sub_dir)
                # log_file = os.path.join(log_sub_dir, f"{decompiler}.csv")

                des = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                print(f"Checking {compiler} {opt_level} {decompiler} ...")
                for de_file in tqdm(des):
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    new_func = check_chk(de_path)
                    if new_func != None:
                        rewrite(de_path, new_func)
                        logs.append(de_file)
                print(f"{len(logs)}/{len(des)} files have been rewritten")

def check(de_dir, optimizations):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:12}".format("|Angr"), end='\t')
        print("{0:12}".format("|BinaryNinja"), end='\t')
        print("{0:12}".format("|Ghidra"), end='\t')
        print("{0:12}".format("|Hex-Rays"), end='\t')
        print("{0:12}".format("|RetDec"))
        for opt_level in optimizations:
            print("{0:15}".format(opt_level), end='\t')
            for decompiler in decompilers:
                # log_sub_dir = os.path.join(log_dir, compiler, opt_level)
                # if not os.path.exists(log_sub_dir):
                    # os.makedirs(log_sub_dir)
                # log_file = os.path.join(log_sub_dir, f"{decompiler}.csv")

                des = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                for de_file in des:
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    new_func = check_chk(de_path)
                    if new_func != None:
                        # assert False, de_path
                        logs.append(de_file)
                print("{0:12}".format(f"{len(logs)}/{len(des)}"), end='\t')
            print()
        print()
    

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in tqdm(log_list):
            f.write(f'{l}\n')

if __name__ == '__main__':
    """
    cont = check_chk('/home/eval/data/DF2/process/de/gcc/o3/BinaryNinja/64.txt')
    print(cont)
    """
    parser = argparse.ArgumentParser(prog='remove_chk.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    # parser.add_argument('-l', '--log', type=str, help='log file dir')
    parser.add_argument('-d', '--dataset', type=str, choices=['df2', 'cf'], help="Dataset")
    parser.add_argument('-o', '--option', type=str, choices=['check', 'replace'], help="Option")

    args = parser.parse_args()

    if args.option == 'replace':
        if args.dataset == 'df2':
            check_df2(args.dec)
        elif args.dataset == 'cf':
            check_cf(args.dec)
    elif args.option == 'check':
        if args.dataset == 'df2':
            optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
            check(args.dec, optimizations)
        elif args.dataset == 'cf':
            optimizations = ['o0']
            check(args.dec, optimizations)

