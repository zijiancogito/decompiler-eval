import sys

import os
import argparse

import exe_no_cf

def log(log_list, log_file):
    with open(log_file, 'a') as f:
        for l  in log_list:
            f.write(f'{l}\n')
'''
def process_df2(dec_dir, save_dir, log_dir):
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['Ghidra', 'Hex-Rays', 'RetDec', 'BinaryNinja', 'angr']
    compilers = ['clang', 'gcc']
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec = os.path.join(dec_dirs, compiler, opt_level, decompiler)
                save = os.path.join(save_dir, compiler, opt_level, decompiler)
                if not os.path.exists(save):
                    os.makedirs(save)
                dec_files = os.listdir(dec)

                fail_list = []
                for dec_file in tqdm(dec_files):
                    dec_path = os.path.join(dec, dec_file)
                    save_path = os.path.join(save, f"{dec_file.split('.')[0]}.json")
                    # TODO
                    fail = exe_no_cf.process_function(dec_path, save_path)
                    if fail:
                        fail_list.append(fail)

                log_sub_dir = os.path.join(log_dir, compiler, opt_level)
                if not os.path.exists(log_sub_dir):
                    os.makedirs(log_sub_dir)
                log_file = os.path.join(log_sub_dir, log_file)
                log(fail_list, log_file)
'''

def process_df2(dec_file, save_dir, log_file):
    if not os.path.exists(save_dir):
        os.makedirs(save_dir)
    save_path = os.path.join(save_dir, f"{os.path.basename(dec_file).split('.')[0]}.json")
    fail = exe_no_cf.process_function(dec_file, save_path, 'df2')
    if fail:
        log_dir = os.path.dirname(log_file)
        if not os.path.exists(log_dir):
            os.makedirs(log_dir)
        log([dec_file], log_file)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='de_df.py')

    parser.add_argument('-e', '--exp', type=str, choices=['df2'], help="dataset to process")

    parser.add_argument('-i', '--dec', type=str, help="decompiling result dir")
    parser.add_argument('-o', '--save', type=str, help="execution result dir")
    parser.add_argument('-l', '--log', type=str, help="execution failed log dir")

    args = parser.parse_args()

    if args.exp == 'df2':
        process_df2(args.dec, args.save, args.log)

