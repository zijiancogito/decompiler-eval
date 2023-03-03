import sys
sys.path.append('../exp_tree')
import os
import json
from exp_tree import *
from compare import *

def compare_file(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    not_matched_var = 0
    matched_var = 0
    if len(c_json["expressions"]) > 1:
        return 0, 0, 0, 0
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            not_matched_var += 1
            print(f"NotFound\t{ir_json_file}\t{c_json_file}\t{var}")
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][0][var]
        if compare_variable(ir_exp, c_exp):
            matched_var += 1
        else:
            print(f"NotMatch\t{ir_json_file}\t{c_json_file}\t{var}")
    all_ir_vars = len(ir_json["expressions"].keys())
    all_c_vars = len(c_json["expressions"][0].keys())

    return not_matched_var, matched_var, all_ir_vars, all_c_vars

def batch_compare(ir_json_dir, c_json_dir):
    ir_dirs = os.listdir(ir_json_dir)

    total_c = 0
    total_ir = 0
    total_match = 0
    total_not_match = 0
    for ir_dir in ir_dirs:
        ir_files = os.listdir(os.path.join(ir_json_dir, ir_dir))
        for ir in ir_files:
            ir_json = os.path.join(ir_json_dir, ir_dir, ir)
            c_json = os.path.join(c_json_dir, ir_dir, ir)
            if not os.path.exists(c_json):
                continue

            n, m, ir_vars, c_vars = compare_file(ir_json, c_json)
            total_c += c_vars
            total_ir += ir_vars
            total_match += m

    print(f"Matched: {total_match} / C_Var: {total_c} / IR_Var: {total_ir}")

if __name__ == '__main__':
    batch_compare(sys.argv[1], sys.argv[2])

