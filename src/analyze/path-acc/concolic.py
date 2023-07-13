import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
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
        return None
    
    
    matched_paths = 0
    wrong_paths = []
    for path in ir_json["paths"]:
        if path not in c_json["paths"]:
            wrong_paths.append(path)
            continue
        exp_ir = exp_tree.json_to_exptree(ir_json["paths"][path])
        exp_c = exp_tree.json_to_exptree(c_json["paths"][path])
        if exp_ir == None or exp_c == None:
            wrong_paths.append(path)
        else:
            pass_rate = sample(exp_ir, exp_c, ir_json["symbols"], c_json["symbols"])
            
def sample(exp_ir, exp_c, symbols_ir, symbols_c):
    passed_cases = 0
    common_symbols = set(symbols_ir).intersection(set(symbols_c))
    symbols_only_in_ir = set(symbols_ir) - common_symbols
    symbols_only_in_c = set(symbols_c) - common_symbols
    
    st_ir, st_c = {}
    for i in range(100):
        for sym in common_symbols:
            tmp = random.randint(1, 10)
            st_ir[sym] = tmp
            st_c[sym] = tmp
        for sym in symbols_only_in_ir:
            st_ir[sym] = random.randint(1, 10)
        for sym in symbols_only_in_c:
            st_c[sym] = random.randint(1, 10)
        try:
            ir_ce = execution(exp_ir, st_ir)
            c_ce = execution(exp_c, st_c)
            if c_ce == ir_ce:
                passed_cases += 1
        except:
            return 0
    return passed_cases / 100.0

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