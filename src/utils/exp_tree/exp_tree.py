import json
import copy
class ExpTree:
    def __init__(self, tag, data):
        self.tag = tag
        self.data = data
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def delete_child(self, child):
        tmp = []
        for ch in self.children:
            if child.data == ch.data and child.tag == ch.tag:
                continue
            tmp.append(ch)
        self.children = tmp

    def show(self, depth=0):
        print(self.data)
        if len(self.children) > 0:
            depth += 1
        for child in self.children:
            for i in range(depth):
                print(' ', end='')
            for i in range(depth):
                print('--', end='')
            child.show(depth)
    
    def copy(self, tree_a):
        new_tree = copy.deepcopy(tree_a)
        return new_tree

def leaf_num(tree):
    if len(tree.children) == 0:
        return 1
    ln = 0
    for child in tree.children:
        ln += op_num(child)
    return ln

def op_num(tree):
    ln = 0
    if len(tree.children) != 0:
        ln += 1
    else:
        return 0
    for child in tree.children:
        ln += op_num(child)
    return ln

def op_type(tree, type_dict):
    if len(tree.children) != 0:
        if tree.data in type_dict:
            type_dict[tree.data] += 1
        else:
            type_dict[tree.data] = 1
        for child in tree.children:
            op_type(child, type_dict)

def copy_tree(tree):
    if tree is None:
        return None
    new_tree = ExpTree(tree.tag, tree.data)
    for child in tree.children:
        ch = copy_tree(child)
        new_tree.add_child(ch)
    return new_tree

def exptree_to_json(tree):
    dic = {}
    if tree is not None:
        dic['data'] = tree.data
        dic['tag'] = tree.tag
        dic['children'] = []
        for child in tree.children:
            dic['children'].append(exptree_to_json(child))
    return dic

def json_to_exptree(json_data):
    if json_data == {}:
        return None
    tree = ExpTree(json_data["tag"], json_data["data"])
    for child in json_data["children"]:
        tree.add_child(json_to_exptree(child))
    return tree
