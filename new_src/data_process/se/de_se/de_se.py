import sys

import os
import argparse
from tqdm import tqdm

import exe_no_cf

optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
decompilers = ['Ghidra', 'ida', 'RetDec', 'BinaryNinja', 'angr']
compilers = ['clang', 'gcc']


def process_df2(dec_dir, save_dir):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec = os.path.join(dec_dirs, compiler, opt_level, decompiler)
                save = os.path.join(save_dir, compiler, opt_level, decompiler)
                if not os.path.exists(save):
                    os.makedirs(save)
                dec_files = os.listdir(dec)
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec, dec_file)
                    save_path = os.path.join(save, f"{dec_file.split('.')[0]}.json")
                    exe_no_cf.process_function(dec_path, save_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='de_df.py')

    parser.add_argument('-e', '--exp', type=str, choices=['df2'], help="dataset to process")

    parser.add_argument('-i', '--dec', type=str, help="decompiling result dir")
    parser.add_argument('-o', '--save', type=str, help="execution result dir")

    args = parser.parse_args()

    if args.exp == 'df2':
        process_df2(args.dec, args.save)

