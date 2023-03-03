import sys
sys.path.append('.')
sys.path.append('../../exp_tree/')

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
        return add(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '-':
        if len(tree.children) == 1:
            return neg(execution(tree.children[0], st))
        else:
            return sub(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '*':
        if len(tree.children) == 2:
            return mul(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '/':
        return div(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '&':
        if len(tree.children) == 2:
            return and2(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '|':
        return  or2(execution(tree.children[0], st), execution(tree.children[1], st))
    elif tree.root_data == '^':
        return xor(execution(tree.children[0], st), execution(tree.children[1], st))

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
    return correct

def test(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    if len(ir_json["symbols"]) != len(c_json["symbols"]):
        return None

    symbols = []
    for sym in ir_json["symbols"]:
        if sym not in c_json["symbols"]:
            return None
        symbols.append(sym)

    matched = 0
    all_vars = 0
    for var in ir_json["expressions"]:
        print(var)
        all_vars += 1
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1

    print(f"{matched} / {all_vars}")

if __name__ == '__main__':
    test(sys.argv[1], sys.argv[2])
