import sys

from tree_sitter import Language, Parser
import tree_sitter
import re

Language.build_library(
    '/root/decompiler-eval/src/utils/tree-sitter/build/c-language.so',
    [
        '/root/decompiler-eval/src/utils/tree-sitter/vendor/tree-sitter-c',
	]
)

C = Language('/root/decompiler-eval/src/utils/tree-sitter/build/c-language.so', 'c')
c_parser = Parser()
c_parser.set_language(C)

def make_move_iter(cursor, stop=""):
    func_nodes = []
    stack = []
    if cursor.node:
        stack.append(cursor.node)
    up = False
    while len(stack) != 0:
        if up == False:
            if cursor.node.type == stop:
                func_nodes.append(cursor.node)
            if cursor.node.type == stop:
                if cursor.goto_next_sibling():
                    up = False
                    stack.append(cursor.node)
                elif cursor.goto_parent():
                    up = True
                    stack.pop()
                else:
                    stack.pop()
            else:
                if cursor.goto_first_child():
                    up = False
                    stack.append(cursor.node)
                elif cursor.goto_next_sibling():
                    up = False
                    stack.append(cursor.node)
                elif cursor.goto_parent():
                    up = True
                    stack.pop()
                else:
                    stack.pop()
        else:
            if cursor.goto_next_sibling():
                up = False
                stack.append(cursor.node)
            elif cursor.goto_parent():
                up = True
                stack.pop()
            else:
                stack.pop()
    return func_nodes

def get_content(code, ts_range):
    content = code.split('\n')
    start_loc = ts_range[0][0]
    start_pos = ts_range[0][1]
    end_loc = ts_range[1][0]
    end_pos = ts_range[1][1]

    tmp = []
    if end_loc == start_loc:
        tmp.append(content[end_loc][start_pos: end_pos])
    elif end_loc > start_loc:
        tmp.append(content[start_loc][start_pos:])
        for i in range(start_loc+1, end_loc):
            tmp.append(content[i])
        tmp.append(content[end_loc][:end_pos])
    else:
        pass
    return tmp 


def get_functions(code_files):
    funcs = {}
    with open(code_files, 'r') as f:
        src = f.read().strip()
        tree = c_parser.parse(bytes(src, 'utf8'))
        cursor = tree.walk()
        func_nodes = make_move_iter(cursor, "function_definition")
        for func in func_nodes:
            func_cursor = func.walk()
            declarator = make_move_iter(func_cursor, "function_declarator")[0]
            func_indentifier = declarator.child(0)
            func_name = '\n'.join(get_content(src,
                                             (func_indentifier.start_point, 
                                              func_indentifier.end_point)
                                             )
                                 )
            func_body = '\n'.join(get_content(src, 
                                             (func.start_point, 
                                             func.end_point)
                                             )
                                 )
            funcs[func_name] = func_body
    return funcs 

if __name__ == '__main__':
    get_functions('../../../case/case.c')
