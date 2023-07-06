import sys

import cfile as C
import random

OPERATORS = ['+', '-']
COND_OPERATORS = ['>', '<']
MAX_CONST = 1000

def _var_defination_inst(label):
    body = C.block(innerIndent=2)
    body.append(C.statement(f"{C.variable('v0', 'int')} = {C.fcall('rand')}"))
    body.append(C.statement(C.fcall('printf', ["%d", label])))
    body.append(C.statement('return v0'))
    head = C.function(f'f_rand_{label}', 'int')
    func = C.sequence()
    func.append(head)
    func.append(body)
    return f'f_rand_{label}', func

def _var_defination_stmt(var, func):
    def_stmt = C.statement(f"{C.variable(var, 'int')} = {C.fcall(func)}")
    return def_stmt

def _const_defination_stmt(var):
    def_stmt = C.statement(f"{C.variable(var, 'int')} = {random.randint(1, MAX_CONST)}")
    return def_stmt

def _basicblock_inst(bb_index, indent):
    inst_stmt = C.statement(C.fcall('printf', ["%d", bb_index]), indent=indent)
    return inst_stmt

def _random_stmt(source:list, indent, max_depth=1):
    end = False
    expr = random.choice(source)
    expr_is_var = True
    for it in range(max_depth):
        opc = random.choice(OPERATORS)
        var = random.choice(source)
        if expr_is_var:
            expr = f"{expr} {opc} {var}"
            expr_is_var = False
        else:
            expr = f"({expr}) {opc} {var}"
        end = random.choice([True, False])
        if end:
            break
    new_local_var = random.choice([True, False])
    stmt = ""
    new_var = None
    if new_local_var:
        new_var = f"v{len(source)}"
        # source.append(new_var)
        stmt = C.statement(f"{C.variable(new_var, 'int')} = {expr}", indent=indent)
    else:
        dest_var = random.choice(source)
        stmt = C.statement(f"{dest_var} = {expr}", indent=indent)
    return stmt, new_var

def _while_stmt(local_vars:list, indent):
    var_1 = random.choice(local_vars)
    var_2_tp = random.choice([0, 1])
    exp = None
    if var_2_tp == 0:   # var
        local_vars_bp = local_vars.copy()
        local_vars_bp.remove(var_1)
        var_2 = random.choice(local_vars_bp)
        exp = f"{var_1} {random.choice(COND_OPERATORS)} {var_2}"
    elif var_2_tp == 1:    # const
        var_2 = random.randint(1, MAX_CONST)
        exp = f"{var_1} {random.choice(COND_OPERATORS)} {var_2}"
    # else:
        # exp = var_2
    stmt = C.line(f"while({exp})", indent)
    return stmt

def _if_stmt(local_vars:list, indent):
    var_1 = random.choice(local_vars)
    var_2_tp = random.choice([0, 1])
    exp = None
    if var_2_tp == 0:   # var
        local_vars_bp = local_vars.copy()
        local_vars_bp.remove(var_1)
        var_2 = random.choice(local_vars_bp)
        exp = f"{var_1} {random.choice(COND_OPERATORS)} {var_2}"
    elif var_2_tp == 1:    # const
        var_2 = random.randint(1, MAX_CONST)
        exp = f"{var_1} {random.choice(COND_OPERATORS)} {var_2}"
    # else:
        # exp = var_2
    stmt = C.line(f"if({exp})", indent=indent)
    return stmt

def _else_stmt(indent):
    stmt = C.line("else", indent=indent)
    return stmt