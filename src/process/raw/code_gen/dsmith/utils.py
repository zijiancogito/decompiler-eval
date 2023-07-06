import sys

import cfile as C
import random

from settings import *

def _defination_inst(label):
    body = C.block(innerIndent=2)
    body.append(C.statement(f"{C.variable('var0', 'int')} = {C.fcall('rand')}"))
    body.append(C.statement(C.fcall('printf', "%d", label)))
    body.append(C.statement('return var0'))
    head = C.function(f'f_rand_{label}', 'int')
    func = C.sequence()
    func.append(head)
    func.append(body)
    return f'f_rand_{label}', func

def _defination_stmt(var, func):
    def_stmt = C.statement(f"{C.variable({var}, 'int')} = {C.fcall(func)}")
    return def_stmt

def _basicblock_inst(label):
    inst_stmt = C.statement(C.fcall('printf', "%d", label))
    return inst_stmt

def _random_stmt(dest, source:list, operators:list, indent=3, max_depth=1):
    end = False
    expr = random.choice(source)
    expr_is_var = True
    for it in range(max_depth):
        opc = random.choice(operators)
        var = random.choice(source)
        if expr_is_var:
            expr = f"{expr} {opc} {var}"
            expr_is_var = False
        else:
            expr = f"({expr}) {opc} {var}"
        end = random.choice([True, False])
        if end:
            break
    stmt = C.statement(, indent=indent)
    return expr
