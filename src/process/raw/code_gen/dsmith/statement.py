import sys

import cfile as C
import random


class Statement():
    def __init__(self, haslogic=True, hasdivs=True, max_const_values=1000) -> None:
        self._cond_operators = ['>', '>=', '<', '<=', '!=', '==']
        self._operators = ['+', '-', '*'] 
        if haslogic:
            self._operators.extend(['&', '^', '|']) 
        if hasdivs:
            self._operators.extend('/')
        self._max_const_values = max_const_values

    def var_defination_stmt(self, var, func):
        def_stmt = C.statement(f"{C.variable(var, 'int')} = {C.fcall(func)}")
        return def_stmt

    def _const_defination_stmt(self, var):
        def_stmt = C.statement(f"{C.variable(var, 'int')} = {random.randint(1, self._max_const_values)}")
        return def_stmt

    def _basicblock_inst(self, bb_index, indent):
        inst_stmt = C.statement(C.fcall('printf', ["%d", bb_index]), indent=indent)
        return inst_stmt

    def _random_stmt(self, source:list, indent, max_depth=1):
        expr = random.choice(source)
        expr_is_var = True
        for it in range(max_depth):
            end = random.choice([True, False, False])
            if end:
                break
            opc = random.choice(self._operators)
            var = random.choice(source)
            if expr_is_var:
                expr = f"{expr} {opc} {var}"
                expr_is_var = False
            else:
                expr = f"({expr}) {opc} {var}"
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

    def _while_stmt(self, local_vars:list, indent):
        var_1 = random.choice(local_vars)
        var_2_tp = random.choice([0, 1])
        exp = None
        if var_2_tp == 0:   # var
            local_vars_bp = local_vars.copy()
            local_vars_bp.remove(var_1)
            var_2 = random.choice(local_vars_bp)
            exp = f"{var_1} {random.choice(self._cond_operators)} {var_2}"
        elif var_2_tp == 1:    # const
            var_2 = random.randint(1, self._max_const_values)
            exp = f"{var_1} {random.choice(self._cond_operators)} {var_2}"
        # else:
            # exp = var_2
        stmt = C.line(f"while({exp})", indent)
        return stmt

    def _if_stmt(self, local_vars:list, indent):
        var_1 = random.choice(local_vars)
        var_2_tp = random.choice([0, 1])
        exp = None
        if var_2_tp == 0:   # var
            local_vars_bp = local_vars.copy()
            local_vars_bp.remove(var_1)
            var_2 = random.choice(local_vars_bp)
            exp = f"{var_1} {random.choice(self._cond_operators)} {var_2}"
        elif var_2_tp == 1:    # const
            var_2 = random.randint(1, self._max_const_values)
            exp = f"{var_1} {random.choice(self._max_const_values)} {var_2}"
        # else:
            # exp = var_2
        stmt = C.line(f"if({exp})", indent=indent)
        return stmt

    def _else_stmt(self, indent):
        stmt = C.line("else", indent=indent)
        return stmt

    def _ret_var_stmt(self, source:list, indent, max_depth):
        expr  = random.choice(source)
        expr_is_var = True
        for it in range(max_depth):
            end = random.choice([True, False, False])
            if end:
                break
            opc = random.choice(self._operators)
            var = random.choice(source)
            if expr_is_var:
                expr = f"{expr} {opc} {var}"
                expr_is_var = False
            else:
                expr = f"({expr}) {opc} {var}"
        ret_var = "ret"
        stmt = C.statement(f"{C.variable(ret_var, 'int')} = {expr}", indent=indent)
        return stmt

    def _ret_stmt(self, indent):
        stmt = C.statement(f"return ret")
        return stmt

    def _call_expr(self, func , args:list):
        exp = C.fcall(func , args)
        return exp

    def _nonvoid_call_stmt(self, var, func, args:list, indent):
        stmt = C.statement(f"{C.variable(var, 'int')} = {self._call_expr(func, args)}", indent)
        return stmt

    def _void_call_stmt(self, func, args:list, indent):
        stmt = C.statement(C.fcall(func, args), indent=indent)
        return stmt