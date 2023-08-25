import sys
import os
import matplotlib.pyplot as plt
import argparse

sys.path.append('..')
import data_load
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import math_tools

def func_concolic_accuracy_of_different_decompilers(root_dir, save_dir, compilers, optimizations, decompilers, colors):
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
                csvs[decompiler] = data_load.read_from_path_acc(log_path)
            
            keys = list(csvs['angr'].keys())
            keys.sort()

            precisions = []
            recalls = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                precision = [csvs[decompiler][key][0] for key in keys]
                recall = [csvs[decompiler][key][1] for key in keys]
                precisions.append(precision)
                recalls.append(recall)
            
            save_sub_dir = os.path.join(save_dir, 'concolic-accuracy', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)

            precision_fig = os.path.join(save_sub_dir, f"precision.png")
            # math_tools.plot_multi(precisions, precision_fig, colors, decompilers)
            math_tools.plot_multi_stems2(xs, precisions, precision_fig, colors, decompilers)
            # math_tools.plot_stems(xs, precisions, precision_fig, colors, decompilers)

            recall_fig = os.path.join(save_sub_dir, f"recall.png")
            # math_tools.plot_multi(recalls, recall_fig, colors, decompilers)
            math_tools.plot_multi_stems2(xs, recalls, recall_fig, colors, decompilers)
            # math_tools.plot_stems(xs, recalls, recall_fig, colors, decompilers)
            
def func_symbolic_distance_of_different_decompilers(root_dir, save_dir, compilers, optimizations, decompilers, colors):
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
                csvs[decompiler] = data_load.read_from_path_dist(log_path)

            keys = list(csvs['angr'].keys())
            keys.sort()

            avgs = []
            sums = []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                _avg = [csvs[decompiler][key][0] for key in keys]
                _sum = [csvs[decompiler][key][1] for key in keys]
                avgs.append(_avg)
                sums.append(_sum)
                
            save_sub_dir = os.path.join(save_dir, 'symbolic-distance', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            avg_fig = os.path.join(save_sub_dir, f"average.png")
            math_tools.plot_multi_stem(xs, avgs, avg_fig, colors, decompilers)
            
            sum_fig = os.path.join(save_sub_dir, f"sum.png")
            math_tools.plot_multi_stem(xs, sums, sum_fig, colors, decompilers)
            
def func_control_recovery_of_different_decompilers(root_dir, save_dir, compilers, optimizations, decompilers, colors)：
    for compiler in compilers:
        for opt_level in optimizations:
            log_dir = os.path.join(root_dir, compiler, opt_level)
            if not os.path.exists(log_dir):
                raise FileNotFoundError

            csvs = {}
            for decompiler in decompilers:
                log_path = os.path.join(log_dir, f"control-recovery-{decompiler}.csv")
                if not os.path.exists(log_path):
                    raise FileNotFoundError
                csvs[decompiler] = data_load.read_from_path_match(log_path)

            keys = list(csvs['angr'].keys())
            keys.sort()

            prs, pps = [], []
            brs, bps = [], []
            xs = list(range(len(keys)))
            for decompiler in decompilers:
                _pr = [csvs[decompiler][key][0] for key in keys]
                _pp = [csvs[decompiler][key][1] for key in keys]
                _br = [csvs[decompiler][key][2] for key in keys]
                _bp = [csvs[decompiler][key][3] for key in keys]
                prs.append(_pr)
                pps.append(_pp)
                brs.append(_br)
                bps.append(_bp)
                
            save_sub_dir = os.path.join(save_dir, 'control-recovery', compiler, opt_level)
            if not os.path.exists(save_sub_dir):
                os.makedirs(save_sub_dir)
                
            avg_fig = os.path.join(save_sub_dir, f"pr.png")
            math_tools.plot_multi_stem(xs, prs, avg_fig, colors, decompilers)
            
            sum_fig = os.path.join(save_sub_dir, f"br.png")
            math_tools.plot_multi_stem(xs, brs, sum_fig, colors, decompilers)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
    parser.add_argument('-e', '--experiment', choices=['decompilers', 'optimizations'], type=str, help='Experiments')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    parser.add_argument('-s', '--save', type=str, help='figure save dir')
    parser.add_argument('-P', '--colors', nargs='+', help='Colors')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    if args.experiment == 'decompilers':
        func_concolic_accuracy_of_different_decompilers(args.log, args.save, args.compilers, args.optimizations, args.decompilers, args.colors)
        # func_concolic_passrate_of_different_decompilers(args.log, args.save, args.compilers, args.optimizations, args.decompilers, args.colors)
        # func_symbolic_match_of_different_decompilers(args.log, args.save, args.compilers, args.optimizations, args.decompilers, args.colors)
        # func_symbolic_distance_of_different_decompilers(args.log, args.save, args.compilers, args.optimizations, args.decompilers, args.colors)