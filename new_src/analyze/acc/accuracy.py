import sys

import os
import re
import numpy as np
from compare import feature, concolic
from tqdm import tqdm
import argparse

def process_df2(ir_dir, de_dir, log_dir):
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        print("---------------------------{compiler}-------------------------------")
        print("Decompiler\tO0       \tO1       \tO2       \tO3       \tOs       ")
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.join(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                print("{0:15}".format(decompiler), end='\t')
                log_path = os.path.join(log_sub_dir, f"{decompiler}.csv")
                de_files = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                ps, rs = [], []
                for de_file in tqdm(de_files):
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    ir_path = os.path.join(de_dir, opt_level, de_file)

                    precision, recall, wrong_vars = func_acc(ir_path, de_path)
                    ps.append(precision)
                    rs.append(recall)

                    log_line = f"{precision}\t{recall}\t{' '.join(wrong_vars)}"
                    logs.append(log_line)
                log(log_line, log_path)
                
                p_avg, r_avg = 0
                if len(ps) != 0:
                    p_avg = np.mean(ps)
                if len(rs) != 0:
                    r_avg = np.mean(rs)

                print(f"{ps} {rs}", end='\t')
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

