import sys

import os
import re
import argparse
from tqdm import tqdm

import exe_no_cf

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in log_list:
            f.write(f'{l}\n')

def process_df2(ir_dirs, save_dir, log_dir): 
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    bugs = []
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dirs, opt_level))
        print(f"Executing {opt_level}...")
        fail_cnt = 0
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dirs, opt_level, ir)
            if not os.path.exists(os.path.join(save_dir, opt_level)):
                os.makedirs(os.path.join(save_dir, opt_level))
            save_path = os.path.join(save_dir, opt_level, f"{ir.split('.')[0]}.json")
            fail = exe_no_cf.process_functions(ir_path, save_path)
            if fail:
                bugs.append(f"{opt_level}\t{ir_path}")
                fail_cnt += 1
        print(f"{fail_cnt}/{len(irs)} files execution failed in {opt_level}.")

    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    log(bugs, os.path.join(log_dir, "execution_bug.log"))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='ir_se.py', description='ir symbolic execution program')
    parser.add_argument('-D', '--dataset', type=str, choices=['df2'], help="dataset to process")
    parser.add_argument('-i', '--ir', type=str, help="ir dir")
    parser.add_argument('-o', '--save', type=str, help="execution result dir")
    parser.add_argument('-l', '--log', type=str, help="execution failed log dir")

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.ir, args.save, args.log)
