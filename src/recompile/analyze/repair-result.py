import os
import sys

def check_fixed(fixed_dir):
    return len(os.listdir(fixed_dir))

def check_unfixed(unfixed_dir):
    return len(os.listdir(unfixed_dir))

def check_timeout(timeout_dir):
    return len(os.listdir(timeout_dir))

def check_all(fixed_dir, unfixed_dir, timeout_dir, compilers, decompilers, optimizations):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                fixed_sub_dir = os.path.join(fixed_dir, compiler, opt_level, decompiler)
                fixed_cnt = check_fixed(fixed_sub_dir)

                unfixed_sub_dir = check_unfixed(unfixed_dir)
                unfixed_cnt = check_unfixed(unfixed_sub_dir)

                timeout_sub_dir = os.path.join(timeout_dir, compiler, opt_level, decompiler)

