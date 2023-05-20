import sys

sys.path.append('/home/eval/decompiler-eval/new_src/utils/exp_tree')
import exp_tree
import json

def func_acc(ir_json_file, c_json_file):
    """
        Return recall, precision, wrong vars
        if all nodes in tree_c matched with tree_b, matched = 1
    """
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    matched = 0
    wrong_vars = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"]:
            wrong_vars.append(var)
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][var]
        if compare(ir_exp, c_exp):
            matched += 1
        else:
            wrong_vars.append(var)

    recall = round(matched / len(ir_json["expressions"]), 2)
    precision = round(matched / len(c_json["expressions"]), 2)
    return precision, recall, wrong_vars

def func_dist(ir_json_file, c_json_file):
    """
        Return average and sum distance of all key vars in a function
        return average, sum
        distance = count(different nodes) / count(all nodes)
    """
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    func_sum = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"]:
            func_sum.append(1)
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][var]
        # avg_distance, sum_distance = distance(ir_exp, c_exp)
        sum_distance = distance(ir_exp, c_exp)
        # func_avg.append(avg_distance)
        func_sum.append(sum_distance)
    
    import numpy as np
    # func_avg_avg = round(np.mean(func_avg), 2)
    # func_avg_sum = sum(func_avg)
    
    func_sum_avg = round(np.mean(func_sum), 2) # average distance of all vars in one function
    func_sum_sum = sum(func_sum) # sum distance of all vars in one function 

    return func_sum_avg, func_sum_sum

def compare(ir_exp, c_exp):
    tree_a = exp_tree.json_to_exptree(ir_exp)
    tree_b = exp_tree.json_to_exptree(c_exp)

    a_leaf = exp_tree.leaf_num(tree_a)
    b_leaf = exp_tree.leaf_num(tree_b)
    if a_leaf != b_leaf:
        return False

    a_op = exp_tree.op_num(tree_a)
    b_op = exp_tree.op_num(tree_b)
    if a_op != b_op:
        return False

    return True

def distance(ir_exp, c_exp):
    tree_a = exp_tree.json_to_exptree(ir_exp)
    tree_b = exp_tree.json_to_exptree(c_exp)
    
    a_op_type, b_op_type = {}, {}
    exp_tree.op_type(tree_a, a_op_type)
    exp_tree.op_type(tree_b, b_op_type)
    
    dist = []
    all_sym = 0 # all_sym = sym_count_of(tree_a) + sym_count_of(tree_b)
    for key in a_op_type:
        all_sym += 1
        if key not in b_op_type:
            dist.append(a_op_type[key])
    
    for key in b_op_type:
        all_sym += 1
        if key not in a_op_type:
            dist.append(b_op_type[key])
            
    for key in a_op_type:
        if key not in b_op_type:
            continue
        dist.append(abs(a_op_type[key] - b_op_type[key]))

    import numpy as np
    # avg_dist = round(np.mean(dist), 2)
    sum_dist = sum(dist) / all_sym
    return sum_dist
