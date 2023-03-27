import sys
sys.path.append('../../processData')
sys.setrecursionlimit(100000)
from tree_sitter import Language, Parser
import re

from extractFunc import *

Language.build_library(
        'build/my-language.so',
        [
                'vendor/tree-sitter-c',
        ]
)

C = Language('build/my-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C)

def var_filter(node, parent_type):
    if node.type == "identifier" and parent_type == "declaration":
        return True
    if node.type == "identifier" and parent_type == "init_declarator":
        return True
    if node.type == "identifier" and parent_type == "parameter_declaration":
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
    pat = []
    if cursor.node:
        stack.append(cursor.node)
    up_flag = False
    parent_type = "root"
    while len(stack) != 0:
        curr_node = cursor.node
        pointer = stack[-1]
        if up_flag == False:
            print(pointer.type)
            print(parent_type)
            print()
            if pointer.type == 'identifier':
                pat.append(parent_type)
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
    return nodes, pat

            
def make_move(cursor, move, parent_type):
    current_node = cursor.node
    if current_node == None:
        return []
    nodes = []
    # print(cursor.node.type)
    # print(parent_type)
    # print('----------------------')
    if var_filter(cursor.node, parent_type):
        nodes.append(cursor.node)
    if move == 'down':
        if cursor.goto_first_child():
            nodes.extend(make_move(cursor, 'down', current_node.type))
        elif cursor.goto_next_sibling():
            nodes.extend(make_move(cursor, 'right', parent_type))
        elif cursor.goto_parent():
            nodes.extend(make_move(cursor, 'up', parent_type))
    elif move == 'right':
        if cursor.goto_first_child():
            nodes.extend(make_move(cursor, 'down', current_node.type))
        elif cursor.goto_next_sibling():
            nodes.extend(make_move(cursor, 'right', parent_type))
        elif cursor.goto_parent():
            nodes.extend(make_move(cursor, 'up', parent_type))
    elif move == 'up':
        if cursor.goto_next_sibling():
            nodes.extend(make_move(cursor, 'right', parent_type))
        elif cursor.goto_parent():
            nodes.extend(make_move(cursor, 'up', parent_type))
    return nodes

def preprocess_code(code):
    code = re.sub('//[^\n]+', '', code.strip())
    code = re.sub('[\s]+', ' ', code.strip())
    return code

def get_all_vars(code):
    tree = c_parser.parse(bytes(code, "utf8"))
    cursor = tree.walk()
    # all_nodes = make_move(cursor, 'down', 'root')
    all_nodes, pats = make_move_iter(cursor)
    vars = [get_content(code, n) for n in all_nodes]
    # print(vars)
    return vars, pats

def read_code_from_file(code_file):
    code = None
    with open(code_file, 'r') as f:
        code = f.read()
    code = preprocess_code(code)
    return code

def test():
    f = "/home/eval/DF/de/clang/angr/o0/39.txt"
    extract_funcs = ExtractFuncs()
    funcs, funcs_name = extract_funcs.getFuncs(f)
    for code, func_name in zip(funcs, funcs_name):
        print(func_name)
        code = preprocess_code(code.strip())
        print(code)
        tree = c_parser.parse(bytes(code, "utf8"))
        root_node = tree.root_node
    
        cursor = tree.walk()
        all_nodes = make_move(cursor, 'down', cursor.node.type)
        all_nodes_nrec = make_move_iter(cursor)
        if len(all_nodes) != len(all_nodes_nrec):
            print("Error")
            continue
        for n1, n2 in zip(all_nodes, all_nodes_nrec):
            if get_content(code, n1) != get_content(code, n2):
                print("Not EQ")
                continue
        if not all_nodes:
            continue
        for node in all_nodes:
            print(get_content(code, node))

        print("====================================================")


if __name__ == '__main__':
    test()

