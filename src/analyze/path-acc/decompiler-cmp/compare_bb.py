import os
import copy

def err_bbs(err_dir):
    bb_irs = []
    bb_cs = []
    with open(os.path.join(err_dir, "unmatched-ir.csv"), 'r') as f:
        lines = f.readlines()
        for l in lines:
            bb_irs.append(l.strip())
    with open(os.path.join(err_dir, "unmatched-c.csv"), 'r') as f:
        lines = f.readlines()
        for l in lines:
            bb_cs.append(l.strip())
    
    return bb_irs, bb_cs

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
                irs = set().union(set(errs[decompiler][err_file][0]))
                cs = set().union(set(errs[decompiler][err_file][0]))
                common_errs[err_file] = (copy.deepcopy(irs), copy.deepcopy(cs))
            elif err_file in common_files and flag != 0:
                irs = common_errs[err_file][0].intersection(set(errs[decompiler][err_file][0]))
                cs = common_errs[err_file][1].intersection(set(errs[decompiler][err_file][0]))
                common_errs[err_file] = (copy.deepcopy(irs), copy.deepcopy(cs))
            else:
                continue
        flag = 1
    
    other_errs = {}
    for decompiler in errs:
        other_errs[decompiler] = {}
        for f in errs[decompiler]:
            if f not in common_errs:
                irs = set(errs[decompiler][f][0])
                cs = set(errs[decompiler][f][1])
                other_errs[decompiler][f] = (copy.deepcopy(irs), copy.deepcopy(cs))
            else:
                irs = set(errs[decompiler][f][0]) - common_errs[f][0]
                cs = set(errs[decompiler][f][1]) - common_errs[f][1]
                other_errs[decompiler][f] = (copy.deepcopy(irs), copy.deepcopy(cs))
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
                    bbs_irs, bbs_cs = err_bbs(os.path.join(sub_dir, f))
                    dec_errs[decompiler][f"{compiler}-{opt}-{f}"] = (bbs_irs, bbs_cs)
    common_errs, other_errs = split_errs(dec_errs)
    
    common_dir = os.path.join(log_dir, 'common')
    if not os.path.exists(common_dir):
        os.makedirs(common_dir)
    for key in common_errs:
        csub_dir = os.path.join(common_dir, key)
        if not os.path.exists(csub_dir):
            os.makedirs(csub_dir)
        with open(os.path.join(csub_dir, f"unmatched_irs.csv"), 'w') as f:
            f.write('\n'.join(list(common_errs[key][0])))
        with open(os.path.join(csub_dir, f"unmatched_cs.csv"), 'w') as f:
            f.write('\n'.join(list(common_errs[key][1])))
    
    for decompiler in decompilers:
        out_sub_dir = os.path.join(log_dir, decompiler)
        if not os.path.exists(out_sub_dir):
            os.makedirs(out_sub_dir)
        for key in other_errs[decompiler]:
            f_sub_dir = os.path.join(out_sub_dir, key)
            if not os.path.exists(f_sub_dir):
                os.makedirs(f_sub_dir)
            with open(os.path.join(f_sub_dir, "unmatched_irs.csv"), 'w') as f:
                f.write("\n".join(list(other_errs[decompiler][key][0])))
            with open(os.path.join(f_sub_dir, "unmatched_cs.csv"), 'w' ) as f:
                f.write("\n".join(list(other_errs[decompiler][key][0])))
        
if __name__ == '__main__':
    ROOT_DIR = '/home/eval/data/DSMITH/analyze/concolic-bb'
    DECOMPILERS = ['BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    COMPILERS = ['clang', 'gcc']
    OPTIMIZATIONS = ['o0', 'o1', 'o2', 'o3', 'os']
    LOG_DIR = '/home/eval/data/DSMITH/analyze/concolic-bb-common'
    compare_all(ROOT_DIR, LOG_DIR, COMPILERS, OPTIMIZATIONS, DECOMPILERS)
