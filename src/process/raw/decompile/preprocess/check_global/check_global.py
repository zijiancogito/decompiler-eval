import os
import re
from tqdm import tqdm
import argparse

AngrG = r'^[^\s][^\n]+ g[0-9](( = ([0-9a-ex]+);[^\n]*)|(;))'


def rewrite_file(old_path, new_path, global_lines):
    new_contents = []
    with open(old_path, 'r') as f:
        old_contents = f.readlines()
        new_contents.append(old_contents[0])
        for line in global_lines:
            new_contents.append(f"    {line}")
        new_contents.extend(old_contents[1:])
    with open(new_path, 'w') as f:
        f.writelines(new_contents)

def get_globals(path):
    global_lines = []
    with open(path, 'r') as f:
        lines = f.readlines()
        for l in lines:
            if re.match(AngrG, l):
                global_lines.append(l)
    return global_lines

def check_all(root_dir, new_dir, raw_dir, compilers, optimizations, decompilers):
    for compiler in compilers:
        for opt in optimizations:
            for decompiler in decompilers:
                old_sub_dir = os.path.join(root_dir, compiler, opt, decompiler)
                new_sub_dir = os.path.join(new_dir, compiler, opt, decompiler)
                if not os.path.exists(new_sub_dir):
                    os.makedirs(new_sub_dir)
                raw_sub_dir = os.path.join(raw_dir, compiler, opt, decompiler)
                
                files = os.listdir(old_sub_dir)
                for f in tqdm(files, desc=f'{compiler}-{opt}-{decompiler}'):
                    old_path = os.path.join(old_sub_dir, f)
                    new_path = os.path.join(new_sub_dir, f"{f.split('.')[0]}.c")
                    raw_path = os.path.join(raw_sub_dir, f)
                    global_stmts = get_globals(raw_path)
                    rewrite_file(old_path, new_path, global_stmts)
                    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_global.py', description='Sample 500')
    parser.add_argument('-i', '--old-dir', type=str, help="ir dir")
    parser.add_argument('-o', '--new-dir', type=str, help="dec dir")
    parser.add_argument('-r', '--raw-dir', type=str, help="ir dir")
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
    parser.add_argument('-D', '--decompilers', nargs='+', help="Decompilers")
    parser.add_argument('-C', '--compilers', nargs='+', help="Compilers")


    args = parser.parse_args()

    check_all(args.old_dir, args.new_dir, args.raw_dir, args.compilers, args.optimizations, args.decompilers)
