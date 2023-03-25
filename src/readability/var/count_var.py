import sys
sys.path.append('../../processData')
sys.path.append('../../utils')
sys.setrecursionlimit(10000)
import os
import csv
from tqdm import tqdm, trange

from var import *
from extractFunc import *
from utils import *


dec_root = '/home/eval/DF/de/'
dec_debug_root = '/home/eval/DF/de-debug/'
src_root = '/home/eval/DF/data'
out_root = '/home/eval/DF/var/var_count/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko','Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']

def get_funcs_from_file(file_path):
    extract_funcs = ExtractFuncs()
    funcs, funcs_name = extract_funcs.getFuncs(file_path)
    return funcs, funcs_name

def get_vars_from_file(file_path):
    funcs, funcs_name = get_funcs_from_file(file_path)
    funcs_vars = {}
    # print(file_path)
    for func, func_name in zip(funcs, funcs_name):
        code = preprocess_code(func.strip())
        vars = get_all_vars(code)
        # print(vars)
        funcs_vars[func_name] = len(vars)
    return funcs_vars

def count_vars_for_one_source(src, debug):
    basename = src.split('.')[0]
    src_path = os.path.join(src_root, src)
    src_vars = get_vars_from_file(src_path) 
    de_vars = {}
    for compiler in compilers:
        de_vars[compiler] = {}
        for decompiler in decompilers:
            de_vars[compiler][decompiler] = {}
            for option in options:
                root = dec_root if debug == False else dec_debug_root
                de_path = os.path.join(root, compiler, decompiler, option, f"{basename}.txt")
                vars = get_vars_from_file(de_path)
                de_vars[compiler][decompiler][option] = vars

    return src_vars, de_vars

def write_var_information_to_csv(src_vars, de_vars, out_csv):
    with open(out_csv, 'w') as f:
        w = csv.writer(f, delimiter=' ')
        for func in src_vars:
            if func in compiler_generated_funcs:
                continue
            if func in generated_funcs:
                continue
            if func in syscall_funcs:
                continue
            src_var_count = src_vars[func]
            de_var_count = [] 
            for compiler in compilers:
                for decompiler in decompilers:
                    for option in options:
                        if func in de_vars[compiler][decompiler][option]:
                            de_var_count.append(de_vars[compiler][decompiler][option][func])
                        else:
                            de_var_count.append(0)
            if len(de_var_count) != len(compilers) * len(decompilers) * len(options):
                print(len(de_var_count))
            w.writerow([func, src_var_count] + de_var_count)

def count_all(debug):
    srcs = os.listdir(src_root)
    for i in trange(len(srcs)):
        src = srcs[i]
        src_vars, de_vars = count_vars_for_one_source(src, debug)
        if debug == False:
            root = os.path.join(out_root, 'de')
        else:
            root = os.path.join(out_root, 'debug')
        if not os.path.exists(root):
            os.makedirs(root)
        
        out_csv = os.path.join(root, f"{src.split('.')[0]}.csv")
        write_var_information_to_csv(src_vars, de_vars, out_csv)
    
if __name__ == '__main__':
    count_all(False)
