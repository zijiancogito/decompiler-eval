import json
import copy


class ExpTree:
    def __init__(self, tag, pos: tuple):
        self.tag = tag
        self.pos = pos
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def delete_child(self, node):
        tmp = []
        for child in self.children:
            if child.data == node.data and child.pos == node.pos:
                continue
            tmp.append(child) 

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
    
    def copy(self, tree):
        new_tree = copy.deepcopy(tree)
        return new_tree

def exptree_to_json(tree):
    dic = {}
    if tree is not None:
        dic['data'] = tree.data
        dic['pos'] = tree.pos
        dic['children'] = []
        for child in tree.children:
            dic['children'].append(exptree_to_json(child))
    return dic

def json_to_exptree(self, json_data):
    if json_data == {}:
        return None
    tree = ExpTree(json_data["tag"], json_data["pos"])
    for child in json_data["children"]:
        tree.add_child(json_to_exptree(child))
    return tree


        