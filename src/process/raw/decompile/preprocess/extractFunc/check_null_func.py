import os
import sys
import re
import argparse

def isNullFunc(path, null_template):
    check_flag = False
    with open(path, 'r') as f:
        if re.match(null_template, f.read().strip()):
            check_flag = True
    return check_flag
  
def check_all(de_dir, log_dir, optimizations, null_template, decompilers, compilers):
    # compilers = ['clang', 'gcc']
    # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        for decompiler in decompilers:
            print("{0:12}".format(decompiler), end='\t')
        print()
        for opt_level in optimizations:
            print("{0:15}".format(opt_level), end='\t')
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)

            for decompiler in decompilers:
                dec_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_dir)
                null_cnt = 0
                logs = []
                for dec_file in dec_files:
                    if isNullFunc(os.path.join(dec_dir, dec_file), null_template):
                        null_cnt += 1
                        logs.append(os.path.join(dec_dir, dec_file))
                
                print("{0:12}".format(f"{null_cnt}/{len(dec_files)}"), end='\t')
                
                log_file = os.path.join(log_sub_dir, f"{decompiler}.csv")
                log(logs, log_file)
              
            print()
        print()
        
def log(logs, log_file):
    with open(log_file, 'w') as f:
        for line in logs:
            f.write(f"{line}\n")

df2_template = r"void func0\(\) \{\}"
cf_template = r"void func_1\(\) \{\}"
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_null_func.py')
    parser.add_argument('-t', '--template', choices=['df2', 'cf', 'poj'], type=str, help='Datasets')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help="Log")
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()

    check_all(args.dec, args.log, args.optimizations, args.template, args.decompilers, args.compilers)
