import sys
sys.path.append('.')

from exp_tree import ExpTree

def compare(tree_a, tree_b):
    if tree_a == tree_b:
        return True
    try:
        if tree_a.data == tree_b.data:
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
