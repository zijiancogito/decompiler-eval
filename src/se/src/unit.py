import sys
sys.path.append('.')
import load
import ast_bp

import angr
import claripy

def test_load(example):
    proj = load.load(example)
    assert(proj != None)
    return proj

def test_ast(proj):
    for func_addr in proj.analysis_funcs:
        cur_ast = ast_bp.AST(proj, func_addr)
        cur_ast.extract_ast()
    #my_ast = ast_bp.AST(proj, 0x4023a0)
    #my_ast.extract_ast()


example_0 = '../random1'
proj_0 = test_load(example_0)
test_ast(proj_0)
