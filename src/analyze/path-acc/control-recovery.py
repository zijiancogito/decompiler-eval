import sys
import os
import re
import numpy as np
import path_match
import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import log
import path_process

import argparse

def analyze_all(ir_dir, dec_dir, log_dir, compilers, decompilers, optimizations):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:12}".format("|BinaryNinja"), end='\t')
        print("{0:12}".format("|Ghidra"), end='\t')
        print("{0:12}".format("|Hex-Rays"), end='\t')
        print("{0:12}".format("|RetDec"))
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')

            for decompiler in decompilers:
                log_err_dir = os.path.join(log_dir, compiler, opt_level, decompiler)
                if not os.path.exists(log_err_dir):
                    os.makedirs(log_err_dir)
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                
                logs = []
                pr, pp, br, bp = [], [], [], []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    ir_path = os.path.join(ir_dir, opt_level, dec_file)
                    if not os.path.exists(ir_path):
                        continue
                    
                    log_path = os.path.join(log_err_dir, path_process.change_ext(dec_file, 'csv', '.'))
                    path_recall, path_precision, bb_recall, bb_precision = path_match.func_match(ir_path, dec_path, log_path)
                    pr.append(path_recall)
                    pp.append(path_precision)
                    br.append(bb_recall)
                    bp.append(bb_precision)
                    
                    log_line = f"{dec_file}\t{path_recall}\t{path_precision}\t{bb_recall}\t{bb_precision}"
                    logs.append(log_line)
                

                    