import os
import shutil
import random
import argparse

import sys
sys.path.append('.')
from count_pathes import get_topk
# import count_pathes 


def valid_irs(ir_dir, optimizations, topk):
    sets = set()
    for opt_level in optimizations:
        ir_sub_dir = os.path.join(ir_dir, opt_level)
        topk_set = get_topk(ir_sub_dir, topk)

        if len(sets) == 0:
            sets = set(topk_set)
        else:
            sets = sets.intersection(topk_set)
    return sets

def valid_des(de_dir, compilers, optimizations, decompilers, topk):
    sets = set()
    for compiler in compilers:
        for opt in optimizations:
            for decompiler in decompilers:
                dec_sub_dir = os.path.join(de_dir, compiler, opt, decompiler)
                topk_set = get_topk(dec_sub_dir, topk)

                if len(sets) == 0:
                    sets = set(topk_set)
                else:
                    sets = sets.intersection(topk_set)
    return sets


def sample_all(ir_dir,
               dec_dir, 
               ir_tar, 
               dec_tar, 
               compilers, 
               decompilers, 
               optimizations,
               topk,
               count):
    ir_set = valid_irs(ir_dir, optimizations, topk)
    dec_set = valid_des(dec_dir, compilers, optimizations, decompilers, topk)
    common_set = ir_set.intersection(dec_set)
    print(f"Valid IRs: {len(ir_set)}")
    print(f"Valid DECs: {len(dec_set)}")
    print(f"Valid Commons: {len(common_set)}")
    sample_set = random.choices(list(common_set), k=count)
    for opt in optimizations:
        ir_tar_sub = os.path.join(ir_tar, opt)
        if not os.path.exists(ir_tar_sub):
            os.makedirs(ir_tar_sub)
        for sample in sample_set:
            src_path = os.path.join(ir_dir, opt, sample)
            dst_path = os.path.join(ir_tar_sub, sample)
            shutil.copy(src_path, dst_path)

    for compiler in compilers:
        for opt in optimizations:
            for decompiler in decompilers:
                dec_tar_sub = os.path.join(dec_tar, compiler, opt, decompiler)
                if not os.path.exists(dec_tar_sub):
                    os.makedirs(dec_tar_sub)
                for sample in common_set:
                    src_path = os.path.join(dec_dir, compiler, opt, decompiler, sample)
                    dst_path = os.path.join(dec_tar_sub, sample)
                    shutil.copy(src_path, dst_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='sample.py', description='Sample 500')
    parser.add_argument('-i', '--ir', type=str, help="ir dir")
    parser.add_argument('-d', '--dec', type=str, help="dec dir")
    parser.add_argument('-id', '--ir-dst', type=str, help="ir dir")
    parser.add_argument('-dd', '--dec-dst', type=str, help="dec dir")
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
    parser.add_argument('-D', '--decompilers', nargs='+', help="Decompilers")
    parser.add_argument('-C', '--compilers', nargs='+', help="Compilers")
    parser.add_argument('-k', '--topk', type=int)
    parser.add_argument('-n', '--count', type=int)

    args = parser.parse_args()

    sample_all(args.ir, args.dec, args.ir_dst, args.dec_dst,
               args.compilers,
               args.decompilers,
               args.optimizations,
               args.topk,
               args.count)