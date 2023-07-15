import sys
import os
import numpy as np
import symbolic
import argparse

def analyze_all(ir_dir, dec_dir, log_dir, compilers, optimizations, decompilers):
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
                dec_files = os.listdir(os.path.join(dec_dir, compiler, opt_level, decompiler))
                logs = []
                avgs, sums = [], []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_dir)
    