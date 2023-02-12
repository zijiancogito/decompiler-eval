import json
class ExpTree:
    def __init__(self, root_tag, root_data):
        self.root_tag = root_tag # ex. "add"
        self.root_data = root_data # ex. "+"
        self.children = []


    def show(self, depth=0):
        print(self.root_data)
        if len(self.children) > 0:
            depth += 1
        for child in self.children:
            for i in range(depth):
                print(' ', end='')
            for i in range(depth):
                print('--', end='')
            child.show(depth)
    
    #def show(self, depth=0):


    def add_child(self, child):
        self.children.append(child)
    
def copy_tree(tree):
    if tree is None:
        return None
    new_tree = ExpTree(tree.root_tag, tree.root_data)
    for child in tree.children:
        ch = copy_tree(child)
        new_tree.add_child(ch)
    return new_tree

def data_to_tag(data):
    # TODO
    return data

def exptree_to_json(tree):
    dic = {}
    dic[tree.root_data] = []
    for child in tree.children:
        dic[tree.root_data].append(exptree_to_json(child))

    return dict

def json_to_exptree(json_data: dict):
    # return ExpTree
    tree = None
    if json_data['type'] == 'binary_expression':
        tree = ExpTree(data_to_tag(json_data['op']), json_data['op'])
        tree.add_child(json_to_exptree(json_data['left']))
        tree.add_child(json_to_exptree(json_data['right']))
    elif 'literal' in json_data['type'] or json_data['type'] == 'identifier':
        tree = ExpTree(data_to_tag(json_data['value']), json_data['value'])
    elif json_data['type'] == 'call_expression':
        tree = ExpTree(data_to_tag(json_data['func']), json_data['func'])
        for arg in json_data['args']:
            tree.add_child(json_to_exptree(arg))
    elif json_data['type'] == 'pointer_expression':
        tree = ExpTree(data_to_tag(json_data['op']), json_data['op'])
        tree.add_child(json_to_exptree(json_data['value']))

    return tree

def load_from_json(json_data):
    ret = {}
    ret['input_symbols'] = json_data['inputs']
    ret['expressions'] = []
    ret['output_symbols'] = {}

    paths = json_data['paths']
    for i in range(len(paths)):
        path = {}
        path['conditions'] = []
        path['variables'] = {}
        for j in range(len(paths[i]['conditions'])):
            path['conditions'].append(exptree_to_json(json_to_exptree(paths[i]['conditions'][j])))
        for j in range(len(paths[i]['outputs'])):
            path['variables'][paths[i]['outputs'][j]['name']] = exptree_to_json(json_to_exptree(paths[i]['outputs'][j]))
            ret['output_symbols'][paths[i]['outputs'][j]['name']] = paths[i]['outputs'][j]['name']
        ret['expressions'].append(path)
        
    return ret

"""
def load_from_json(json_data):
    for i in range(len(json_data)):
        for j in range(len(json_data[i]['conditions'])):
            json_data[i]['conditions'][j] = json_to_exptree(json_data[i]['conditions'][j])
        for j in range(len(json_data[i]['outputs'])):
            json_data[i]['outputs'][j] = json_to_exptree(json_data[i]['outputs'][j])
        '''
        for k in json_data[i]['outputs'].keys():
            json_data[i]['outputs'][k] = json_to_exptree(json_data[i]['outputs'][k])
        '''
    return json_data
"""

if __name__ == '__main__':
    s = '''{
				"left" : 
				{
					"type" : "identifier",
					"value" : "iVar4"
				},
				"op" : "==",
				"right" : 
				{
					"type" : "identifier",
					"value" : "iVar2"
				},
				"type" : "binary_expression"
			}'''
    j = json.loads(s)


    tree = json_to_exptree(j)
    tree.show()
