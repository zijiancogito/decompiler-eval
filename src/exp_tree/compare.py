import sys
sys.path.append('.')

from exp_tree import *

def compare_data(a, b):
    try:
        a = int(a)
        b = int(b)
        if a == b:
            return True
    except:
        if a == b:
            return True
    return False

def compare_old(tree_a, tree_b):
    if tree_a == tree_b:
        return True
    try:
        if compare_data(tree_a.root_data, tree_b.root_data):
            results = []
            for child_a, child_b in zip(tree_a.children, tree_b.children):
                res = compare(child_a, child_b)
                results.append(res)
            result = True
            for r in results:
                result = result and r
            return result
    except:
        return False
    return False


def compare_simple(tree_a, tree_b, st_a, st_b):
    """
    st_a is the symbols table of tree a (input symbols and output symbols)
    """
    if tree_a == tree_b:
        return True
    try:
        if st_a[tree_a] == st_b[tree_b]:
            results = []
            for child_a, child_b in zip(tree_a.children, tree_b.children):
                res = compare(child_a, child_b)
                results.append(res)
            result = True
            for r in results:
                result = result and r
            return result
    except:
        return False
    return False



def compare_feature(tree_a, tree_b):
    a_leaf = leaf_num(tree_a)
    b_leaf = leaf_num(tree_b)
    if a_leaf != b_leaf:
        return False

    a_op = op_num(tree_a)
    b_op = op_num(tree_b)
    if a_op != b_op:
        return False

    a_tp = {}
    op_type(tree_a, a_tp)
    b_tp = {}
    op_type(tree_b, b_tp)
    # for a in a_tp:
        # if a not in b_tp:
            # try:
                # a = -int(a)
                # if a not in b_tp:
                    # return False
            # except:
                # return False
        # if a_tp[a] != b_tp[a]:
            # return False
    return True

def compare(tree_a, tree_b, option):
    if option == 'fullmatch':
        return compare_old(tree_a, tree_b)
    elif option == 'feature':
        return compare_feature(tree_a, tree_b)
    else:
        return
        
def compare_path(cond_a, cond_b):
    if len(cond_a) != len(cond_b):
        return None
    cond_b_flag = len(cond_b) * [False]
    for c_a in cond_a:
        for index, c_b in enumerate(cond_b):
            if cond_b_flag[index] == True:
                break
            tree_a = sejson_to_exptree(c_a)
            tree_b = sejson_to_exptree(c_b)
            if compare(tree_a, tree_b) == True:
                cond_b_flag[index] = True
                break
    result = True
    for f in cond_b_flag:
        result = result and f
    return result

def compare_variable(var_a, var_b, option):
    tree_a = sejson_to_exptree(var_a)
    tree_b = sejson_to_exptree(var_b)
    return compare(tree_a, tree_b, option)


def feature_acc(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    matched = 0
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = ir_json["expressions"][var]
        c_exp = c_json["expressions"][0][var]
        if compare_variable(ir_exp, c_exp, "feature"):
            matched += 1

    return round(matched / len(ir_json["expressions"]), 2)
