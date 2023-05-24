import sys
import os
import argparse
import check_if
import check_poison
import check_attr
from tqdm import tqdm


def _check_if(ir_file):
    hasIf = check_if.check_file(ir_file) == False
    assert hasIf, f"{ir_file} has IF."

def _check_attr(ir_file):
    hasAttr = check_attr.check_file(ir_file) == False
    assert hasAttr == True, f"{ir_file} has Attr."

def _check_poison(ir_file):
    hasPoison = check_poison.check_file(ir_file) == False
    assert hasPoison == True, f"{ir_file} has Poison."

def check_all(ir_dir, check_options, optimizations):
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dir, opt_level))
        print(f"Checking {opt_level}...")
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dir, opt_level, ir)
            for option in check_options:
                if option == 'IF':
                    _check_if(ir_path)
                elif option == 'ATTR':
                    _check_attr(ir_path)
                elif option == 'POISON':
                    _check_poison(ir_path)
                else:
                    assert False, f"invalid check options {option}"
    print()
    print("All checked.")
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_poison.py')
    parser.add_argument('-i', '--ir', type=str, help='ir file dir')
    parser.add_argument('-o', '--opt', nargs=3, help='IF ATTR POISON') 
    parser.add_argument('-d', '--dataset', choices=['df2', 'cf'], type=str, help='Dataset')

    args = parser.parse_args()
    if args.dataset == 'df2':
        optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
        check_all(args.ir, args.opt, optimizations)
    elif args.dataset == 'cf':
        optimizations = ['o0']
        check_all(args.ir, args.opt, optimizations)
    
