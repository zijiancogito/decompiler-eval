import sys
import os
import argparse

sys.append('..')
import data_load
sys.path.append('/home/eval/decompiler-eval/new_src/utils/')
import math_tools

def function_cyclomatic_complexity_of_different_decompilers(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for compiler in compilers:
        log_dir = os.path.join(root_dir, compiler)
        if not os.path.exists(log_dir):
            raise FileNotFoundError

        csvs = {}
        for decompiler in decompilers:
            log_path = os.path.join(log_dir, f"cycle-{decompiler}.csv")
            if not os.path.exists(log_path):
                raise FileNotFoundError
            csvs[decompiler] = data_load.read_from_cycle(log_path)
          
        keys = csvs['angr'].keys()
        keys.sort()

        dec_srcs = []
        dec_irs = []
        xs = list(range(len(keys)))
        for decompiler in decompilers:
            dec_src = [csvs[decompiler][key][0] for key in keys]
            dec_ir = [csvs[decompiler][key][1] for key in keys]
            dec_srcs.append((xs, dec_src))
            dec_irs.append((xs, dec_ir))
            
        save_sub_dir = os.path.join(save_dir, 'cycle', compiler)
        if not os.path.exists(save_sub_dir):
            os.makedirs(save_sub_dir)
          
        dec_src_fig = os.path.join(save_sub_dir, "dec_src.png")
        math_tools.plot_multi(dec_srcs, dec_src_fig, colors, decompilers)
        
        dec_ir_fig = os.path.join(save_sub_dir, "dec_ir.png")
        math_tools.plot_multi(dec_irs, dec_ir_fig, colors, decompilers)
        
def function_loc_of_different_decompilers(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for compiler in compilers:
        for opt_level in optimizations:
            log_dir = os.path.join(root_dir, compiler, opt_level)
            if not os.path.exists(log_dir):
                raise FileNotFoundError
            
            csvs = {}
            for decompiler in decompilers:
                log_path = os.path.join(log_dir, f"loc-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_loc(log_path)
            keys = csvs['angr'].keys()
            keys.sort()

            dec_srcs, dec_irs = [], []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                dec_src = [csvs[decompiler][key][0] for key in keys]
                dec_ir = [csvs[decompiler][key][1] for key in keys]
                dec_srcs.append((xs, dec_src))
                dec_irs.append((xs, dec_ir))

            save_sub_dir = os.path.join(save_dir, 'loc', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
              
            dec_src_fig = os.path.join(save_sub_dir, "dec_src.png")
            math_tools.plot_multi(dec_srcs, dec_src_fig, colors, decompilers)
        
            dec_ir_fig = os.path.join(save_sub_dir, "dec_ir.png")
            math_tools.plot_multi(dec_irs, dec_ir_fig, colors, decompilers)
          
def function_loc_of_different_decompilers(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']
