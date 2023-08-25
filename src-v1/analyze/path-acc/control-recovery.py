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
                    # if not os.path.exists(ir_path):
                        # continue
                    
                    log_path = os.path.join(log_err_dir, path_process.change_ext(dec_file, 'csv', '.'))
                    flag, path_recall, path_precision, bb_recall, bb_precision = path_match.func_match(ir_path, dec_path, log_path)
                    if flag == 0:
                        if path_recall != -1:
                            pr.append(path_recall)
                        if path_precision != -1: 
                            pp.append(path_precision)
                        if bb_recall != -1:
                            br.append(bb_recall)
                        if bb_precision != -1:
                            bp.append(bb_precision)
                    
                    log_line = f"{dec_file}\t{path_recall}\t{path_precision}\t{bb_recall}\t{bb_precision}"
                    logs.append(log_line)

                decompiler_log_path = os.path.join(log_sub_dir, f"control-recovery-{decompiler}.csv")
                log.log_list2file(logs, decompiler_log_path)
                
                pr_avg = round(np.mean(pr), 2) if len(pr) != 0 else 0
                pp_avg = round(np.mean(pp), 2) if len(pp) != 0 else 0
                br_avg = round(np.mean(br), 2) if len(br) != 0 else 0
                bp_avg = round(np.mean(bp), 2) if len(bp) != 0 else 0
                print("{0:20}".format(f"{pp_avg}/{pr_avg}/{bp_avg}/{br_avg}"), end='\t')
            print()
        print()
                
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='path.py')
    parser.add_argument('-i', '--ir', type=str, help='execution results of IR')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    analyze_all(args.ir, args.dec, args.log, args.compilers, args.decompilers, args.optimizations)


                    