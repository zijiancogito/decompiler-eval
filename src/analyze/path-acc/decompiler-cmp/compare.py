import os
import sys
import copy


def err_paths(path):
    paths = []
    with open(path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            paths.append(line.strip())
    return paths

def split_errs(errs):
    flag = 0
    common_files = set()
    for decompiler in errs:
        if flag == 0:
            common_files = common_files.union(set(errs[decompiler].keys()))
            flag = 1
        else:
            common_files = common_files.intersection(set(errs[decompiler].keys()))
    
    flag = 0
    common_errs = {}
    for decompiler in errs:
        for err_file in errs[decompiler]:
            if err_file in common_files and flag == 0:
                common_errs[err_file] = set().union(set(errs[decompiler][err_file]))
            else:
                common_errs[err_file] = common_errs[err_file].intersection(set(errs[decompiler][err_file]))
        flag = 1
    
    other_errs = {}
    for decompiler in errs:
        other_errs[decompiler] = {}
        for f in errs[decompiler]:
            if f not in common_errs:
                other_errs[decompiler][f] = copy.deepcopy(set(errs[decompiler][f]))
            else:
                other_errs[decompiler][f] = set(errs[decompiler][f]) - set(common_errs[f])
    return common_errs, other_errs

def compare_all(root_dir, log_dir, compilers, optimizations, decompilers):
    dec_errs = {}
    for decompiler in decompilers:
        dec_errs[decompiler] = {}
        for compiler in compilers:
            for opt in optimizations:
                sub_dir = os.path.join(root_dir, compiler, opt, decompiler)
                files = os.listdir(sub_dir)
                for f in files:
                    paths = err_paths(os.path.join(sub_dir, f))
                    dec_errs[decompiler][f"{compiler}-{opt}-{os.path.splitext(f)[0]}"] = paths
    
    common_errs, other_errs = split_errs(dec_errs)

    common_dir = os.path.join(log_dir, 'common')
    if not os.path.exists(common_dir):
        os.makedirs(common_dir)
    for key in common_errs:
        with open(os.path.join(common_dir, f"{key}.csv"), 'w') as f:
            for path in common_errs[key]:
                f.write(path)
                f.write('\n')       

    for decompiler in decompilers:
        out_sub_dir = os.path.join(log_dir, decompiler)
        if not os.path.exists(out_sub_dir):
            os.makedirs(out_sub_dir)
        for key in other_errs[decompiler]:
            with open(os.path.join(out_sub_dir, f"{key}.csv"), 'w') as f:
                for path in other_errs[decompiler][key]:
                    f.write(path)
                    f.write('\n')
    

if __name__ == '__main__':
    ROOT_DIR = '/home/eval/data/DSMITH/analyze/concolic'
    DECOMPILERS = ['BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    COMPILERS = ['clang', 'gcc']
    OPTIMIZATIONS = ['o0', 'o1', 'o2', 'o3', 'os']
    LOG_DIR = '/home/eval/data/DSMITH/analyze/concolic-common'
    compare_all(ROOT_DIR, LOG_DIR, COMPILERS, OPTIMIZATIONS, DECOMPILERS)
    
     