import sys
sys.path.append('./')
import os
import matplotlib.pyplot as plt
import numpy as np
import re

from func_var import func_var
from ir_var import get_functions
from var import get_func_from_file

sys.path.append('../../se/ce/')
from concrete_execution import func_acc

sys.path.append("../../exp_tree")
from compare import feature_acc

sys.path.append('../../../analyze/tools/')
from my_math import average_x_y

def relation_file(src, ir, dec, dec_se_dir, ir_se_dir):
    src_funcs, src_funcs_name = get_func_from_file(src)
    ir_vars = get_functions(ir)
    funcs, funcs_name = get_func_from_file(dec)
    vars = []
    ir_ratios = []
    accus = []

    src_funcs_map = {}
    for fname, fcode in zip(src_funcs_name, src_funcs):
        src_funcs_map[fname] = fcode

    for fname, fcode in zip(funcs_name, funcs):
        if not re.match('func[0-9]', fname):
            continue
        if fname not in src_funcs_name:
            continue
        if fname not in ir_vars:
            continue

        se_json = os.path.join(dec_se_dir, f"{fname}.json")
        ir_json = os.path.join(ir_se_dir, f"{fname}.json")
        if not os.path.exists(se_json):
            continue
        if not os.path.exists(ir_json):
            continue

        src_vars = func_var(src_funcs_map[fname])
        if src_vars == 0:
            continue
        dec_vars = func_var(fcode)
        src_dec_ratio = round(dec_vars / src_vars, 2)
        ir_dec_ratio = round(dec_vars / ir_vars[fname], 2)
        dec_accu = feature_acc(ir_json, se_json)
        vars.append(src_dec_ratio)
        ir_ratios.append(ir_dec_ratio)
        accus.append(dec_accu)

    return vars, ir_ratios, accus

def scatter_hist(x, y, ax, ax_histx, ax_histy):
    # no labels
    ax_histx.tick_params(axis="x", labelbottom=False)
    ax_histy.tick_params(axis="y", labelleft=False)
    # the scatter plot:
    ax.scatter(x, y)
    # now determine nice limits by hand:
    ax_histx.hist(x)
    ax_histy.hist(y, orientation='horizontal')

def plot(x, y, save_to):
    fig = plt.figure(figsize=(10, 10), dpi=100)
    gs = fig.add_gridspec(2, 2, width_ratios=(4, 1), height_ratios=(1, 4),
                            left=0.1, right=0.9, bottom=0.1, top=0.9,
                            wspace=0.05, hspace=0.05)
    
    ax = fig.add_subplot(gs[1, 0])
    ax_histx = fig.add_subplot(gs[0, 0], sharex=ax)
    ax_histy = fig.add_subplot(gs[1, 1], sharey=ax)

    scatter_hist(x, y, ax, ax_histx, ax_histy)

    plt.savefig(save_to)

def plot_color(x, y, save_to):
    fig, ax = plt.subplots()
    ax.scatter(x, y, c='tab:blue', label='vars accs', alpha=0.3, edgecolors='none')
    ax.legend()
    ax.grid(True)
    plt.savefig(save_to)

    
def relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir):
    decs = os.listdir(dec_dir)

    all_vars, all_accs = [], []
    all_ir_vars = []

    for dec in decs:
        basename = dec.split('.')[0]
        se_sub_dir = os.path.join(dec_se_dir, basename)
        if not os.path.exists(se_sub_dir):
            continue
        ir_sub_dir = os.path.join(ir_se_dir, basename)
        if not os.path.exists(ir_sub_dir):
            continue
        src_path = os.path.join(src_dir, f"{basename}.c")
        if not os.path.exists(src_path):
            continue
        ir_path = os.path.join(ir_dir, f"{basename}.ll")
        if not os.path.exists(ir_path):
            continue
        dec_path = os.path.join(dec_dir, dec)
        if not os.path.exists(dec_path):
            continue

        vars, ir_vars, accs = relation_file(src_path, ir_path, dec_path, se_sub_dir, ir_sub_dir)
        all_vars.extend(vars)
        all_ir_vars.extend(ir_vars)
        all_accs.extend(accs)
    x, y = average_x_y(all_ir_vars, all_accs)
    # x, y = all_ir_vars, all_accs
    plot(x, y, 'avg1-hist-feature-ir.jpg')
    plot(y, x, 'avg2-hist-feature-ir.jpg')
    plot_color(x, y, 'avg-color-feature-ir.jpg')
    # plot(all_accs, all_vars)
    # plot_color(all_accs, all_vars)


if __name__ == '__main__':
    src_dir = '/home/eval/DF/data/'
    ir_dir = '/home/eval/DF/ir/o0'
    dec_dir = '/home/eval/DF/de/clang/Ghidra/o0'
    dec_se_dir = '/home/eval/DF/se/clang/Ghidra/o0'
    ir_se_dir = '/home/eval/DF/se/ir/o0'

    relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir)

        
