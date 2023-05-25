import sys
import os
import re
import argparse
from tqdm import tqdm

BinaryNinja = "\*\(fsbase[^\n]+;\n[^\n]+if [^\n]+\n[^\n]+\{\n[\s]+__stack_chk_fail\(\);\n[^\n]+\n[^\n]+\}"
Ghidra = "if[^\n]+\{\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);"
RetDec = "if[^\n]+\{\n[^\n]+\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);\n[^\n]+return[^\n]+;"

def check_chk(file_path):
    content = None
    with open(file_path, 'r') as f:
        file_content = f.read()
        if re.search(BinaryNinja, file_content):
            # print(re.search(BinaryNinja, content).group(0))
            content = re.sub(BinaryNinja, '', file_content)
        elif re.search(Ghidra, file_content):
            matched = re.findall(Ghidra, file_content)
            # print(re.search(Ghidra, content).group(0))
            content = re.sub(Ghidra, matched[0], file_content)
        elif re.search(RetDec, file_content):
            # print(re.search(RetDec, content).group(0))
            matched = re.findall(RetDec, file_content)
            content = re.sub(RetDec, matched[0], file_content)
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
    

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in tqdm(log_list):
            f.write(f'{l}\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='remove_chk.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    # parser.add_argument('-l', '--log', type=str, help='log file dir')
    parser.add_argument('-d', '--dataset', type=str, choices=['df2', 'cf'], help="Dataset")

    args = parser.parse_args()

    if args.dataset == 'df2':
        check_df2(args.dec)
    elif args.dataset == 'cf':
        check_cf(args.dec)

