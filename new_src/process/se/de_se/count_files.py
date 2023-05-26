import sys
import os
import argparse


def count_dir(root_dir, optimizations):
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
            print("{0:15}".format(opt_level), end='\t')
            
            for decompiler in decompilers:
                sub_dir = os.path.join(root_dir, compiler, opt_level, decompiler)
                files = os.listdir(sub_dir)
                
                print("{0:12}".format(len(files)), end='\t')
            print()
        print()
                
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_null_func.py')
    parser.add_argument('-D', '--dataset', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-d', '--dir', type=str, help='Dir')
    
    args = parser.parse_args()

    if args.dataset == 'df2':
        optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
        count_dir(args.dir, optimizations)
    elif args.dataset == 'cf':
        optimizations = ['o0']
        count_dir(args.dir, optimizations)

                
                