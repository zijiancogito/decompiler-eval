import sys
import os
import numpy as np
import json
import argparse
from symbolic_diff import ExpDiff
import re

def func_dist(ir_path, dec_path):
    ir_json, c_json = None, None
    with open(ir_path, 'r') as f:
        ir_json = json.load(f)
    with open(dec_path, 'r') as f:
        c_json = json.load(f)
    
    assert ir_json, f"{ir_path} load failed."
    assert c_json, f"{dec_path} load failed."
    
    all_errs = 0
    for path in c_json["paths"]:
        if path in ir_json["paths"]:
            ir_exp = ir_json["paths"][path]
            c_exp = c_json["paths"][path]
            diffs = ExpDiff(ir_exp, c_exp)
            errs = diffs.count_diff
            all_errs += errs
    
    return all_errs

def analyze_all(ir_dir, dec_dir, compilers, optimizations, decompilers):
    dec_errs = {}
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:20}".format("|BinaryNinja"), end='\t')
        print("{0:20}".format("|Ghidra"), end='\t')
        print("{0:20}".format("|Hex-Rays"), end='\t')
        print("{0:20}".format("|RetDec"))
        for opt in optimizations:
            print("{0:15}".format(opt), end='\t')
            for decompiler in decompilers:
                dec_sub_dir = os.path.join(dec_dir, compiler, opt, decompiler)
                ir_sub_dir = os.path.join(ir_dir, opt)
                dec_files = os.listdir(dec_sub_dir)
                all_errs = 0
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    ir_path = os.path.join(ir_sub_dir, dec_file)
                    
                    errs = func_dist(ir_path, dec_path)
                    all_errs += errs
                if decompiler in dec_errs:
                    dec_errs[decompiler] += all_errs
                else:
                    dec_errs[decompiler] = all_errs
                print("{0:20}".format(f"{all_errs}"), end='\t')
            print()
        print()
        
    for dec in dec_errs:
        print(f"{dec}\t{dec_errs[dec]}")
        
if __name__ == '__main__':
    compilers = ['clang', 'gcc']
    decompilers = ['BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    ir_dir = '/home/eval/data/DSMITH/se-sample/ir'
    dec_dir = '/home/eval/data/DSMITH/se-sample/de1'
    
    analyze_all(ir_dir, dec_dir, compilers, optimizations, decompilers)