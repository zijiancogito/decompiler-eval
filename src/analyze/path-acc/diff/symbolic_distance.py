import sys
import os
import numpy as np
import json
import argparse
from symbolic_diff import ExpDiff
import re

def func_dist(ir_path, dec_path, html_dir):
    ir_json, c_json = None, None
    with open(ir_path, 'r') as f:
        ir_json = json.load(f)
    with open(dec_path, 'r') as f:
        c_json = json.load(f)
    assert ir_json, f"{ir_path} load failed."
    assert c_json, f"{dec_path} load failed."
    
    all_path_dist = []
    for path in c_json["paths"]:
        if path in ir_json["paths"]:
            ir_exp = ir_json["paths"][path]
            c_exp = c_json["paths"][path]
            diffs = ExpDiff(ir_exp, c_exp)
            dist = diffs.distance()
            if dist != 0:
                sub_html_dir = os.path.join(html_dir, path)
                diffs.dump_html(sub_html_dir)
            all_tokens = total_tokens(ir_exp) + total_tokens(c_exp)
            path_dist = round(dist / all_tokens, 2)
            all_path_dist.append(path_dist)
        else:
            all_path_dist.append(1)
    avg = round(np.mean(all_path_dist), 2) if len(all_path_dist) != 0 else 1
    return avg
            
def total_tokens(obj):
    obj_s = json.dumps(obj)
    return len(re.findall('data', obj_s))

def analyze_all(ir_dir, dec_dir, log_dir, compilers, optimizations, decompilers):
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
                html_dir = os.path.join(log_dir, compiler, opt, decompiler)
                if not os.path.exists(html_dir):
                    os.makedirs(html_dir)
                
                dec_files = os.listdir(dec_sub_dir)
                
                all_avgs = 0
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    ir_path = os.path.join(ir_sub_dir, dec_file)
                    
                    html_sub_dir = os.path.join(html_dir, os.path.splitext(dec_file)[0])
                    if not os.path.exists(html_sub_dir):
                        os.makedirs(html_sub_dir)
                    
                    avg_dist = func_dist(ir_path, dec_path, html_sub_dir)
                    all_avgs += avg_dist
                avgs = round(all_avgs / len(dec_files), 2)
                print("{0:20}".format(f"{avgs}"), end='\t')
            print()
        print()
                
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='distance.py')
    parser.add_argument('-i', '--ir', type=str, help='execution results of IR')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    analyze_all(args.ir, args.dec, args.log, args.compilers, args.optimizations, args.decompilers)
                    
                    


