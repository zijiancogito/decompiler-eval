import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import log
import path_process

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
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                log_err_dir = os.path.join(log_sub_dir, decompiler)
                if not os.path.exists(log_err_dir):
                    os.makedirs(log_err_dir)
                dec_files = os.listdir(dec_sub_dir)
                logs = []
                avgs, sums = [], []
                for dec_file in dec_files:
                    dec_path = os.path.join(dec_sub_dir, dec_file)
                    ir_path = os.path.join(ir_dir, opt_level, dec_file)
                    if not os.path.exists(ir_path):
                        continue
                    log_path = os.path.join(log_err_dir, path_process.change_ext(dec_file, 'csv', '.'))
                    avg_dist, sum_dist = symbolic.func_dist(dec_path, ir_path, log_path)
                    avgs.append(avg_dist)
                    sums.append(sum_dist)
                    
                    log_line = f"{dec_file}\t{avg_dist}\t{sum_dist}"
                    logs.append(log_line)
                    
                decompiler_log_path = os.path.join(log_sub_dir, f"symbolic-distance-{decompiler}.csv")
                log.log_list2file(logs, decompiler_log_path)
                
                avg_avg = round(np.mean(avgs), 2) if len(avgs) != 0 else 0.0
                sum_avg = round(np.mean(sums), 2) if len(sums) != 0 else 0.0
                print("{0:12}".format(f"{avg_avg}/{sum_avg}"), end='\t')
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

