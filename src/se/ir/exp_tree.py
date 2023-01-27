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

    def add_child(self, child):
        self.children.append(child)

def load_from_json(json_data: dict):
    # return ExpTree
    tree = None
    if json_data['type'] == 'binary_expression':
        tree = ExpTree(json_data['op'], json_data['op'])
        tree.add_child(load_from_json(json_data['left']))
        tree.add_child(load_from_json(json_data['right']))
    elif json_data['type'] == 'literal' or json_data['type'] == 'identifier':
        tree = ExpTree(json_data['value'], json_data['value'])
    elif json_data['type'] == 'call_expression':
        tree = ExpTree(json_data['func'], json_data['func'])
        for arg in json_data['args']:
            tree.add_child(load_from_json(arg))
    elif json_data['type'] == 'pointer_expression':
        tree = ExpTree(json_data['op'], json_data['op'])
        tree.add_child(load_from_json(json_data['value']))

    return tree

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
    tree = load_from_json(j)
    tree.show()