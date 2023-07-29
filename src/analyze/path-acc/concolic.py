import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import exp_tree
import log
import random
import json
import os

import numpy as np

def bb_acc(ir_json_file, c_json_file, log_dir):
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
        return None, None
    
    matched_bbs = []
    all_bbs_ir = []
    all_bbs_c = []
    for path in ir_json["paths"]:
        bbs = path.split('-')
        all_bbs_ir.extend(bbs)
    for path in c_json["paths"]:
        bbs = path.split('-')
        all_bbs_c.extend(bbs)    
    all_bbs_c = list(set(all_bbs_c))
    all_bbs_ir = list(set(all_bbs_ir))
    matched_paths = []
    for path in ir_json["paths"]:
        if path not in c_json["paths"]:
            continue
        exp_ir = exp_tree.json_to_exptree(ir_json["paths"][path])
        exp_c = exp_tree.json_to_exptree(c_json["paths"][path])
        pass_rate = sample(exp_ir, exp_c, ir_json["symbols"], c_json["symbols"])
        if pass_rate > 0.9:
            matched_paths.append(path)
    for path in matched_paths:
        bbs = path.split('-')
        matched_bbs.extend(bbs)
    matched_bbs = list(set(matched_bbs))
   #  all_bbs_ir.sort()
    # all_bbs_c.sort()
    # matched_bbs.sort()
    # print(all_bbs_ir)
    # print(all_bbs_c)
    # print(matched_bbs)
    # import pdb
    # pdb.set_trace()
    recall = round(len(matched_bbs) / len(all_bbs_ir), 2) 
    precision = round(len(matched_bbs) / len(all_bbs_c), 2)
    unmatched_bbs_c = list(set(all_bbs_c) - set(matched_bbs))
    unmatched_bbs_ir = list(set(all_bbs_ir) - set(matched_bbs))
    
    umc_path = os.path.join(log_dir, "unmatched-c.csv")
    umi_path = os.path.join(log_dir, "unmatched-ir.csv")
    with open(umc_path, 'w') as f:
        f.write('\n'.join(unmatched_bbs_c))
    with open (umi_path, 'w') as f:
        f.write('\n'.join(unmatched_bbs_ir))

    return precision, recall 

def func_acc(ir_json_file, c_json_file, log_path):
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
        return None, None
    
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
            if pass_rate > 0.8:
                matched_paths += 1
            else:
                wrong_paths.append(path)
    log.log_list2file(wrong_paths, log_path)
    recall = round(matched_paths / len(ir_json["paths"]), 2) if len(ir_json["paths"]) != 0 else 0
    precision = round(matched_paths / len(c_json["paths"]), 2) if len(c_json["paths"]) != 0 else 0

    return precision, recall
            
def sample(exp_ir, exp_c, symbols_ir, symbols_c):
    passed_cases = 0
    common_symbols = set(symbols_ir).intersection(set(symbols_c))
    symbols_only_in_ir = set(symbols_ir) - common_symbols
    symbols_only_in_c = set(symbols_c) - common_symbols
    
    st_ir, st_c = {}, {}
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