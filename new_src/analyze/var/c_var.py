import sys

from tree_sitter import Language, Parser
import re
sys.path.append('../../utils/functools')
from extractFunc import ExtractFuncs

Language.build_library(
        'build/c-language.so',
        [
            '/home/eval/decompiler-eval/new_src/utils/tree-sitter/vendor/tree-sitter-c',
        ]
)

C = Language('build/c-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C)

ptypes = [
        'declaration',
        'init_declarator',
        'parameter_declaration',
        'pointer_declarator',
        'variadic_parameter',
        'parenthesized_declarator',
        'abstract_pointer_declarator',
        'sized_type_specifier',
        'parameter_declaration',
        'char_literal',
        'type_descriptor',
        'argument_list',
        'macro_type_specifier',
        'array_declarator',
        'abstract_array_declarator',
        'string_literal'
]

def var_filter(node, parent_type):
    if node.type == "identifier":
        if parent_type in ptypes:
            return True
    return False

def copy_content(start, end, code):
    tmp = [list(code) for i in code.split('\n')]
    content = ''.join(tmp[start[0]][start[1]:end[1]])

    return content

def get_content(code, node):
    start = node.start_point
    end = node.end_point
    content = copy_content(start, end, code)
    return content

def make_move_iter(cursor):
    nodes = []
    stack = []
    if cursor.node:
        stack.append(cursor.node)
    up_flag = False
    parent_type = "root"
    while len(stack) != 0:
        curr_node = cursor.node
        pointer = stack[-1]
        if var_filter(pointer, parent_type) and up_flag == False:
            nodes.append(pointer)
        if up_flag == False:
            if cursor.goto_first_child():
                up_flag = False
                stack.append(cursor.node)
                parent_type = curr_node.type
            elif cursor.goto_next_sibling():
                up_flag = False
                stack.append(cursor.node)
            elif cursor.goto_parent():
                up_flag = True
                stack.pop()
            else:
                stack.pop()
        else:
            if cursor.goto_next_sibling():
                up_flag = False
                stack.append(cursor.node)
            elif cursor.goto_parent():
                up_flag = True
                stack.pop()
            else:
                stack.pop()
    return nodes

def preprocess_code(code):
    code = re.sub('//[^\n]+', '', code.strip())
    code = re.sub('[\s]+', ' ', code.strip())
    return code

def get_all_vars(code):
    tree = c_parser.parse(bytes(code, 'utf8'))
    cursor = tree.walk()
    all_nodes = make_move_iter(cursor)
    vars = [get_content(code, n).strip() for n in all_nodes]
    vars = list(set(vars))
    return vars

def get_vars_from_file(code_file, functions=['func0']):
    extract_func = ExtractFuncs()
    funcs, funcs_name = extract_func.getFuncs(code_file)
    func_vars = {}
    for code, func_name in zip(funcs, funcs_name):
        if func_name not in functions:
            continue
        code = preprocess_code(code.strip())
        vars = get_all_vars(code)
        func_vars[func_name] = len(vars)
    return func_vars

if __name__ == '__main__':
    vars = get_vars_from_file('../../test/0.c', ['func0'])
    print(vars)
                
