import sys
sys.path.append('.')

import os
import re

from ir_loc import get_ir_function_lines
from c_loc import get_c_function_lines


def relation_file(src, ir, dec, dec_se_dir, ir_se_dir):
    ir_locs = get_ir_function_lines(ir)
    src_locs = get_c_function_lines(src)
    dec_locs = get_c_function_lines(dec)

    funclist = dec_locs.keys()
    
    sys.path.append('../')
    from utils import get_functions_acc_for_a_bin
    accs_dict = get_functions_acc_for_a_bin(funclist, dec_se_dir, ir_se_dir)

    ir_dec_locs = []
    src_dec_locs = []
    accs = []

    for func in funclist:
        if func not in ir_locs:
            continue
        if func not in src_locs:
            continue
        if func not in accs_dict:
            continue

        ir_dec_locs.append(round(ir_locs[func] / dec_locs[func], 2))
        src_dec_locs.append(round(src_locs[func] / dec_locs[func], 2))

        accs.append(round(accs_dict[func], 2))
    return src_dec_locs, ir_dec_locs, accs


def relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir):
    decs = os.listdir(dec_dir)
    all_src_dec_locs, all_ir_dec_locs = [], []
    all_accs = []

    for dec in decs:
        basename = dec.split('.')[0]

        dec_se_sub_dir = os.path.join(dec_se_dir, basename)
        if not os.path.exists(dec_se_sub_dir):
            continue

        ir_se_sub_dir = os.path.join(ir_se_dir, basename)
        if not os.path.exists(ir_se_sub_dir):
            continue

        src_path = os.path.join(src_dir, f"{basename}.c")
        if not os.path.exists(src_path):
            continue

        ir_path = os.path.join(ir_dir, f"{basename}.ll")
        if not os.path.exists(ir_path):
            continue

        dec_path = os.path.join(dec_dir, dec)
        
        src_dec_locs, ir_dec_locs, accs = relation_file(src_path, ir_path, dec_path, dec_se_sub_dir, ir_se_sub_dir)

        all_src_dec_locs.extend(src_dec_locs)
        all_ir_dec_locs.extend(ir_dec_locs)

        all_accs.extend(accs)

    return all_src_dec_locs, all_ir_dec_locs, all_accs

def analyze(src_dec_locs, ir_dec_locs, accs, save_to):
    sys.path.append('../../../analyze/tools')
    from my_math import average_x_y, plot_with_hist, plot_with_color
    # Average
    x, y = average_x_y(src_dec_locs, accs)
    plot_with_hist(x, y, os.path.join(save_to, "avg_hist_src_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "avg_hist_src_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "avg_color_src_loc_acc.jpg"))
    
    x, y = average_x_y(ir_dec_locs, accs)
    plot_with_hist(x, y, os.path.join(save_to, "avg_hist_ir_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "avg_hist_ir_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "avg_color_ir_loc_acc.jpg"))

    x, y = src_dec_locs, accs
    plot_with_hist(x, y, os.path.join(save_to, "hist_src_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "hist_src_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "color_src_loc_acc.jpg"))

    x, y = ir_dec_locs, accs
    plot_with_hist(x, y, os.path.join(save_to, "hist_ir_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "hist_ir_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "color_ir_loc_acc.jpg"))


src_root = '/home/eval/DF/data'
ir_root = '/home/eval/DF/ir'
dec_root = '/home/eval/DF/de'
dec_se_root = '/home/eval/DF/se'
ir_se_root = '/home/eval/DF/se/ir'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'ida', 'RetDec']
colors = ['blue', 'cyan', 'green', 'black', 'magenta']
options = ['o0', 'o1', 'o2', 'o3', 'os']
save_fig = '/home/eval/DF/readiability/loc'

def analyze_all():
    save_to = save_fig
    if not os.path.exists(save_to):
        os.makedirs(save_to)
    for compiler in compilers:
        level_1 = os.path.join(save_to, compiler)
        if not os.path.exists(level_1):
            os.mkdir(level_1)
        src_accs = [[], [], [], [], []]
        ir_accs = [[], [], [], [], []]
        for decompiler in decompilers:
            level_2 = os.path.join(level_1, decompiler)
            if not os.path.exists(level_2):
                os.mkdir(level_2)
            for idx, option in enumerate(options):
                level_3 = os.path.join(level_2, option)
                if not os.path.exists(level_3):
                    os.mkdir(level_3)
                src_dir = src_root
                ir_dir = os.path.join(ir_root, option)
                dec_dir = os.path.join(dec_root, compiler, decompiler, option)
                dec_se_dir = os.path.join(dec_se_root, compiler, decompiler, option)
                ir_se_dir = os.path.join(ir_se_root, option)
                src_dec, ir_dec, acc = relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir)
                analyze(src_dec, ir_dec, acc, level_3)
                x1, y1 = average_x_y(src_dec, acc)
                x2, y2 = average_x_y(ir_dec, acc)
                src_accs[idx].append((x1, y1))
                ir_accs[idx].append((x2, y2))
        for idx, pairs in enumerate(src_accs):
            save = os.path.join(level_1, f'o{idx}_src_acc.jpg')
            plot_multi(pairs, save, colors, decompilers)

if __name__ == '__main__':
    # src_dir = '/home/eval/DF/data/'
    # ir_dir = '/home/eval/DF/ir/o0'
    # dec_dir = '/home/eval/DF/de/clang/Ghidra/o0'
    # dec_se_dir = '/home/eval/DF/se/clang/Ghidra/o0'
    # ir_se_dir = '/home/eval/DF/se/ir/o0'

    # src_dec, ir_dec, acc = relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir)
    # analyze(src_dec, ir_dec, acc, 'res')

    analyze_all()