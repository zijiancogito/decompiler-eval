import os
import sys
import re
import argparse

sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
import exp_tree
import json

def check_de_dir(root_dir, out):
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    all_syms = []
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sub_dir = os.path.join(root_dir, compiler, opt_level, decompiler)
                files = os.listdir(sub_dir)
                for f in files:
                    path = os.path.join(sub_dir, f)
                    tmp = func_sym(path)
                    if tmp != None:
                        all_syms.extend(tmp)
                        all_syms = list(set(all_syms))
                    
    with open(out, 'w') as f:
        for sym in all_syms:
            f.write(sym)
            f.write("\n")

def check_ir_dir(root_dir, out):
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    # compilers = ['clang', 'gcc']
    # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    all_syms = []
    for opt_level in optimizations:
        sub_dir = os.path.join(root_dir, opt_level)
        files = os.listdir(sub_dir)
        for f in files:
            path = os.path.join(sub_dir, f)
            tmp = func_sym(path)
            if tmp != None:
                all_syms.extend(tmp)
                all_syms = list(set(all_syms))
                    
    with open(out, 'w') as f:
        for sym in all_syms:
            f.write(sym)
            f.write("\n")

def func_sym(json_file):
    json_obj = None
    with open(json_file, 'r') as f:
        try:
            json_obj = json.load(f)
        except:
            json_obj = None
    if json_obj == None:
        return None
    
    all_syms = []
    for var in json_obj["expressions"]:
        exp = json_obj["expressions"][var]
        tree = exp_tree.json_to_exptree(exp)
        if tree == None:
            continue
        tree_symbols = {}
        exp_tree.op_type(tree, tree_symbols)
        all_syms.extend(tree_symbols.keys())
         
    return list(set(all_syms))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='accuarcy.py')
    parser.add_argument('-D', '--dataset', choices=['ir', 'de'], type=str, help='Datasets')
    parser.add_argument('-d', '--dir', type=str, help='execution results of DEC')
    parser.add_argument('-o', '--out', type=str, help='output file')

    args = parser.parse_args()
    
    if args.dataset == 'de':
      check_de_dir(args.dir, args.out)
    elif args.dataset == 'ir':
      check_ir_dir(args.dir, args.out)