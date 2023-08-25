import sys
sys.path.append('../exp_tree')
sys.path.append('../se/ce/')

from exp_tree import sejson_to_exptree

from concrete_execution import execution

import os
import json
import random

def ce_test(ir_exp, c_exp, symbols):
    correct = 0
    for i in range(100):
        st = {}
        for sym in symbols:
            st[sym] = random.randint(1, 10)

        ir_ce = execution(ir_exp, st)
        c_ce = execution(c_exp, st)
        if c_ce == ir_ce:
            correct += 1
    return correct / 100.0

def compare_file(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    symbols = []
    for sym in ir_json["symbols"]:
        symbols.append(sym)

    matched = 0
    not_matched = 0
    ir_var = 0
    c_var = 0
    fails = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            c_var += 1
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = ce_test(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1
        else:
            not_matched += 1
            fails.append(var)
        ir_var += 1
        c_var += 1

    return not_matched, matched, ir_var, c_var, fails

def batch_compare(ir_json_dir, c_json_dir):
    ir_dirs = os.listdir(ir_json_dir)

    total_c = 0
    total_ir = 0
    total_match = 0
    total_not_match = 0
    total_match_funcs = 0
    total_funcs = 0

    fails = {}
    for ir_dir in ir_dirs:
        ir_files = os.listdir(os.path.join(ir_json_dir, ir_dir))
        for ir in ir_files:
            ir_json = os.path.join(ir_json_dir, ir_dir, ir)
            c_json = os.path.join(c_json_dir, ir_dir, ir)
            if not os.path.exists(c_json):
                continue
            fails[ir_json] = []
            sys.stderr.write(f"{ir_json}\n{c_json}\n")
            n, m, ir_vars, c_vars, fail = compare_file(ir_json, c_json)
            total_c += c_vars
            total_ir += ir_vars
            total_match += m
            total_not_match += n
            if n == 0:
                total_match_funcs += 1
            fails[ir_json] = fail
            total_funcs += 1

    average = total_match / total_ir
    matched_functions = total_match_funcs / total_funcs

    # print(f"Matched: {total_match} / C_Var: {total_c} / IR_Var: {total_ir} / Average: {'{:.2f}'.format(average)} / Matched Functions: {'{:.2f}'.format(matched_functions)}")
    print(f"{total_match}\t{total_c}\t{total_ir}\t{round(average, 2)}\t{round(functions, 2)}")
    return fails

if __name__ == '__main__':
    batch_compare(sys.argv[1], sys.argv[2])
            
            
