import sys
import os
import argparse
from tqdm import tqdm

optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

def check_file(ir_path):
    """
    if there are ATTRIBUTES in ir
    return True
    """
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()

    for l in lines:
        if l.strip().startswith('attributes'):
            return True
    return False

def delete_attr(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith('attributes'):
                f.write(l)

def delete_comment(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith(';'):
                f.write(l)

def delete_all(ir_dir):
    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dir, opt_level))
        print(f"check_attr.py:\tProcessing {opt_level}...")
        for ir in tqdm(irs):
            ir_path = os.path.join(ir_dir, opt_level, ir)
            delete_attr(ir_path)
            delete_comment(ir_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='preprocess.py')
    parser.add_argument('-i', '--ir', type=str, help='ir file dir')

    args = parser.parse_args()

    delete_all(args.ir)


