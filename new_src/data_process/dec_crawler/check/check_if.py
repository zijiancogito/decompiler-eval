import sys
import os
from tqdm import tqdm
import shutil

def check_file(dec_file):
    """
    dec_file: txt of func0
    """
    # TODO: 
    if hasIf:
        return True
    return False

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in tqdm(log_list):
            f.write(f'{l}\n')

def check_dir(de_dir, move_to):
    is not os.path.exists(move_to):
        os.makedirs(move_to)
    hasIfs = []
    des = os.listdir(de_dir)
    print(f"Checking filse in {de_dir}...")
    for de in tqdm(des):
        de_path = os.path.join(de_dir, de)
        if check_file(de_path):
            shutil.move(de_path, move_to)
            hasIfs.append(ir)
    print("Writing results to log file...")
    log_dir = os.path.dirname(move_to)
    decompiler = os.path.basename(move_to)
    log(hasIfs, os.path.join(log_dir, f"{decompiler}.log"))

def check_all(de_dir, move_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['Ghidra', 'ida', 'RetDec', 'BinaryNinja', 'angr']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                de_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                move_sub_dir = os.path.join(move_dir, compiler, opt_level, decompiler)
                check_dir(de_sub_dir, move_sub_dir)
                print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_if.py')

    parser.add_argument('-i', '--dec', type=str, help='raw dec file dir')
    parser.add_argument('-o', '--out', type=str, help='path to save file with IF')

    args = parser.parse_args()

    check_all(args.ir, args.out)
