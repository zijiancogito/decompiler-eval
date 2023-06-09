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

def replace_all(de_dir, optimizations, decompilers, compilers):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
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
    # parser.add_argument('-d', '--dataset', type=str, choices=['df2', 'cf'], help="Dataset")
    parser.add_argument('-o', '--option', type=str, choices=['check', 'replace'], help="Option")
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    if args.option == 'replace':
        replace_all(args.dec, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'check':
        check_all(args.dec, args.optimizations, args.decompilers, args.compilers)

