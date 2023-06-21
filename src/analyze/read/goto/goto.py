import sys
import os
import re

import argparse
from tqdm import tqdm

sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from extractFunc import ExtractFuncs

def count_goto_stmt_function(function):
    count = 0
    for i in re.finditer(r'goto', function):
        count += 1
    return count

def count_goto_stmt_file(code_file, functions=['func_1']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    goto_dict = {}
    for fname, fcode in zip(funcs_name, funcs):
        if len(functions) > 0 and fname not in functions:
            continue
        goto_dict[fname] = count_goto_stmt_function(fcode)
    return goto_dict

def gen_log(dec_file, gotos):
    logs = []
    for func in gotos:
        log_line = f"{dec_file}\t{func}\t{gotos[func]}"
        logs.append(log_line)
    return logs

def analyze_all(compilers, decompilers, optimizations, dec_dir, log_dir, func_filter):
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
            total, avg = 0, 0
            total_funcs = 0
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                logs = []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir, compiler, opt_level, decompiler, dec_file)
                    gotos = count_goto_stmt_file(dec_path, functions=func_filter)
                    for func in gotos:
                        total += gotos[func]
                        total_funcs += 1
                    log_lines = gen_log(dec_file, gotos)
                    logs.extend(log_lines)
                
                log_file = os.path.join(log_sub_dir, f"goto-{decompiler}.csv")
                log(logs, log_file)
            
                avg = round(total / total_funcs, 2)
                print("{0:12}".format(f"{total}/{avg}"), end='\t')
            print()
        print()
            
def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='goto.py', description='Goto Stmt')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-f', '--func-filter', nargs='*', help='function filter')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()

    analyze_all(args.compilers, args.decompilers, args.optimizations, args.dec, args.log, args.func_filter)
    
