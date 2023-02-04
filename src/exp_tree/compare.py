import sys
sys.path.append('.')

from exp_tree import ExpTree

def compare_old(tree_a, tree_b):
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


def compare(tree_a, tree_b, st_a, st_b):
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
        
