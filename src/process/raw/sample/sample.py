import os
import sys
import shutil
import random
import argparse

def common_ir(ir_dir, optimizations):
    sets = set()
    idx = 0
    for opt_level in optimizations:
        ir_sub_dir = os.path.join(ir_dir, opt_level)
        if len(sets) == 0:
            sets = set([i.split('.')[0] for i in os.listdir(ir_sub_dir)])
        else:
            sets = sets.intersection(set([i.split('.')[0] for i in os.listdir(ir_sub_dir)]))
    return sets

def common_dec(dec_dir, optimizations, decompilers, compilers):
    sets = set()
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                if len(sets) == 0:
                    sets = set([i.split('.')[0] for i in os.listdir(dec_sub_dir)])
                else:
                    sets = sets.intersection([i.split('.')[0] for i in os.listdir(dec_sub_dir)])
    return sets

def sample_all(ir_dir, dec_dir, ir_tar_dir, dec_tar_dir,
               compilers, decompilers, optimizations):
    common_ir_set = common_ir(ir_dir, optimizations)
    common_dec_set = common_dec(dec_dir, optimizations, decompilers, compilers)
    common_set = common_ir_set.intersection(common_dec_set)
    sample_set = random.choices(list(common_set), 500)
    for opt_level in optimizations:
        ir_sub_dir = os.path.join(ir_dir, optimizations)
        ir_tar_sub_dir = os.path.join(ir_tar_dir, optimizations)
        if not os.path.exists(ir_tar_sub_dir):
            os.makedirs(ir_tar_sub_dir)
        for sample in sample_set:
            src_path = os.path.join(ir_sub_dir, f"{sample}.ll")
            dst_path = os.path.join(ir_tar_sub_dir, f"{sample}.ll")
            shutil.move(src_path, dst_path)

    for opt_level in optimizations:
        for compiler in compilers:
            for decompiler in decompilers:
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                dec_tar_sub_dir = os.path.join(dec_tar_dir, compiler, opt_level, decompiler)
                if not os.path.exists(dec_tar_sub_dir):
                    os.makedirs(dec_tar_sub_dir)
                    
                for sample in sample_set:
                    src = os.path.join(dec_sub_dir, f"{sample}.txt")
                    dst = os.path.join(dec_tar_sub_dir, f"{sample}.txt")
                    shutil.move(src, dst)
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='sample.py', description='Sample 500')
    parser.add_argument('-i', '--ir', type=str, help="ir dir")
    parser.add_argument('-d', '--dec', type=str, help="dec dir")
    parser.add_argument('-id', '--ir-dst', type=str, help="ir dir")
    parser.add_argument('-dd', '--dec-dst', type=str, help="dec dir")
    parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
    parser.add_argument('-D', '--decompilers', nargs='+', help="Decompilers")
    parser.add_argument('-C', '--compilers', nargs='+', help="Compilers")

    args = parser.parse_args()
    
    sample_all(args.ir, args.dec,
               args.ir_dst, args.dec_dst,
               args.compilers,
               args.decompilers,
               args.optimizations)