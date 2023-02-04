import sys
sys.path.append('./')
from exp_tree import *
from compare import compare

tree = ExpTree("add", "+")

for i in range(2):
    treei = ExpTree('val', f'val{i}')
    tree.add_child(treei)

tree.show()

tree3 = ExpTree("sub", '-')

tree4 = ExpTree('val', 'c')

tree3.add_child(tree)
tree3.add_child(tree4)

tree3.show()

tree5 = ExpTree('mul', '*')
tree5.add_child(tree3)
tree5.add_child(tree)

tree5.show()

print(compare(tree5, tree3))

print(compare(tree5, tree5))

tree6 = copy_tree(tree5)
tree6.root_data = '/'
tree5.show()
tree6.show()

