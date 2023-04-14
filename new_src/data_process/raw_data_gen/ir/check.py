import sys
import os
import argparse
import check_if
import check_poison
import check_attr
from tqdm import tqdm

optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

def check(ir_file):
    hasIf = check_if.check_file(ir_file) == False
    assert hasIf, f"{ir_file} has IF."

    hasAttr = check_attr.check_file(ir_file) == False
    assert hasAttr == True, f"{ir_file} has Attr."

    hasPoison = check_poison.check_file(ir_file) == False
    assert hasPoison == True, f"{ir_file} has Poison."

def check_all(ir_dir):
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dir, opt_level))
        print(f"Checking {opt_level}...")
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dir, opt_level, ir)
            check(ir_path)
    print()
    print("All checked.")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_poison.py')
    parser.add_argument('-i', '--ir', type=str, help='ir file dir')

    args = parser.parse_args()

    check_all(args.ir)
    
