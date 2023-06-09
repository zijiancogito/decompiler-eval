import sys
import os
import argparse
from tqdm import tqdm

def check(dec_dir, ir_dir, optimizations, decompilers, compilers):
    # compilers = ['clang', 'gcc']
    # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    for compiler in compilers:
        for opt_level in optimizations:
            ir_files = [f.split('.')[0] for f in os.listdir(os.path.join(ir_dir, opt_level))]

            for decompiler in decompilers:
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                print(f"{compiler}-{opt_level}-{decompiler}:")
                cnt = 0
                for dec_file in tqdm(dec_files):
                    if dec_file.split('.')[0] not in ir_files:
                        dec_path = os.path.join(dec_sub_dir, dec_file)
                        os.unlink(dec_path)
                        cnt += 1
                print(f"Unlink {cnt}/{len(dec_files)} files.")
                        
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='remove_not_in_ir.py')

    parser.add_argument('-i', '--ir', type=str, help='ir file dir')
    parser.add_argument('-d', '--dec', type=str, help='dec file dir')
    # parser.add_argument('-D', '--dataset', type=str, choices=['df2', 'cf'], help="Dataset")
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    

    args = parser.parse_args()
    
    check(args.dec, args.ir, args.optimizations, args.decompilers, args.compilers)