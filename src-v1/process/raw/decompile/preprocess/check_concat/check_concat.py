import sys
import os
from tqdm import tqdm
import argparse
import re

AngrConcat = r'CONCAT[^\n]+'
AngrDiv = r'\/m[^\n]+'
BinjaConcat = r'COMBINE\([^\n]+\)' # HIGHW LOWW
BinjaConcatPat = r'COMBINE\(([^\n]+), [^\n]+\)'
BinjaHighw = r'HIGHW\([^\n]+\)'
BinjaHighwPat = r'HIGHW\(([^\n]+)\)'
BinjaLoww = r'LOWW\([^\n]+\)'
BinjaLowwPat = r'LOWW\(([^\n]+)\)'


def match_angr_concat(s):
    stack = []
    match_idx = -1
    flag = 0
    for i, ch in enumerate(s):
        if ch == '(':
            stack.append(ch)
        elif ch == ')':
            try:
                stack.pop()
            except:
                match_idx = i
                break
        else:
            pass
    concat_str = ""
    if match_idx != -1:
        concat_str = s[:match_idx+1]
    return concat_str


def match_binja_concat(s):
    stack = []

    match_idx = -1
    split_stack = []
    split_idx = -1
    for i, ch in enumerate(s):
        if ch == '(':
            stack.append((i, ch))
        elif ch == ')':
            tmp, _ = stack.pop()
            if not stack:
                match_idx = i
                if split_stack:
                    split_idx = split_stack[-1]
                break
            if len(split_stack) > 0 and tmp < split_stack[-1]:
                split_stack.pop()
        elif ch == ',':
            split_stack.append(i)
        else:
            pass
    
    
    concat_str = ""
    if match_idx != -1:
        concat_str = s[:match_idx+1]

    sub_str = ""
    if split_idx != -1:
        first_idx = -1
        for i, ch in enumerate(s):
            if ch == '(':
                first_idx = i
                break
        sub_str = s[first_idx+1:split_idx]
        # print(concat_str)
        # print(sub_str)
    return concat_str, sub_str
                       
def match_binja_concat2(s):
    stack = []

    match_idx = -1
    split_stack = []
    split_idx = -1
    for i, ch in enumerate(s):
        if ch == '(':
            stack.append((i, ch))
        elif ch == ')':
            tmp, _ = stack.pop()
            if not stack:
                match_idx = i
                if split_stack:
                    split_idx = split_stack[-1]
                break
            if len(split_stack) > 0 and tmp < split_stack[-1]:
                split_stack.pop()
        elif ch == ',':
            split_stack.append(i)
        else:
            pass
    
    
    concat_str = ""
    if match_idx != -1:
        concat_str = s[:match_idx+1]

    sub_str = ""
    if split_idx != -1:
        sub_str = s[split_idx + 1 : match_idx]
    return concat_str, sub_str


def change_to_regex(s):
    regex_s = []
    for i, ch in enumerate(s):
        if str.isalnum(ch):
            regex_s.append(ch)
        elif ch == ' ':
            regex_s.append(ch)
        else:
            regex_s.append(f"\{ch}")
    return "".join(regex_s)

