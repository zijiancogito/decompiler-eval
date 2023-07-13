import sys

sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
import exp_tree
import json

def func_dist(ir_json_file, c_json_file):
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
    
    unmatched_paths = []
    distance_paths = []
    for path in ir_json["paths"]:
        if path not in c_json["paths"]:
            distance_paths.append(1)
            unmatched_paths.append(path)
        exp_ir = ir_json["paths"][path]
        exp_c = c_json["paths"][path]
        sum_distance = distance(exp_ir, exp_c)
        distance_paths.append(sum_distance)
    
    import numpy as np
    func_avg = round(np.mean(distance_paths), 2)
    func_sum = sum(distance_paths)
    return func_avg, func_sum

def distance(exp_a, exp_b):
    tree_a = exp_tree.json_to_exptree(exp_a)    
    tree_b = exp_tree.json_to_exptree(exp_b)
    if tree_a == None or tree_b == None:
        return 1
    
    a_op_type, b_op_type = {}, {}
    exp_tree.op_type(tree_a, a_op_type)
    exp_tree.op_type(tree_b, b_op_type)
    
    dist = 0
    all_sym = 0
    for key in a_op_type:
        all_sym += a_op_type[key]
        if key not in b_op_type:
            dist += a_op_type[key]
        else:
            dist += abs(a_op_type[key] - b_op_type[key])
    
    for key in b_op_type:
        all_sym += b_op_type[key]
        if key not in a_op_type:
            dist += b_op_type[key]
            
    if all_sym == 0:
        return 1
    sum_dist = sum(dist) / all_sym
    return sum_dist