import sys

import os
import re
import numpy as np
import symbolic
from tqdm import tqdm
import argparse

def process_df2(ir_dir, de_dir, log_dir):
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
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
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')

            for decompiler in decompilers:
                de_files = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                ps, rs = [], []
                for de_file in de_files:
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    ir_path = os.path.join(ir_dir, opt_level, de_file)
                    if not os.path.exists(ir_path):
                        continue

                    precision, recall, wrong_vars = symbolic.func_acc(ir_path, de_path)
                    ps.append(precision)
                    rs.append(recall)

                    log_line = f"{de_path}\t{precision}\t{recall}\t{' '.join(wrong_vars)}"
                    logs.append(log_line)

                log_path = os.path.join(log_sub_dir, f"symbolic-{decompiler}.csv")
                log(logs, log_path)
                
                p_avg, r_avg = 0, 0
                if len(ps) != 0:
                    p_avg = round(np.mean(ps), 2)
                if len(rs) != 0:
                    r_avg = round(np.mean(rs), 2)
                print("{0:12}".format(f"{p_avg}/{r_avg}"), end='\t')
            print()
        print()

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='accuarcy.py')
    parser.add_argument('-e', '--experiment', choices=['df2'], type=str, help='Datasets')
    parser.add_argument('-i', '--ir', type=str, help='execution results of IR')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.experiment == 'df2':
        process_df2(args.ir, args.dec, args.log)

