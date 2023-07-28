import os
import numpy as np
import concolic
import argparse

import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import log
import path_process

def analyze_all(ir_dir, de_dir, log_dir, compilers, decompilers, optimizations):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:20}".format("|BinaryNinja"), end='\t')
        print("{0:20}".format("|Ghidra"), end='\t')
        print("{0:20}".format("|Hex-Rays"), end='\t')
        print("{0:20}".format("|RetDec"))
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')
        
            for decompiler in decompilers:
                dec_files = os.listdir(os.path.join(de_dir, compiler, opt_level, decompiler))
                logs = []
                ps, rs = [], []
                log_err_path_dir = os.path.join(log_sub_dir, decompiler)
                if not os.path.exists(log_err_path_dir):
                    os.makedirs(log_err_path_dir)
                for dec_file in dec_files:
                    dec_path = os.path.join(de_dir, compiler, opt_level, decompiler, dec_file)
                    ir_path = os.path.join(ir_dir, opt_level, dec_file)
                    if not os.path.exists(ir_path):
                        continue
                    log_path = os.path.join(log_err_path_dir, path_process.change_ext(dec_file, 'csv', '.'))
                    precision, recall = concolic.func_acc(dec_path, ir_path, log_path)
                    ps.append(precision)
                    rs.append(recall)
                    
                    log_line = f"{dec_file}\t{precision}\t{recall}"
                    logs.append(log_line)
                
                decompiler_log_path = os.path.join(log_sub_dir, f"concolic-accuracy-{decompiler}.csv")
                log.log_list2file(logs, decompiler_log_path)
                
                p_avg = round(np.mean(ps), 2) if len(ps) != 0 else 0
                r_avg = round(np.mean(rs), 2) if len(rs) != 0 else 0
                print("{0:20}".format(f"{p_avg}/{r_avg}"), end='\t')
            print()
        print()
        
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='accuarcy.py')
    parser.add_argument('-i', '--ir', type=str, help='execution results of IR')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    analyze_all(args.ir, args.dec, args.log, args.compilers, args.decompilers, args.optimizations)

