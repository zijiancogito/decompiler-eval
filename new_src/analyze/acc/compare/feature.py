import sys

def compare(tree_a, tree_b):
    a_leaf = leaf_num(tree_a)
    b_leaf = leaf_num(tree_b)
    if a_leaf != b_leaf:
        return False

    a_op = op_num(tree_a)
    b_op = op_num(tree_b)
    if a_op != b_op:
        return False

    return True

