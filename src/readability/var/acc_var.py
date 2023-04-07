import sys
sys.path.append('./')
import os
import matplotlib.pyplot as plt
import numpy as np
import re

from func_var import func_var
from var import get_func_from_file

sys.path.append('../../se/ce/')
from concrete_execution import func_acc

sys.path.append('../../../analyze/tools/')
from my_math import average_x_y

def relation_file(src, dec, dec_se_dir, ir_se_dir):
    src_funcs, src_funcs_name = get_func_from_file(src)
    funcs, funcs_name = get_func_from_file(dec)
    vars = []
    accus = []

    src_funcs_map = {}
    for fname, fcode in zip(src_funcs_name, src_funcs):
        src_funcs_map[fname] = fcode

    for fname, fcode in zip(funcs_name, funcs):
        if not re.match('func[0-9]', fname):
            continue
        if fname not in src_funcs_name:
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
        dec_accu = func_acc(ir_json, se_json)
        vars.append(src_dec_ratio)
        accus.append(dec_accu)

    return vars, accus

def scatter_hist(x, y, ax, ax_histx, ax_histy):
    # no labels
    ax_histx.tick_params(axis="x", labelbottom=False)
    ax_histy.tick_params(axis="y", labelleft=False)
    # the scatter plot:
    ax.scatter(x, y)
    # now determine nice limits by hand:
    ax_histx.hist(x)
    ax_histy.hist(y, orientation='horizontal')

def plot(x, y):
    fig = plt.figure(figsize=(10, 10), dpi=100)
    gs = fig.add_gridspec(2, 2, width_ratios=(4, 1), height_ratios=(1, 4),
                            left=0.1, right=0.9, bottom=0.1, top=0.9,
                            wspace=0.05, hspace=0.05)
    
    ax = fig.add_subplot(gs[1, 0])
    ax_histx = fig.add_subplot(gs[0, 0], sharex=ax)
    ax_histy = fig.add_subplot(gs[1, 1], sharey=ax)

    scatter_hist(x, y, ax, ax_histx, ax_histy)

    plt.savefig('./hist.jpg')

def plot_color(x, y, save_to):
    fig, ax = plt.subplots()
    ax.scatter(x, y, c='tab:blue', label='vars accs', alpha=0.3, edgecolors='none')
    ax.legend()
    ax.grid(True)
    plt.savefig(save_to)

    
def relation_dir(src_dir, dec_dir, dec_se_dir, ir_se_dir):
    decs = os.listdir(dec_dir)

    all_vars, all_accs = [], []

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
        dec_path = os.path.join(dec_dir, dec)
        if not os.path.exists(dec_path):
            continue

        vars, accs = relation_file(src_path, dec_path, se_sub_dir, ir_sub_dir)
        all_vars.extend(vars)
        all_accs.extend(accs)
    x, y = average_x_y(all_vars, all_accs)
    plot_color(x, y, 'avg1.jpg')
    plot_color(y, x, 'avg2.jpg')
    # plot(all_accs, all_vars)
    # plot_color(all_accs, all_vars)


if __name__ == '__main__':
    src_dir = '/home/eval/DF/data/'
    dec_dir = '/home/eval/DF/de/clang/Ghidra/o0'
    dec_se_dir = '/home/eval/DF/se/clang/Ghidra/o0'
    ir_se_dir = '/home/eval/DF/se/ir/o0'

    relation_dir(src_dir, dec_dir, dec_se_dir, ir_se_dir)

        
