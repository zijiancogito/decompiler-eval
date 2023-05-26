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
                avgs, sums = [], []
                for de_file in de_files:
                    de_path = os.path.join(de_dir, compiler, opt_level, decompiler, de_file)
                    ir_path = os.path.join(ir_dir, opt_level, de_file)
                    if not os.path.exists(ir_path):
                        continue

                    avg_distance, sum_distance = symbolic.func_dist(ir_path, de_path)
                    avgs.append(avg_distance)
                    sums.append(sum_distance)

                    log_line = f"{de_file}\t{avg_distance}\t{sum_distance}"
                    logs.append(log_line)

                log_path = os.path.join(log_sub_dir, f"symbolic-match-{decompiler}.csv")
                log(logs, log_path)
                
                avg_avg, sum_avg = 0, 0
                if len(avgs) != 0:
                    avg_avg = round(np.mean(avgs), 2)
                if len(sums) != 0:
                    sum_avg = round(np.mean(sums), 2)
                print("{0:12}".format(f"{avg_avg}/{sum_avg}"), end='\t')
            print()
        print()

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='accuarcy.py')
    parser.add_argument('-D', '--dataset', choices=['df2'], type=str, help='Datasets')
    parser.add_argument('-i', '--ir', type=str, help='execution results of IR')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.ir, args.dec, args.log)

