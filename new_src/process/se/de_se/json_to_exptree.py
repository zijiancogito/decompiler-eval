import sys
sys.path.append('../../../utils/exp_tree')
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

def load_from_json(json_data):
    ret = {}
    ret['symbols'] = []
    scanf_num = json_data['scanf_num']
    params_num = json_data['params_num']
    global_num = json_data['global_num']
    for i in range(scanf_num):
        ret['symbols'].append('scanf' + str(i))
    for i in range(params_num):
        ret['symbols'].append('param' + str(i))
    for i in range(global_num):
        ret['symbols'].append('global' + str(i))
    if json_data['callees'] is not None:
        for i in json_data['callees']:
            if i != 'f_scanf_nop' and i != 'f_printf':
                ret['symbols'].append(i)
    paths = json_data['paths']

    ret['expressions'] = []
    for i in range(len(paths)):
        path = {}
        for j in range(len(paths[i]['outputs'])):
            path[paths[i]['outputs'][j]['id']] = exptree_to_json(json_to_exptree(paths[i]['outputs'][j]))
        ret['expressions'].append(path)
    s_copy = copy.deepcopy(ret['symbols'])
    expressions = str(ret['expressions'])
    for s in s_copy:
        if s not in expressions:
            ret['symbols'].remove(s)
    # else:
    #     ret['conditions'] = []
    #     for i in range(len(paths)):
    #         path = []
    #         for j in range(len(paths[i]['conditions'])):
    #             path.append(exptree_to_json(json_to_exptree(paths[i]['conditions'][j])))
    #         ret['conditions'].append(path)

    return ret