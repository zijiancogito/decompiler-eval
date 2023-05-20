import sys
import os
import re
import numpy as np
import matplotlib.pyplot as plt
import argparse

sys.path.append('../')
import data_load
sys.path.append('/home/eval/decompiler-eval/new_src/utils/')
import math_tools

# different decompiler on one optimization level

def function_concolic_accuracy_of_different_decompilers(root_dir, save_dir):
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
                log_path = os.path.join(log_dir, f"concolic-accuracy-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_concolic(log_path)
            
            keys = csvs['angr'].keys()
            keys.sort()

            precisions = []
            recalls = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                precision = [csvs[decompiler][key][0] for key in keys]
                recall = [csvs[decompiler][key][1] for key in keys]
                precisions.append((xs, precision))
                recalls.append((xs, recall))
            
            save_sub_dir = os.path.join(save_dir, 'concolic-accuracy', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)

            precision_fig = os.path.join(save_sub_dir, f"precision.png")
            math_tools.plot_multi(precisions, precision_fig, colors, decompilers)

            recall_fig = os.path.join(save_sub_dir, f"recall.png")
            math_tools.plot_multi(recall, recall_fig, colors, decompilers)

def function_concolic_passrate_of_different_decompilers(root_dir, save_dir):
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
                log_path = os.path.join(log_dir, f"concolic-passrate-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_passrate(log_path)
                
            keys = csvs['angr'].keys()
            keys.sort()

            passrates = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                passrate = [csvs[decompiler][key] for key in keys]
                passrates.append((xs, passrate))
                
            save_sub_dir = os.path.join(save_dir, 'concolic-passrate', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            passrate_fig = os.path.join(save_sub_dir, f"passrate.png")
            math_tools.plot_multi(passrates, passrate_fig, colors, decompilers)

def function_symbolic_match_of_different_decompilers(root_dir, save_dir):
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
                log_path = os.path.join(log_dir, f"symbolic-match-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_symbolic(log_path)

            keys = csvs['angr'].keys()
            keys.sort()

            precisions = []
            recalls = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                precision = [csvs[decompiler][key][0] for key in keys]
                recall = [csvs[decompiler][key][1] for key in keys]
                precisions.append((xs, precision))
                recalls.append((xs, recall))
                
            save_sub_dir = os.path.join(save_dir, 'symbolic-passrate', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            precision_fig = os.path.join(save_sub_dir, f"precision.png")
            math_tools.plot_multi(precisions, precision_fig, colors, decompilers)
            
            recall_fig = os.path.join(save_sub_dir, f"recall.png")
            math_tools.plot_multi(recall, recall_fig, colors, decompilers)

def function_symbolic_distance_of_different_decompilers(root_dir, save_dir):
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
                log_path = os.path.join(log_dir, f"symbolic-distance-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_distance(log_path)

            keys = csvs['angr'].keys()
            keys.sort()

            avgs = []
            sums = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                _avg = [csvs[decompiler][key][0] for key in keys]
                _sum = [csvs[decompiler][key][1] for key in keys]
                avgs.append((xs, _avg))
                sums.append((xs, _sum))
                
            save_sub_dir = os.path.join(save_dir, 'symbolic-distance', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            avg_fig = os.path.join(save_sub_dir, f"average.png")
            math_tools.plot_multi(avgs, avg_fig, colors, decompilers)
            
            sum_fig = os.path.join(save_sub_dir, f"sum.png")
            math_tools.plot_multi(sums, sum_fig, colors, decompilers)
        
def function_concolic_accuracy_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"concolic-accuracy-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_concolic(log_path)
            keys = csvs['o0'].keys()
            keys.sort()

            precisions = []
            recalls = []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                precision = [csvs[opt_level][key][0] for key in keys]
                recall = [csvs[opt_level][key][1] for key in keys]
                precisions.append((xs, precision))
                recalls.append((xs, recall))
            
            save_sub_dir = os.path.join(save_dir, 'concolic-accuracy', decompiler, compiler)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            precision_fig = os.path.join(save_sub_dir, "precision.png")
            math_tools.plot_multi(precisions, precision_fig, colors, optimizations)

            recall_fig = os.path.join(save_dir, "recall.png")
            math_tools.plot_multi(recall, recall_fig, colors, optimizations)

def function_concolic_passrate_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"concolic-passrate-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_passrate(log_path)
            keys = csvs['o0'].keys()
            keys.sort()
            
            passrates = []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                passrate = [csvs[opt_level][key][0] for key in keys]
                passrates.append(passrate)
                
            save_sub_dir = os.path.join(save_dir, 'concolic-passrate', decompiler, compiler)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
            
            passrate_fig = os.path.join(save_sub_dir, "passrate.png")
            math_tools.plot_multi(passrates, passrate_fig, colors, optimizations)
            
def function_symbolic_match_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"symbolic-match-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_symbolic(log_path)
            keys = csvs['o0'].keys()
            keys.sort()
            
            precisions = []
            recalls = []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                precision = [csvs[opt_level][key][0] for key in keys]
                recall = [csvs[opt_level][key][1] for key in keys]
                precisions.append((xs, precision))
                recalls.append((xs, recall))
            
            save_sub_dir = os.path.join(save_dir, 'symbolic-match', decompiler, compiler)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            precision_fig = os.path.join(save_sub_dir, "precision.png")
            math_tools.plot_multi(precisions, precision_fig, colors, optimizations)

            recall_fig = os.path.join(save_dir, "recall.png")
            math_tools.plot_multi(recall, recall_fig, colors, optimizations)
            
def function_symbolic_distance_of_different_optimizations(root_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    colors = ['red', 'green', 'blue', 'yellow', 'orange']

    for decompiler in decompilers:
        for compiler in compilers:
            csvs = {}
            for opt_level in optimizations:
                log_path = os.path.join(root_dir, compiler, opt_level, f"symbolic-distance-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[opt_level] = data_load.read_from_distance(log_path)
            keys = csvs['o0'].keys()
            keys.sort()

            avgs = []
            sums = []
            xs = list(range(len(keys)))
            for opt_level in optimizations:
                _avg = [csvs[opt_level][key][0] for key in keys]
                _sum = [csvs[opt_level][key][1] for key in keys]
                avgs.append(_avg)
                sums.append(_sum)
            
            save_sub_dir = os.path.join(save_dir, 'symbolic-distance', decompiler, compiler)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
            
            avg_fig = os.path.join(save_sub_dir, f"average.png")
            math_tools.plot_multi(avgs, avg_fig, colors, optimizations)
            
            sum_fig = os.path.join(save_sub_dir, f"sum.png")
            math_tools.plot_multi(sums, sum_fig, colors, optimizations)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
    parser.add_argument('-d', '--dataset', choices=['df2'], type=str, help='Datasets')
    parser.add_argument('-e', '--experiment', choices=['decompilers', 'optimizations'], type=str, help='Experiments')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-s', '--save', type=str, help='figure save dir')

    args = parser.parse_args()

    if args.experiment == 'decompilers':
        function_concolic_accuracy_of_different_decompilers(args.log, args.save)
        function_concolic_passrate_of_different_decompilers(args.log, args.save)
        function_symbolic_match_of_different_decompilers(args.log, args.save)
        function_symbolic_distance_of_different_decompilers(args.log, args.save)
    elif args.experiment == 'optimizations':
        function_concolic_accuracy_of_different_optimizations(args.log, args.save)
        function_concolic_passrate_of_different_optimizations(args.log, args.save)
        function_symbolic_match_of_different_optimizations(args.log, args.save)
        function_symbolic_distance_of_different_optimizations(args.log, args.save)