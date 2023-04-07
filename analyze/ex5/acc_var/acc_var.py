import sys
sys.path.append('./')
sys.path.append('../../../src/readability/var/')
import os
import matplotlib.pyplot as plt

from func_var import func_var
from var import get_func_from_file

from func_acc import *

def relation_file(dec, dec_se_dir, ir_se_dir):
    funcs, funcs_name = get_func_from_file(dec)
    vars = []
    accus = []

    for fname, fcode in zip(funcs_name, funcs):
        if not re.match('func[0-9]', fname):
            continue
        se_json = os.path.join(dec_se_dir, f"{fname}.json")
        ir_json = os.path.join(ir_se_dir, f"{fname}.json")
        if not os.path.exists(se_json):
            continue
        if not os.path.exists(ir_json):
            continue

        dec_vars = func_var(fcode)
        dec_accu = func_acc(ir_json, se_json)
        vars.append(dec_vars)
        accus.append(dec_accu)

    return vars, accus

def relation_dir(dec_dir, dec_se_dir, ir_se_dir):
    decs = os.listdir(dec_dir)

    all_vars, all_accs = []

    for dec in decs:
        se_sub_dir = os.path.join(dec_se_dir, dec)
        if not os.path.exists(se_sub_dir):
            continue
        ir_sub_dir = os.path.join(ir_se_dir, dec)
        if not os.path.exists(ir_sub_dir, dec):
            continue

        vars, accs = relation_file(os.path.join(dec_dir, dec), se_sub_dir, ir_sub_dir)
        all_vars.extend(vars)
        all_accs.extend(accs)
    plt.figure(figsize=(len(vars), len(accs)), dpi=100)
    plt.scatter(all_vars, all_accs)
    plt.savefig('./test.jpg')

if __name__ == '__main__':
    dec_dir = '/home/eval/DF/de/clang/Ghidra/o0'
    dec_se_dir = '/home/eval/DF/se/clang/Ghidra/o0'
    ir_se_dir = 'ome/eval/DF/se/ir/o0'

    relation_dir(dec_dir, dec_se_dir, ir_se_dir)

        