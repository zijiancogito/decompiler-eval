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


def func_concolic_accuracy_vs_loc(ca_dir, loc_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                ca_path = os.path.join(ca_dir, compiler, opt_level, f"concolic-accuracy-{decompiler}.csv")
                if not os.path.exists(ca_path):
                    raise FileNotFoundError
                
                loc_path = os.path.join(loc_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path.exists(loc_path):
                    raise FileNotFoundError
                  
                ca_csvs = data_load.read_from_concolic(ca_path)
                loc_csvs = data_load.read_from_loc(loc_path)
                
                keys = ca_csvs.keys()
                keys.sort()

                cas_p = []
                cas_r = []
                locs_src = []
                locs_ir = []
                for key in keys:
                    if key not in ca_csvs or key not in loc_csvs:
                        continue
                    cas_p.append(ca_csvs[key][0])
                    cas_r.append(ca_csvs[key][1])
                    locs_src.append(loc_csvs[key][0])
                    locs_ir.append(loc_csvs[key][1])

                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'concolic-accuracy-loc')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(cas_p, locs_src), (cas_p, locs_ir), (cas_r, locs_src), (cas_r, locs_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['concolic_accuracy_precision-loc_dec_src',
                          'concolic_accuracy_precision-loc_dec_ir',
                          'concolic_accuracy_recall-loc_dec_src',
                          'concolic_accuracy_recall-loc_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, colors, labels)
                
                save_fig_1 = os.path.join(save_sub_dir, f"concolic-accuracy-precision-loc-dec-src.png")
                math_tools.plot_base(cas_p, locs_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"concolic-accuracy-precision-loc-dec-ir.png")
                math_tools.plot_base(cas_p, locs_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"concolic-accuracy-recall-loc-dec-src.png")
                math_tools.plot_base(cas_r, locs_src, save_fig_3)

                save_fig_4 = os.path.join(save_sub_dir, f"concolic-accuracy-recall-loc-dec-ir.png")
                math_tools.plot_base(cas_r, locs_ir, save_fig_4)

def func_concilic_passrate_vs_loc(cp_dir, loc_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                cp_path = os.path.join(cp_dir, compiler, opt_level, f"concolic-passrate-{decompiler}.csv")
                if not os.path.exists(cp_path):
                    raise FileNotFoundError
                loc_path = os.path.join(loc_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path.exists(loc_path):
                    raise FileNotFoundError
                
                cp_csvs = data_load.read_from_passrate(cp_path)
                loc_csvs = data_load.read_from_loc(loc_path)
                
                keys = cp_csvs.keys()
                keys.sort()

                locs_src = []
                locs_ir = []
                cps = []
                for key in keys:
                    if key not in cp_csvs or key not in loc_csvs:
                        continue
                    cps.append(cp_csvs[key])
                    locs_src.append(loc_csvs[key][0])
                    locs_ir.append(loc_csvs[key][1])
                
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'concolic-passrate-loc')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)

                multi = [(cps, locs_src), (cps, locs_ir)]
                colors = ['red', 'green']
                labels = ['concolic_passrate-loc_dec_src',
                          'concolic_passrate-loc_dec_ir']
                save_fig = os.pth.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, colors, labels)

                save_fig_1 = os.path.join(save_sub_dir, f"concolic-passrate-loc-dec-src.png")
                math_tools.plot_base(cps, locs_src, save_fig_1)

                save_fig_2 = os.path.join(save_sub_dir, f"concolic-passrate-loc-dec-ir.png")
                math_tools.plot_base(cps, locs_ir, save_fig_2)

def func_symbolic_match_vs_loc(sa_dir, loc_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sa_path = os.path.join(sa_dir, compiler, opt_level, f"symbolic-match-{decompiler}.csv")
                if not os.path(sa_path):
                    raise FileNotFoundError
                
                loc_path = os.path.join(loc_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path(loc_path):
                    raise FileNotFoundError
                
                sa_csvs = data_load.read_from_symbolic(sa_path)
                loc_csvs = data_load.read_from_loc(loc_path)
                
                keys = sa_csvs.keys()
                keys.sort()

                sas_p, sas_r = [], []
                locs_src, locs_ir = [], []
                for key in keys:
                    if key not in sa_csvs or key not in loc_csvs:
                        continue
                    sas_p.append(sa_csvs[key][0])
                    sas_r.append(sa_csvs[key][1])
                    locs_src.append(loc_csvs[key][0])
                    locs_ir.append(loc_csvs[key][1])
                    
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'symbolic-match-loc')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(sas_p, locs_src), (sas_p, locs_ir), (sas_r, locs_src), (sas_r, locs_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['symbolic_match_precision-loc_dec_src', 
                          'symbolic_match_precision-loc_dec_ir',
                          'symbolic_match_recall-loc_dec_src',
                          'symbolic_match_recall-loc_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, )

                save_fig_1 = os.path.join(save_sub_dir, f"symbolic-match-precision-loc-dec-src.png")
                math_tools.plot_base(sas_p, locs_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"symbolic-match-precision-loc-dec-ir.png")
                math_tools.plot_base(sas_p, locs_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"symbolic-match-recall-loc-dec-src.png")
                math_tools.plot_base(sas_r, locs_src, save_fig_3)
                
                save_fig_4 = os.path.join(save_sub_dir, f"symbolic-match-recall-loc-dec-ir.png")
                math_tools.plot_base(sas_r, locs_ir, save_fig_4)
                
def func_symbolic_distance_vs_loc(sd_dir, loc_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sd_path = os.path.join(sd_dir, compiler, opt_level, f"symbolic-distance-{decompiler}.csv")
                if not os.path(sd_path):
                    raise FileNotFoundError
                
                loc_path = os.path.join(loc_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path(loc_path):
                    raise FileNotFoundError
                
                sd_csvs = data_load.read_from_symbolic(sd_path)
                loc_csvs = data_load.read_from_loc(loc_path)
                
                keys = sd_csvs.keys()
                keys.sort()

                sds_avg, sds_sum = [], []
                locs_src, locs_ir = [], []
                for key in keys:
                    if key not in sd_csvs or key not in loc_csvs:
                        continue
                    sds_avg.append(sd_csvs[key][0])
                    sds_sum.append(sd_csvs[key][1])
                    locs_src.append(loc_csvs[key][0])
                    locs_ir.append(loc_csvs[key][1])
                    
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'symbolic-distance-loc')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(sds_avg, locs_src), (sds_avg, locs_ir), (sds_sum, locs_src), (sds_sum, locs_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['symbolic_distance_average-loc_dec_src', 
                          'symbolic_distance_average-loc_dec_ir',
                          'symbolic_distance_sum-loc_dec_src',
                          'symbolic_distance_sum-loc_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, )

                save_fig_1 = os.path.join(save_sub_dir, f"symbolic-distance-average-loc-dec-src.png")
                math_tools.plot_base(sds_avg, locs_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"symbolic-distance-average-loc-dec-ir.png")
                math_tools.plot_base(sds_avg, locs_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"symbolic-distance-sum-loc-dec-src.png")
                math_tools.plot_base(sds_sum, locs_src, save_fig_3)
                
                save_fig_4 = os.path.join(save_sub_dir, f"symbolic-distance-sum-loc-dec-ir.png")
                math_tools.plot_base(sds_sum, locs_ir, save_fig_4)
                
def func_concolic_accuracy_vs_var(ca_dir, var_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                ca_path = os.path.join(ca_dir, compiler, opt_level, f"concolic-accuracy-{decompiler}.csv")
                if not os.path.exists(ca_path):
                    raise FileNotFoundError
                
                var_path = os.path.join(var_dir, compiler, opt_level, f"var-{decompiler}.csv")
                if not os.path.exists(var_path):
                    raise FileNotFoundError
                  
                ca_csvs = data_load.read_from_concolic(ca_path)
                var_csvs = data_load.read_from_var(var_path)
                
                keys = ca_csvs.keys()
                keys.sort()

                cas_p = []
                cas_r = []
                vars_src = []
                vars_ir = []
                for key in keys:
                    if key not in ca_csvs or key not in var_csvs:
                        continue
                    cas_p.append(ca_csvs[key][0])
                    cas_r.append(ca_csvs[key][1])
                    vars_src.append(var_csvs[key][0])
                    vars_ir.append(var_csvs[key][1])

                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'concolic-accuracy-var')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(cas_p, vars_src), (cas_p, vars_ir), (cas_r, vars_src), (cas_r, vars_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['concolic_accuracy_precision-var_dec_src',
                          'concolic_accuracy_precision-var_dec_ir',
                          'concolic_accuracy_precision-var_dec_src',
                          'concolic_accuracy_precision-var_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, colors, labels)
                
                save_fig_1 = os.path.join(save_sub_dir, f"concolic-accuracy-precision-var-dec-src.png")
                math_tools.plot_base(cas_p, vars_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"concolic-accuracy-precision-var-dec-ir.png")
                math_tools.plot_base(cas_p, vars_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"concolic-accuracy-recall-var-dec-src.png")
                math_tools.plot_base(cas_r, vars_src, save_fig_3)

                save_fig_4 = os.path.join(save_sub_dir, f"concolic-accuracy-recall-var-dec-ir.png")
                math_tools.plot_base(cas_r, vars_ir, save_fig_4)
                
def func_concilic_passrate_vs_var(cp_dir, var_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                cp_path = os.path.join(cp_dir, compiler, opt_level, f"concolic_passrate-{decompiler}.csv")
                if not os.path.exists(cp_path):
                    raise FileNotFoundError
                var_path = os.path.join(var_dir, compiler, opt_level, f"var-{decompiler}.csv")
                if not os.path.exists(var_path):
                    raise FileNotFoundError
                
                cp_csvs = data_load.read_from_passrate(cp_path)
                var_csvs = data_load.read_from_var(var_path)
                
                keys = cp_csvs.keys()
                keys.sort()

                vars_src = []
                vars_ir = []
                cps = []
                for key in keys:
                    if key not in cp_csvs or key not in var_csvs:
                        continue
                    cps.append(cp_csvs[key])
                    vars_src.append(var_csvs[key][0])
                    vars_ir.append(var_csvs[key][1])
                
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'concolic-passrate-var')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)

                multi = [(cps, vars_src), (cps, vars_ir)]
                colors = ['red', 'green']
                labels = ['concolic_passrate-var_dec_src',
                          'concolic_passrate-var_dec_ir']
                save_fig = os.pth.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, colors, labels)

                save_fig_1 = os.path.join(save_sub_dir, f"concolic-passrate-var-dec-src.png")
                math_tools.plot_base(cps, vars_src, save_fig_1)

                save_fig_2 = os.path.join(save_sub_dir, f"concolic-passrate-var-dec-ir.png")
                math_tools.plot_base(cps, vars_ir, save_fig_2)
                
def func_symbolic_match_vs_var(sa_dir, var_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sa_path = os.path.join(sa_dir, compiler, opt_level, f"symbolic-match-{decompiler}.csv")
                if not os.path(sa_path):
                    raise FileNotFoundError
                
                var_path = os.path.join(var_dir, compiler, opt_level, f"var-{decompiler}.csv")
                if not os.path(var_path):
                    raise FileNotFoundError
                
                sa_csvs = data_load.read_from_symbolic(sa_path)
                var_csvs = data_load.read_from_var(var_path)
                
                keys = sa_csvs.keys()
                keys.sort()

                sas_p, sas_r = [], []
                vars_src, vars_ir = [], []
                for key in keys:
                    if key not in sa_csvs or key not in var_csvs:
                        continue
                    sas_p.append(sa_csvs[key][0])
                    sas_r.append(sa_csvs[key][1])
                    vars_src.append(var_csvs[key][0])
                    vars_ir.append(var_csvs[key][1])
                    
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'symbolic-match-var')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(sas_p, vars_src), (sas_p, vars_ir), (sas_r, vars_src), (sas_r, vars_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['symbolic_match_precision-var_dec_src', 
                          'symbolic_match_precision-var_dec_ir',
                          'symbolic_match_recall-var_dec_src',
                          'symbolic_match_recall-var_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, )

                save_fig_1 = os.path.join(save_sub_dir, f"symbolic-match-precision-var-dec-src.png")
                math_tools.plot_base(sas_p, vars_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"symbolic-match-precision-var-dec-ir.png")
                math_tools.plot_base(sas_p, vars_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"symbolic-match-recall-var-dec-src.png")
                math_tools.plot_base(sas_r, vars_src, save_fig_3)
                
                save_fig_4 = os.path.join(save_sub_dir, f"symbolic-match-recall-var-dec-ir.png")
                math_tools.plot_base(sas_r, vars_ir, save_fig_4)
                
def func_symbolic_distance_vs_var(sd_dir, var_dir, save_dir):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                sd_path = os.path.join(sd_dir, compiler, opt_level, f"symbolic-distance-{decompiler}.csv")
                if not os.path(sd_path):
                    raise FileNotFoundError
                
                var_path = os.path.join(var_dir, compiler, opt_level, f"loc-{decompiler}.csv")
                if not os.path(var_path):
                    raise FileNotFoundError
                
                sd_csvs = data_load.read_from_symbolic(sd_path)
                var_csvs = data_load.read_from_loc(var_path)
                
                keys = sd_csvs.keys()
                keys.sort()

                sds_avg, sds_sum = [], []
                vars_src, vars_ir = [], []
                for key in keys:
                    if key not in sd_csvs or key not in var_csvs:
                        continue
                    sds_avg.append(sd_csvs[key][0])
                    sds_sum.append(sd_csvs[key][1])
                    vars_src.append(var_csvs[key][0])
                    vars_ir.append(var_csvs[key][1])
                    
                save_sub_dir = os.path.join(save_dir, compiler, opt_level, decompiler, 'symbolic-distance-var')
                if not os.path.exists(save_sub_dir):
                    os.makedirs(save_sub_dir)
                
                multi = [(sds_avg, vars_src), (sds_avg, vars_ir), (sds_sum, vars_src), (sds_sum, vars_ir)]
                colors = ['red', 'green', 'blue', 'yellow']
                labels = ['symbolic_distance_average-var_dec_src', 
                          'symbolic_distance_average-var_dec_ir',
                          'symbolic_distance_sum-var_dec_src',
                          'symbolic_distance_sum-var_dec_ir']
                save_fig = os.path.join(save_sub_dir, f"multi.png")
                math_tools.plot_multi(multi, save_fig, )

                save_fig_1 = os.path.join(save_sub_dir, f"symbolic-distance-average-var-dec-src.png")
                math_tools.plot_base(sds_avg, vars_src, save_fig_1)
                
                save_fig_2 = os.path.join(save_sub_dir, f"symbolic-distance-average-var-dec-ir.png")
                math_tools.plot_base(sds_avg, vars_ir, save_fig_2)
                
                save_fig_3 = os.path.join(save_sub_dir, f"symbolic-distance-sum-var-dec-src.png")
                math_tools.plot_base(sds_sum, vars_src, save_fig_3)
                
                save_fig_4 = os.path.join(save_sub_dir, f"symbolic-distance-sum-var-dec-ir.png")
                math_tools.plot_base(sds_sum, vars_ir, save_fig_4)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='analyze.py')
    parser.add_argument('-d', '--dataset', choices=['df2'], type=str, help='Datasets')
    parser.add_argument('-ca', '--concolic-accuracy', type=str, help='log dir')
    parser.add_argument('-cp', '--concolic-passrate', type=str, help='log dir')
    parser.add_argument('-sa', '--symbolic-match', type=str, help='log dir')
    parser.add_argument('-sd', '--symbolic-distance', type=str, help='log dir')
    parser.add_argument('-loc', '--loc', type=str, help='log dir')
    parser.add_argument('-var', '--var', type=str, help='log dir')
    parser.add_argument('-s', '--save', type=str, help='figure save dir')
    
    args = parser.parse_args()

    if args.dataset == 'df2':
        func_concolic_accuracy_vs_loc(args.concolic_accuracy, args.loc, args.save)
        func_concilic_passrate_vs_loc(args.concolic_passrate, args.loc, args.save)
        func_concolic_accuracy_vs_var(args.concolic_accuracy, args.var, args.save)
        func_concilic_passrate_vs_var(args.concolic_passrate, args.var, args.save)

        func_symbolic_match_vs_loc(args.symbolic_match, args.loc, args.save)
        func_symbolic_distance_vs_loc(args.symbolic_distance, args.loc, args.save)
        func_symbolic_match_vs_var(args.symbolic_match, args.var, args.save)
        func_symbolic_distance_vs_var(args.symbolic_distance, args.var, args.save)
        