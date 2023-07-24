import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree')
import copy
from exp_tree import *

def data_to_tag(data):
    # TODO
    return data

def json_to_exptree(json_data: dict):
    # return ExpTree
    tree = None
    if json_data is None:
        pass
    elif json_data['type'] is None:
        pass
    elif json_data['type'] == 'binary_expression':
        tree = ExpTree(data_to_tag(json_data['op']), json_data['op'])
        tree.add_child(json_to_exptree(json_data['left']))
        tree.add_child(json_to_exptree(json_data['right']))
    elif 'literal' in json_data['type'] or json_data['type'] in ['identifier', 'input_symbol']:
        if 'tag' in json_data.keys():
            tree = ExpTree(json_data['tag'], json_data['value'])
        else:
            tree = ExpTree(json_data['value'], json_data['value'])
    elif json_data['type'] == 'call_expression':
        tree = ExpTree(data_to_tag(json_data['func']), json_data['func'])
        if json_data['args'] != None:
            for arg in json_data['args']:
                tree.add_child(json_to_exptree(arg))
    elif json_data['type'] in ['pointer_expression', 'unary_expression']:
        tree = ExpTree(data_to_tag(json_data['op']), json_data['op'])
        tree.add_child(json_to_exptree(json_data['value']))

    return tree

def load_from_json(json_data, exp):
    ret = {}
    
    paths: dict = json_data['paths']
    for key in paths.keys():
        paths[key] = exptree_to_json(json_to_exptree(paths[key]))

    s_copy = copy.deepcopy(json_data['symbols'])
    expressions = str(paths)
    for s in s_copy:
        if s not in expressions:
            json_data['symbols'].remove(s)
    
    ret['symbols'] = json_data['symbols']
    ret['paths'] = paths

    return ret