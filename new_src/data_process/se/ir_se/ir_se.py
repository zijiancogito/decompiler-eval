import sys

import os
import re
import argparse
from tqdm import tqdm

import exe_no_cf

optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

def process_df2(ir_dirs, save_dir): 
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dirs, opt_level))
        print(f"Executing {opt_level}...")
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dirs, opt_level, ir)
            if not os.path.exists(os.path.join(save_dir, opt_level)):
                os.makedirs(os.path.join(save_dir, opt_level))
            save_path = os.path.join(save_dir, opt_level, f"{ir.split('.')[0]}.json")
            exe_no_cf.process_functions(ir_path, save_path)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='ir_se.py', description='ir symbolic execution program')
    parser.add_argument('-e', '--exp', type=str, choices=['df2'], help="dataset to process")
    parser.add_argument('-i', '--ir', type=str, help="ir dir")
    parser.add_argument('-o', '--save', type=str, help="execution result dir")

    args = parser.parse_args()

    if args.exp == 'df2':
        process_df2(args.ir, args.save)
