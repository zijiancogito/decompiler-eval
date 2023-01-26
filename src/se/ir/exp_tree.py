
class ExpTree:
    def __init__(self, root_tag, root_data):
        self.root_tag = root_tag
        self.root_data = root_data
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

def load_from_json():
    #TODO: return ExpTree or dict of ExpTree of a function
    # dict: 
    #   key: variable
    #   value: ExpTree
     return 
