import sys
sys.path.append('/home/eval/decompiler-eval/new_src/utils/exp_tree')
import exp_tree
import random
import json

import numpy as np

def func_acc(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        try:
            ir_json = json.load(f)
        except:
            ir_json = None

    c_json = None
    with open(c_json_file, 'r') as f:
        try:
            c_json = json.load(f)
        except:
            c_json = None
    if ir_json == None or c_json == None:
        return 0, 0, []

    symbols = []
    # if len(ir_json["symbols"]) != len(c_json["symbols"]):
        # return 0, 0, ir_json["expressions"]
    for sym in ir_json["symbols"]:
        # if sym not in c_json["symbols"]:
            # return 0, 0, ir_json["expressions"] 
        symbols.append(sym)

    matched = 0
    wrong_vars = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"]:
            wrong_vars.append(var)
            continue
        ir_exp = exp_tree.json_to_exptree(ir_json["expressions"][var])
        c_exp = exp_tree.json_to_exptree(c_json["expressions"][var])
        if ir_exp == None or c_exp == None:
            wrong_vars.append(var)
        else:
            correct_rate = sample(ir_exp, c_exp, symbols)
            if correct_rate > 0.8:
                matched += 1
            else:
                wrong_vars.append(var)
    recall = round(matched / len(ir_json["expressions"]), 2) if len(ir_json["expressions"]) != 0 else 0
    precision = round(matched / len(c_json["expressions"]), 2) if len(c_json["expressions"]) != 0 else 0
    return precision, recall, wrong_vars

def passrate(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        try:
            ir_json = json.load(f)
        except:
            ir_json = None
    
    c_json = None
    with open(c_json_file, 'r') as f:
        try:
            c_json = json.load(f)
        except:
            c_json = None
    if ir_json == None or c_json == None:
        return 0
    
    symbols = []
    for sym in ir_json["symbols"]:
        symbols.append(sym)
        
    total_tmp = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"]:
            total_tmp.append(0)
            continue
        ir_exp = exp_tree.json_to_exptree(ir_json["expressions"][var])
        c_exp = exp_tree.json_to_exptree(c_json["expressions"][var])
        if ir_exp == None or c_exp == None:
            total_tmp.append(0)
        else:
            correct_rate = sample(ir_exp, c_exp, symbols)
            total_tmp.append(correct_rate)
    avg_passrate = round(np.mean(total_tmp), 2) 
    return avg_passrate

def sample(ir_exp, c_exp, symbols):
    correct = 0
    for i in range(100):
        st = {}
        for sym in symbols:
            st[sym] = random.randint(1, 5)
        try:
            ir_ce = execution(ir_exp, st)
            c_ce = execution(c_exp, st)
            if c_ce == ir_ce:
                correct += 1
        except:
            return 0
    return correct / 100.0

def execution(tree, st):
    if len(tree.children) == 0:
        if tree.data in st:
            return st[tree.data]
        else:
            return int(tree.data)

    if tree.data == '+':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return add(op1, op2)
    elif tree.data == '-':
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
    elif tree.data == '*':
        if len(tree.children) == 2:
            op1 = execution(tree.children[0], st)
            op2 = execution(tree.children[1], st)
            if op1 == None or op2 == None:
                return None
            return mul(op1, op2)
    elif tree.data == '/':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return mul(op1, op2)
    elif tree.data == '%':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return mod(op1, op2)
    elif tree.data == '&':
        if len(tree.children) == 2:
            op1 == execution(tree.children[0], st)
            op2 == execution(tree.children[1], st)
            if op1 == None or op2 == None:
                return None
            return and2(op1, op2)
    elif tree.data == '|':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return or2(op1, op2)
    elif tree.data == '^':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return xor(op1, op2)
    elif tree.data == '>>':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return shr(op1, op2)
    elif tree.data == '<<':
        op1 = execution(tree.children[0], st)
        op2 = execution(tree.children[1], st)
        if op1 == None or op2 == None:
            return None
        return shl(op1, op2)
    elif tree.data == '!':
        op1 = execution(tree.children[0], st)
        if op1 == None:
            return None
        return not1(op1)
    elif tree.data == '~':
        op1 = execution(tree.children[0], st)
        if op1 == None:
            return None
        return notbit(op1)

def add(op1, op2):                           # +
    return int(op1) + int(op2)

def sub(op1, op2):                           # -
    return int(op1) - int(op2)

def mul(op1, op2):                           # *
    return int(op1) * int(op2)

def div(op1, op2):                           # /
    if int(op2) == 0:
        return None
    return int(int(op1) / int(op2))

def mod(op1, op2):                           # %
    if int(op2) == 0:
        return None
    return int(int(op1) % int(op2))

def neg(op):                                 # -
    return -int(op)

def and2(op1, op2):                          # &
    return int(op1) & int(op2)

def or2(op1, op2):                           # |
    return int(op1) | int(op2)

def xor(op1, op2):                           # ^
    return int(op1) ^ int(op2)

def shr(op1, op2):                           # >>
    return int(op1) >> int(op2)

def shl(op1, op2):                           # <<
    return int(op1) << int(op2)

def not1(op1):                               # !
    return not int(op1)

def notbit(op1):
    return ~(int(op1))