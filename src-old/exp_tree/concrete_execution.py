import sys
sys.path.append('.')
from exp_tree import sejson_to_exptree
from operator_simulate import *

import os
import random
import json

def execution(tree, st):
    if len(tree.children) == 0:
        if tree.root_data in st:
            return st[tree.root_data]
        else:
            return int(tree.root_data)
    if tree.root_data == '+':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return add(op1, op2)
    elif tree.root_data == '-':
        if len(tree.children) == 1:
            op1 = execution(tree.children[0], st)
            if op1 == None:
                return None
            return neg(op1)
        else:
            op1 = execution(tree.children[0], st)
            op2 = execution(tree.children[1], st)
            if op1 == None or op2 == None:
                return None
            return sub(op1, op2)
    elif tree.root_data == '*':
        if len(tree.children) == 2:
            op1 = execution(tree.children[0], st)
            op2 = execution(tree.children[1], st)
            if op1 == None or op2 == None:
                return None
            return mul(op1, op2)
    elif tree.root_data == '/':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return div(op1, op2)
    elif tree.root_data == '&':
        if len(tree.children) == 2:
            op1 = execution(tree.children[0], st)
            op2 = execution(tree.children[1], st)
            if op1 == None or op2 == None:
                return None
            return and2(op1, op2)
    elif tree.root_data == '|':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return  or2(op1, op2)
    elif tree.root_data == '^':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return xor(op1, op2)

def sample(ir_exp, c_exp, symbols):
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



def test(ir_json_file, c_json_file, var_list):
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
        if sym not in c_json["symbols"]:
            return None, None
        symbols.append(sym)

    matched = 0
    fails = []
    for var in var_list:
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1
        else:
            fails.append(var)

    return matched, fails

def func_acc(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    symbols = []
    if len(ir_json["symbols"]) != len(c_json["symbols"]):
        return 0
    for sym in ir_json["symbols"]:
        if sym not in c_json["symbols"]:
            return 0
        symbols.append(sym)

    matched = 0
    fails = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1
        else:
            fails.append(var)

    func_accu = round(matched / len(ir_json["expressions"]), 2)
    return func_accu

def concrete_sta(ir_json_file, c_json_file):
    # print(c_json_file)
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    symbols = []
    if len(ir_json["symbols"]) != len(c_json["symbols"]):
        # print(c_json["symbols"])
        return None, None
    for sym in ir_json["symbols"]:
        if sym not in c_json["symbols"]:
            return None, None
        symbols.append(sym)

    matched = 0
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1

    recall = round(matched / len(ir_json["expressions"]), 2)
    precision = round(matched / len(c_json["expressions"][0]), 2)
    return precision, recall

def concrete_analyze(ir_json_file, c_json_file):
    # print(c_json_file)
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."
    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    symbols = []
    if len(ir_json["symbols"]) != len(c_json["symbols"]):
        # print(c_json["symbols"])
        return None, []
    for sym in ir_json["symbols"]:
        if sym not in c_json["symbols"]:
            return None, [sym]
        symbols.append(sym)
    matched = 0
    wrong_vars = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1
        else:
            wrong_vars.append(var)

    recall = round(matched / len(ir_json["expressions"]), 2)

    return recall, wrong_vars

if __name__ == '__main__':
    matched, all_vars = test(sys.argv[1], sys.argv[2])
    print(f"{matched} / {all_vars}")

