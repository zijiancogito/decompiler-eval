import sys

from utils.exp_tree import exp_tree

def func_acc(ir_json_file, c_json_file):
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



