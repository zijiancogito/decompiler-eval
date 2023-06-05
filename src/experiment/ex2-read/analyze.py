import sys
import os
import argparse

sys.append('..')
import data_load
sys.path.append('/home/eval/decompiler-eval/new_src/utils/')
import math_tools

def func_cyclomatic_complexity_of_different_decompilers(root_dir, save_dir):
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
        
def func_loc_of_different_decompilers(root_dir, save_dir):
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
          
def func_var_of_different_decompilers(root_dir, save_dir):
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
                log_path = os.path.join(log_dir, f"var-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_var(log_path)
            keys = csvs['angr'].keys()
            keys.sort()

            dec_srcs = []
            dec_irs = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                dec_src = [csvs[decompiler][key][0] for key in keys]
                dec_ir = [csvs[decompiler][key][1] for key in keys]
                dec_srcs.append(dec_src)
                dec_irs.append(dec_ir)
                
            save_sub_dir = os.path.join(save_dir, 'cycle', compiler)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            dec_src_fig = os.path.join(save_sub_dir, "dec_src.png")
            math_tools.plot_multi(dec_srcs, dec_src_fig, colors, decompilers)
        
            dec_ir_fig = os.path.join(save_sub_dir, "dec_ir.png")
            math_tools.plot_multi(dec_irs, dec_ir_fig, colors, decompilers)
            
def func_loc_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_loc(log_path)
            keys = csvs['o0'].keys()
            keys.sort()

            dec_srcs, dec_irs = [], []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                dec_src = [csvs[opt_level][key][0] for key in keys]
                dec_ir = [csvs[opt_level][key][1] for key in keys]
                dec_srcs.append((xs, dec_src))
                dec_irs.append((xs, dec_ir))
                
            save_sub_dir = os.path.join(save_dir, 'loc', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
              
            dec_src_fig = os.path.join(save_sub_dir, "dec_src.png")
            math_tools.plot_multi(dec_srcs, dec_src_fig, colors, decompilers)
        
            dec_ir_fig = os.path.join(save_sub_dir, "dec_ir.png")
            math_tools.plot_multi(dec_irs, dec_ir_fig, colors, decompilers)
            
def func_var_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"var-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_loc(log_path)
            keys = csvs['o0'].keys()
            keys.sort()

            dec_srcs, dec_irs = [], []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                dec_src = [csvs[opt_level][key][0] for key in keys]
                dec_ir = [csvs[opt_level][key][1] for key in keys]
                dec_srcs.append((xs, dec_src))
                dec_irs.append((xs, dec_ir))
                
            save_sub_dir = os.path.join(save_dir, 'var', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
              
            dec_src_fig = os.path.join(save_sub_dir, "dec_src.png")
            math_tools.plot_multi(dec_srcs, dec_src_fig, colors, decompilers)
        
            dec_ir_fig = os.path.join(save_sub_dir, "dec_ir.png")
            math_tools.plot_multi(dec_irs, dec_ir_fig, colors, decompilers)
            
if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
    parser.add_argument('-d', '--dataset', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-e', '--experiment', choices=['decompilers', 'optimizations'], type=str, help='Experiments')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-s', '--save', type=str, help='figure save dir')
    
    args = parser.parse_args()
    if args.experiment == 'decompilers':
        if args.dataset == 'cf':
            func_cyclomatic_complexity_of_different_decompilers(args.log, args.save)
            func_loc_of_different_decompilers(args.log, args.save)
            func_var_of_different_decompilers(args.log, args.save)
        elif args.dataset == 'df2':
            func_loc_of_different_decompilers(args.log, args.save)
            func_var_of_different_decompilers(args.log, args.save)
    elif args.experiment == 'optimizations':
        func_loc_of_different_optimizations(args.log, args.save)
        func_var_of_different_optimizations(args.log, args.save)
            
