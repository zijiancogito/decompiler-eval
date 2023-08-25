
import sys

import os
import re
import argparse
import llvmlite.binding as llvm
import shutil
from tqdm import tqdm

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()


def check_file(ir_file):
    """
    if there are POISON in ir
    return True
    """
    content = None
    with open(ir_file, 'r') as f:
        content = f.read().strip()
    if content == None:
        return True
    try:
        mod = llvm.parse_assembly(content)
        return False
    except:
        return True

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in tqdm(log_list):
            f.write(l)
            f.write('\n')

def replace_file(path):
    with open(path, 'w') as f:
        f.write("")

def check_all(ir_dir, move_to, optimizations):
    hasPoisons = []
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dir, opt_level))
        move_path = os.path.join(move_to, opt_level)
        if not os.path.exists(move_path):
            os.makedirs(move_path)
        print(f"check_poison.py:\tProcessing {opt_level}...")
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dir, opt_level, ir)
            if check_file(ir_path):
                # replace_file(ir_path)
                shutil.move(ir_path, move_path)
                hasPoisons.append(f"{opt_level}\t{ir}")
    print("Writing results to log file...")
    log(hasPoisons, os.path.join(move_to, 'log.txt'))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_poison.py')
    parser.add_argument('-i', '--ir', type=str, help='raw ir file dir')
    parser.add_argument('-o', '--out', type=str, help='path to save file with poison')
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
    
    args = parser.parse_args()
    check_all(args.ir, args.out, args.optimizations)