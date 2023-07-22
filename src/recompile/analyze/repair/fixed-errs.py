import os
import argparse
from tqdm import tqdm

import sys
sys.path.append('../../../utils/functools')
import log

def check_all(fixed_dir, err_dir, log_dir, compilers, optimizations, decompilers):
    # fixed_errs_without_tok = {}
    # fixed_errs_with_tok = {}
    for decompiler in decompilers:
        fixed_errs_without_tok = list()
        fixed_errs_with_tok = list()
        for compiler in compilers:
            for opt in optimizations:
                fixed_sub_dir = os.path.join(fixed_dir, compiler, opt, decompiler)
                err_msg_dir = os.path.join(err_dir, decompiler, compiler, opt)
                
                fixed_files = os.listdir(fixed_sub_dir)
                for fixed_file in fixed_files:
                    err_log_sub_dir= os.path.join(err_msg_dir, f"{fixed_file.split('.')[0]}")
                    msgs_without_tok_path = os.path.join(err_log_sub_dir, "msgs-without-tok.csv")
                    msgs_with_tok_path = os.path.join(err_log_sub_dir, "msgs-with-tok.csv")
                    with open(msgs_without_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            fixed_errs_without_tok.append(msg)
                    with open(msgs_with_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            fixed_errs_with_tok.append(msg)
        fixed_errs_without_tok = list(set(fixed_errs_without_tok))
        fixed_errs_with_tok = list(set(fixed_errs_with_tok))
        log1_path = os.path.join(log_dir, f"fixed-without-tok-{decompiler}.csv")
        log2_path = os.path.join(log_dir, f"fixed-with-tok-{decompiler}.csv")

        log.log_list2file(fixed_errs_without_tok, log1_path) 
        log.log_list2file(fixed_errs_with_tok, log2_path)
        

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='err-type.py')

    parser.add_argument('-f', '--fixed-dir', type=str, help='dir of DEC')
    parser.add_argument('-m', '--msg-dir', type=str, help='log dir')
    parser.add_argument('-l', '--log-dir', type=str, help='log dir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='log dir')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    
    check_all(args.fixed_dir, args.msg_dir, args.log_dir, args.compilers, args.optimizations, args.decompilers)
                
