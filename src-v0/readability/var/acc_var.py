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
        if ir_vars[fname] == 0:
            print(ir)
        ir_dec_ratio = round(dec_vars / ir_vars[fname], 2)
        dec_accu = feature_acc(ir_json, se_json)
        vars.append(src_dec_ratio)
        ir_ratios.append(ir_dec_ratio)
        accus.append(dec_accu)

    return vars, ir_ratios, accus
    
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

        vars, ir_vars, accs = relation_file(src_path, ir_path, dec_path, se_sub_dir, ir_sub_dir)

        all_vars.extend(vars)
        all_ir_vars.extend(ir_vars)
        all_accs.extend(accs)
    return all_vars, all_ir_vars, all_accs

def analyze(src_dec_vars, ir_dec_vars, accs, save_to):
    sys.path.append('../../../analyze/tools')
    from my_math import average_x_y, plot_with_hist, plot_with_color

    x, y = average_x_y(src_dec_vars, accs)
    plot_with_hist(x, y, os.path.join(save_to, "avg_hist_src_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "avg_hist_src_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "avg_color_src_loc_acc.jpg"))

    x, y = average_x_y(ir_dec_vars, accs)
    plot_with_hist(x, y, os.path.join(save_to, "avg_hist_ir_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "avg_hist_ir_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "avg_color_ir_loc_acc.jpg"))

    x, y = src_dec_vars, accs
    plot_with_hist(x, y, os.path.join(save_to, "hist_src_loc_acc.jpg"))
    plot_with_hist(y, x, os.path.join(save_to, "hist_src_acc_loc.jpg"))
    plot_with_color(x, y, os.path.join(save_to, "color_src_loc_acc.jpg"))

    x, y = ir_dec_vars, accs
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
options = ['o0', 'o1', 'o2', 'o3', 'os']
save_fig = '/home/eval/DF/readiability/var/'

def analyze_all():
    save_to = save_fig
    if not os.path.exists(save_to):
        os.makedirs(save_to)

    for compiler in compilers:
        level_1 = os.path.join(save_to, compiler)
        if not os.path.exists(level_1):
            os.mkdir(level_1)
        for decompiler in decompilers:
            level_2 = os.path.join(level_1, decompiler)
            if not os.path.exists(level_2):
                os.mkdir(level_2)
            for option in options:
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


if __name__ == '__main__':
    analyze_all()
    # src_dir = '/home/eval/DF/data/'
    # ir_dir = '/home/eval/DF/ir/o0'
    # dec_dir = '/home/eval/DF/de/clang/Ghidra/o0'
    # dec_se_dir = '/home/eval/DF/se/clang/Ghidra/o0'
    # ir_se_dir = '/home/eval/DF/se/ir/o0'

    # relation_dir(src_dir, ir_dir, dec_dir, dec_se_dir, ir_se_dir)

