import os
import sys
import argparse
import shutil
from tqdm import tqdm

def change_all(compilers, decompilers, optimizations, de_dir):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                de_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                de_files = os.listdir(de_sub_dir)
                for de_file in tqdm(de_files, desc=f"{compiler}-{opt_level}-{decompiler}"):
                    de_path = os.path.join(de_sub_dir, de_file)
                    to_path = os.path.join(de_sub_dir, f"{os.path.splitext(de_file)[0]}.c")
                    shutil.move(de_path, to_path)
                    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='change_ext.py')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()

    change_all(args.compilers, args.decompilers, args.optimizations, args.dec)