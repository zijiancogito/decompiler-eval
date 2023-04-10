import sys

import os
import re
import numpy as np



dec_root = '/home/eval/DF/se'
ir_root = '/home/eval/DF/se/ir'
compilers = ['clang', 'gcc']
decompilers = ['Ghidra', 'ida', 'RetDec']
options = ['o1', 'o2', 'o3', 'os']



def get_func_acc(dec_se, ir_se, option):
    if option == 'feature' or option == 'fullmatch':
        sys.path.append('../exp_tree/')
        from compare import tree_sta
        p, r = tree_sta(ir_se, dec_se, option)
        return p, r
    elif option == 'concrete':
        sys.path.append('../exp_tree')
        from concrete_execution import concrete_sta
        p, r = concrete_sta(ir_se, dec_se)
        return p, r
    return None, None

def analyze(de_dir, ir_dir, option):
    de_sub_dirs = os.listdir(de_dir)
    ps, rs = [], []
    for sub_dir in de_sub_dirs:
        ir_sub_dir = os.path.join(ir_dir, sub_dir)
        if not os.path.exists(ir_sub_dir):
            continue
        de_sub_dir = os.path.join(de_dir, sub_dir)
        funcs = os.listdir(de_sub_dir)
        for func in funcs:
            bname = func.split('.')[0]
            if not re.match('func[0-9]', bname):
                continue
            ir_json = os.path.join(ir_sub_dir, func)
            if not os.path.exists(ir_json):
                continue
            de_json = os.path.join(de_sub_dir, func)
            p, r = get_func_acc(de_json, ir_json, option)
            if p != None:
                ps.append(p)
                rs.append(r)

    ps_avg = 0.0
    rs_avg = 0.0
    if len(ps) != 0:
        ps_avg = np.mean(ps)
    if len(rs) != 0:
        rs_avg = np.mean(rs)
    return round(ps_avg, 2), round(rs_avg, 2)
    
def analyze_all(option):
    for compiler in compilers:
        print(f"---------------------------{compiler}-------------------------------")
        print("Decompiler\tO0\tO1\tO2\tO3\tOs")
        for decompiler in decompilers:
            print("{0:15}".format(decompiler), end='\t')
            for opt_level in options:
                de_dir = os.path.join(dec_root, compiler, decompiler, opt_level)
                ir_dir = os.path.join(ir_root, opt_level)
                ps, rs = analyze(de_dir, ir_dir, option)
                print(f"{ps} {rs}", end='\t')
            print()
        print()


if __name__ == '__main__':
    analyze_all('concrete')
