import sys
import os
import logging
import re
import argparse
from tqdm import tqdm

sys.path.append('../../utils/functools')
import extract_func


CHK1 = "\*\(fsbase[^\n]+;\n[^\n]+if [^\n]+\n[^\n]+\{\n[\s]+__stack_chk_fail\(\);\n[^\n]+\n[^\n]+\}"
CHK2 = "[^\n]*fsbase[^\n]+;\n[^\n]*if [^\n]+\n[^\n]*\{\n[^\n]*__stack_chk_fail\(\);\n[^\n]*\n[^\n]*\}"
CHK3 = "if[^\n]+\{\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);"
CHK4 = "if[^\n]+\{\n[^\n]+\n[^\n]+(return[^\n]+;)\n[^\n]+\}\n[^\n]+\n[^\n]+__stack_chk_fail\(\);\n[^\n]+return[^\n]+;"
CHK5 = "if[^\n]+{\n[^\n]+\n[\s]+__stack_chk_fail\(\);\n[^\n]+\n[^\n]*}"

CONCAT1 = r'COMBINE\([^\n]+\)' # HIGHW LOWW
CONCAT1_PAT = r'COMBINE\(([^\n]+), [^\n]+\)'
CONCAT2 = r'HIGHW\([^\n]+\)'
CONCAT2_PAT = r'HIGHW\(([^\n]+)\)'
CONCAT3 = r'LOWW\([^\n]+\)'
CONCAT3_PAT = r'LOWW\(([^\n]+)\)'

def extract_functions(src_path, filter):
    funcs = extract_func.get_functions(src_path)

    cnt = 0
    with open(src_path, 'w') as f:
        for func in funcs:
            if func in filter:
                f.write(funcs[func])
                f.write('\n')
                cnt += 1
    if cnt == 0:
        return -1
    else:
        return 0
    
def delete_chk(src_path):
    content = None
    with open(src_path, 'r') as f:
        tmp = f.read()

        if re.search(CHK1, tmp):
            content = re.sub(CHK1, '', tmp)
            logging.error(f"")
        elif re.search(CHK2, tmp):
            content = re.sub(CHK2, '', tmp)
        elif re.search(CHK3, tmp):
            content = re.sub(CHK3, '', tmp)
        elif re.search(CHK4, tmp):
            content = re.sub(CHK4, '', tmp)
        elif re.search(CHK5, tmp):
            content = re.sub(CHK5, '', tmp)

    with open(src_path, 'w') as f:
        f.write(content)
    
def match_concat(s):
    stack = []
    match_idx = -1
    split_stack = []
    split_idx = -1
    for i, ch in enumerate(s):
        if ch == '(':
            stack.append(i)
        elif ch == ')':
            tmp = stack.pop()
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
        concat_str = s[:match_idx + 1]

    sub_str = ""
    if split_idx != -1:
        first_idx = -1
        for i, ch in enumerate(s):
            if ch == '(':
                first_idx = i
                break
        sub_str = s[first_idx + 1 : split_idx]

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


def delete_concat(src_path):
    content = []
    with open(src_path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            tmp = line
            while True:
                if re.search(CONCAT1, tmp):
                    matched = re.findall(CONCAT1, tmp)
                    c_str, s_str = match_concat(matched[0])
                    c_str = change_to_regex(c_str)
                    tmp = re.sub(c_str, s_str, tmp, 1)
                elif re.match(CONCAT2, tmp):
                    matched = re.findall(CONCAT2, tmp)
                    c_str, s_str = match_concat(matched[0])
                    s_str = re.match(CONCAT2_PAT, c_str)[1]
                    c_str = change_to_regex(c_str)
                    tmp = re.sub(c_str, s_str, tmp, 1)
                elif re.match(CONCAT3, tmp):
                    matched = re.findall(CONCAT3, tmp)
                    c_str, s_str = match_concat(matched[0])
                    s_str = re.match(CONCAT3_PAT, c_str)[1]
                    c_str = change_to_regex(c_str)
                    tmp = re.sub(c_str, s_str, tmp, 1)
                else:
                    content.append(tmp)
                    break

    with open(src_path, 'w') as f:
        for line in content:
            f.write(line)
                       

def process(src_dir, passes=[], func_filter=""):
    src_files = os.listdir(src_dir)
    err_cnt = 0
    for src_file in tqdm(src_files):
        src_path = os.path.join(src_dir, src_file)
        res = extract_functions(src_path, func_filter)
        if res == -1:
            logging.error('Fail to decompile {src_path}.')
            err_cnt += 1
            continue
        else:
            logging.info(f'Decompile the file {src_path}.')
            if 'chk' in passes:
                delete_chk(src_path)
                logging.info(f"Check chk function for the file {src_path}.")
            if 'concat' in passes:
                delete_concat(src_path)
                logging.info(f"Check concat for the file {src_path}.")
    print(f"{err_cnt}/{len(src_files)} files failed to decompile.")

def check(src_dir):
    src_files = os.listdir(src_dir)
    con_cnt = 0
    chk_cnt = 0
    for src_file in tqdm(src_files):
        src_path = os.path.join(src_dir, src_file)
        with open(src_path, 'r') as f:
            code = f.read()
            
            if 'COMBINE' in code or 'HIGHW' in code or 'LOWW' in code:
                logging.error(f"File {src_path} has invalid token CONCAT.")
                con_cnt += 1
            if 'stack_chk_fail' in code:
                logging.error(f"File {src_path} has invalid __stack_chk_fail() function.")
                chk_cnt += 1
    print(f"{con_cnt}/{len(src_files)} files failed to pass the concat check.")
    print(f"{chk_cnt}/{len(src_files)} files failed to pass the chk check.")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Preprocess Dec files.')
    parser.add_argument('--src', type=str, required=True, help='Path to source code')
    parser.add_argument('--log', type=str, required=True, help='Path to logging')
    parser.add_argument('--opt', choices=['pro', 'chk'], required=True, help='Options')
    parser.add_argument('--pass', nargs='+', required='True', help='Checking passes.')
    parser.add_argument('--func-filter', nargs='+', required='True', help='Function filter.')

    args = parser.parse_args()

    if not os.path.exists(os.path.dirname(args.log)):
        os.makedirs(os.path.dirname(args.log))
        
    logging.basicConfig(filename=args.log,
                        encoding='utf-8', 
                        format='%(asctime)s %(filename)s : %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %A %H:%M:%S',
                        level=logging.DEBUG,
                        filemode='a')
    
    if args.opt == 'pro':
        process(args.src, args.pass, args.func_filter)
    elif args.opt == 'chk':
        check(args.src)