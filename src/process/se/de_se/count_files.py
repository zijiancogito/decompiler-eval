import sys
import os
import argparse


def count_dir(root_dir, optimizations, decompilers, compilers):
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
        
def count_ir_dir(root_dir, optimizations):

    print(f"{'-'*30}LLVM IR{'-'*30}")
    print("{0:15}".format("Optimization"), end='\t')
    print("{0:12}".format("|O0"), end='\t')
    print("{0:12}".format("|O1"), end='\t')
    print("{0:12}".format("|O2"), end='\t')
    print("{0:12}".format("|O3"), end='\t')
    print("{0:12}".format("|Os"))
    for opt_level in optimizations:
        sub_dir = os.path.join(root_dir, opt_level)
        files = os.listdir(sub_dir)
        print("{0:12}".format(len(files)), end='\t')

    print()
                
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_null_func.py')
    parser.add_argument('-d', '--dir', type=str, help='Dir')
    parser.add_argument('-o', '--options', choices=['ir', 'de'])
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()

    if args.option == 'ir':
        count_ir_dir(args.dir, args.optimizations)
    elif args.options == 'de':
        count_dir(args.dir, args.optimizations, args.decompilers, args.compilers)