def check_binja(dec_file):
    new_contents = []
    with open(dec_file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            tmp_line = line
            while True:
                if re.search(BinjaConcat, tmp_line):
                    matched = re.findall(BinjaConcat, tmp_line)
                    concat_str, sub_str = match_binja_concat(matched[0])
                    # rep = re.match(BinjaConcatPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                elif re.search(BinjaHighw, tmp_line):
                    matched = re.findall(BinjaHighw, tmp_line)
                    concat_str, sub_str = match_binja_concat(matched[0])
                    sub_str = re.match(BinjaHighwPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                elif re.search(BinjaLoww, tmp_line):
                    matched = re.findall(BinjaLoww, tmp_line)
                    concat_str, sub_str = match_binja_concat(matched[0])
                    sub_str = re.match(BinjaLowwPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                else:
                    new_contents.append(tmp_line)
                    break
    with open(dec_file, 'w') as f:
        for line in new_contents:
            f.write(line)

def check_binja2(dec_file):
    new_contents = []
    with open(dec_file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            tmp_line = line
            while True:
                if re.search(BinjaConcat, tmp_line):
                    matched = re.findall(BinjaConcat, tmp_line)
                    concat_str, sub_str = match_binja_concat2(matched[0])
                    # rep = re.match(BinjaConcatPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                elif re.search(BinjaHighw, tmp_line):
                    matched = re.findall(BinjaHighw, tmp_line)
                    concat_str, sub_str = match_binja_concat2(matched[0])
                    sub_str = re.match(BinjaHighwPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                elif re.search(BinjaLoww, tmp_line):
                    matched = re.findall(BinjaLoww, tmp_line)
                    concat_str, sub_str = match_binja_concat2(matched[0])
                    sub_str = re.match(BinjaLowwPat, concat_str)[1]
                    concat_str = change_to_regex(concat_str)
                    tmp_line = re.sub(concat_str, sub_str, tmp_line, 1)
                else:
                    new_contents.append(tmp_line)
                    break
    with open(dec_file, 'w') as f:
        for line in new_contents:
            f.write(line)

def check_angr(dec_file):
    with open(dec_file, 'w') as f:
        f.write("void func0() {}")
    return
"""
    new_contents = []
    with open(dec_file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            tmp_line = line
            while True:
                if re.search(AngrDiv, tmp_line):
                if re.search(AngrConcat, tmp_line):
                    matched = re.findall(AngrConcat, tmp_line)
                    for m in matched:
                        concat_str = match_angr_concat(m)
                        concat_str = change_to_regex(concat_str)
                        tmp_line = re.sub(concat_str, '', tmp_line, 1)
                else:
                    new_contents.append(tmp_line)
                    break
    for line in new_contents:
        print(line)
"""

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in log_list:
            f.write(f'{l}\n')
            
def check_file(dec_file):
    flag = False
    with open(dec_file, 'r') as f:
        cont = f.read()
        if 'CONCAT' in cont:
            flag = True
        elif 'COMBINE' in cont:
            flag = True
        elif 'HIGHW' in cont:
            flag = True
        elif 'LOWW' in cont:
            flag = True
    return flag
            
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
                        if decompiler == 'BinaryNinja':
                            check_binja(dec_path)
                        elif decompiler == 'angr':
                            check_angr(dec_path)
                        else:
                            pass
                log(logs, log_f)
                print("{0:12}".format(f"{len(logs)}/{len(dec_files)}"), end='\t')
            print()
        print()
        
def replace_all2(de_dir, log_dir, optimizations, decompilers, compilers):
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
                        if decompiler == 'BinaryNinja':
                            check_binja2(dec_path)
                        elif decompiler == 'angr':
                            check_angr(dec_path)
                        else:
                            pass
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
                        # assert False, dec_path
                print("{0:12}".format(f"{len(logs)}/{len(dec_files)}"), end='\t')
            print()
        print()
        

if __name__ == '__main__':
    """
    s = "COMBINE(temp3, temp3) / rax_2) - var_5c) & 0xa) * r13)) * 0x66666667)"
    s = "COMBINE((temp3), (temp3)) / rax_2) - var_5c) & 0xa) * r13)) * 0x66666667)"
    s = "CONCAT v9 * v10) /m v1 - *((int *)&v0) & 10) * 1717986919 >> 34) +"
    s = "CONCAT (v9 * v10) /m v1 - *((int *)&v0) & 10) * 1717986919 >> 34) +"
    s = "COMBINE((((COMBINE(temp3, temp3) / rcx_1) & 3) ^ 2), (((COMBINE(temp3, temp3) / rcx_1) & 3) ^ 2))"
    s = "HIGHW(((int64_t)rbp_1))"
    for i, ch in enumerate(s):
        print(f"{i} {ch}")
    substr = match_binja_concat(s)
    # substr = match_angr_concat(s)
    # print(substr)
    # check_binja('/home/eval/data/DF2/process/de/clang/o1/BinaryNinja/841.txt')
    # check_angr('/home/eval/data/DF2/process/de/clang/o1/angr/841.txt')
    """
    parser = argparse.ArgumentParser(prog='remove_chk.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    parser.add_argument('-l', '--log', type=str, help='log file dir')
    parser.add_argument('-o', '--option', type=str, choices=['check', 'replace', 'replace2'], help="Option")
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    if args.option == 'check':
        check_all(args.dec, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'replace':
        replace_all(args.dec, args.log, args.optimizations, args.decompilers, args.compilers)
    elif args.option == 'replace2':
        replace_all(args.dec, args.log, args.optimizations, args.decompilers, args.compilers)

    # COMBINE((((COMBINE(temp3, temp3) / rcx_1) & 3) ^ 2), (((COMBINE(temp3, temp3) / rcx_1) & 3) ^ 2)) / r15