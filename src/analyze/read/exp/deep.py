import sys
sys.path.append('../../utils/functools')
from extractFunc import ExtractFuncs

Language.build_library(
        'build/c-language.so',
        [
            '/home/eval/decompiler-eval/src/utils/tree-sitter/vendor/tree-sitter-c',
        ]
)

C = Language('build/c-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C)

def make_move_iter(cursor):
    nodes = []
    stack = []
    if cursor.node:
        stack.append(cursor.node)
    up_flag = False
    
    while len(stack) != 0:
        curr_node = cursor.node
        pointer = stack[-1]
        raise NotImplementedError
        
def function_exp_deep(code):
    tree = c_parser.parse(bytes(code, 'utf8'))
    cursor = tree.walk()
    # TODO: 
    raise NotImplementedError