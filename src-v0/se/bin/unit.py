import sys
sys.path.append('.')
import load
import ast_bp
import simplify

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

def test_simplify():
    test_res = []
    case1 = '<BV64 0x0 .. (0x0 .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:7] .. p0_98_64[7:0]) << (0x0 .. p1_99_64[4:0])[31:0]>'
    ans1 = 'p0_98_64 << p1_99_64'
    case2 = '<BV64 0x0 .. p0_98_64[7:0]>'
    ans2 = 'p0_98_64'
    case3 = "<BV16 0 .. p0_98_64[7:0]>"
    ans3 = 'p0_98_64'
    case4 = "<BV8 p0_98_64[7:0]>"
    ans4 = 'p0_98_64'
    cases = [case1, case2, case3, case4]
    anss = [ans1, ans2, ans3, ans4]
    for (case, ans) in zip(cases, anss):
        res = simplify.simplify(case)
        if ans == res:
            test_res.append(1)
        else:
            test_res.append(0)
    print(f"Pass {sum(test_res)} of {len(cases)} cases")

example_0 = '../random1'
proj_0 = test_load(example_0)
test_ast(proj_0)

# test_simplify()
