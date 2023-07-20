import sys
import os
import argparse

from tqdm import tqdm

sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import extractFunc
from header import header_files



def extract_functions(dec, src):
    extract_func = extractFunc.ExtractFuncs()
    _, src_funcs = extract_func.getFuncs(src)
    dec_func_bodys, dec_funcs = extract_func.getFuncs(dec)

    user_defined_funcs = {}

    for fname, fbody in zip(dec_funcs, dec_func_bodys):
        if fname in src_funcs:
            user_defined_funcs[fname] = fbody
    
    return user_defined_funcs

def extract_struct(dec):
    extract_struct = extractFunc.ExtractFuncs()
    struct_list = extract_struct.getStructs(dec)
    return struct_list
    raise NotImplementedError

def extract_include(dec):
    include_list = []
    with open(dec, 'r', encoding='ISO-8859-1') as f:
        lines = f.readlines()
        for l in lines:
            if l.startswith('\#include'):
                include_list.append(l)
    return include_list

def extract_define(dec):
    define_list = []
    with open(dec, 'r', encoding='ISO-8859-1') as f:
        lines = f.readlines()
        for l in lines:
            if l.startswith('\#define'):
                define_list.append(l)
    return define_list

def build_source(dec, src, new_dec, header):
    includes = extract_include(dec)
    defines = extract_define(dec)
    # types = extract_struct(dec)
    bodys = extract_functions(dec, src)
    
    with open(new_dec, 'w') as f:
        f.write(f"#include <{header}>\n")
        f.write('\n')

        for include in includes:
            f.write(include)
        f.write('\n')

        for define in defines:
            f.write(define)
        f.write('\n')
        
        # for struct in types:
            # f.write(struct)
        # f.write('\n')
            
        for func in bodys:
            f.write(bodys[func])
        
        
def build_all(dec_dir, src_dir, new_dec_dir, compilers, decompilers, optimizations):
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                
                new_dec_sub_dir = os.path.join(new_dec_dir, compiler, opt_level, decompiler)
                if not os.path.exists(new_dec_sub_dir):
                    os.makedirs(new_dec_sub_dir)
                    
                for dec in tqdm(dec_files, desc=f"{compiler}-{opt_level}-{decompiler}"):
                    dec_path = os.path.join(dec_sub_dir, dec)
                    new_dec_path = os.path.join(new_dec_sub_dir, dec)
                    src_path = os.path.join(src_dir, dec)
                    
                    header_file = header_files[decompiler]
                    
                    build_source(dec_path, src_path, new_dec_path, header_file)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='build.py', description='Build new source')
    parser.add_argument('-o', '--new-dec', type=str, help='dir of new dec')
    parser.add_argument('-s', '--src', type=str, help='dir of SRC')
    parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()
    build_all(args.dec, args.src, args.new_dec, args.compilers, args.decompilers, args.optimizations)

