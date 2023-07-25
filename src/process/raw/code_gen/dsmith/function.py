import sys
import cfile as C
import random

from statement import Statement

class Function():
    def __init__(self, max_args, 
                 min_args,
                 max_local_variables, 
                 min_local_variables, 
                 max_const_variables,
                 min_const_variables,
                 max_expr_complexity,
                 min_expr_complexity,
                 max_block_size,
                 min_block_size,
                 max_block_depth,
                 max_branches,
                 max_funcs) -> None:
        self._max_args = max_args
        self._min_args = min_args
        self._max_local_variables = max_local_variables
        self._min_local_variables = min_local_variables
        self._max_const_variables = max_const_variables
        self._min_const_variables = min_const_variables
        self._max_expr_complexity = max_expr_complexity
        self._min_expr_complexity = min_expr_complexity
        self._max_block_size = max_block_size
        self._min_block_size = min_block_size
        self._max_block_depth = max_block_depth
        self._max_branches = max_branches
        self._max_funcs = max_funcs
        self._bb_idx = 0
        
    def input_inst(self, label):
        body = C.block(innerIndent=2)
        body.append(C.statement(f"{C.variable('v0', 'int')} = {C.fcall('rand')}"))
        body.append(C.statement(C.fcall('printf', [f'"f_rand_{label}: %d"', label])))
        body.append(C.statement('return v0'))
        head = C.function(f'f_rand_{label}', 'int')
        func = C.sequence()
        func.append(head)
        func.append(body)
        return f'f_rand_{label}', func

    def input_inst_declare(self, label):
        # head = C.function(f'f_rand_{label}', 'int')
        dec = C.statement(f'int f_rand_{label}() __attribute__((noinline))')
        return dec

    def basicblock_rec(self, local_out_bb, indent, stmt_generator:Statement, curr_depth=1):
        local_in_bb = []
        body = C.block(innerIndent=indent, indent=indent-2)
        body.append(stmt_generator.basicblock_inst(self._bb_idx, indent=indent))
        self._bb_idx += 1
        isNewBB = False
        for i in range(self._max_block_size):
            insert_bb = random.choice([True, False])
            if insert_bb and curr_depth < self._max_block_depth and self._bb_idx < self._max_branches:
                if isNewBB:
                    body.append(stmt_generator.basicblock_inst(self._bb_idx, indent=indent))
                    self._bb_idx += 1
                isNewBB = True
                blk_type = random.choice(['while', 'if'])
                if blk_type == 'while':
                    cond_stmt = stmt_generator.while_stmt(local_out_bb + local_in_bb, indent)
                    body.append(cond_stmt)
                    bb = self.basicblock_rec(local_out_bb=local_out_bb + local_in_bb, 
                                             indent=indent + 2, 
                                             stmt_generator=stmt_generator,
                                             curr_depth=curr_depth + 1)
                    body.append(bb)
                elif blk_type == 'if':
                    cond_stmt = stmt_generator.if_stmt(local_out_bb + local_in_bb, indent)
                    body.append(cond_stmt)
                    bb = self.basicblock_rec(local_out_bb=local_out_bb + local_in_bb, 
                                             indent=indent + 2, 
                                             stmt_generator=stmt_generator,
                                             curr_depth=curr_depth + 1)

                    body.append(bb)
                    hasElse = random.choice([True, False])                
                    if hasElse:
                        else_stmt = stmt_generator.else_stmt(indent)
                        body.append(else_stmt)
                        else_bb = self.basicblock_rec(local_out_bb=local_out_bb + local_in_bb, 
                                                      indent=indent + 2, 
                                                      stmt_generator=stmt_generator,
                                                      curr_depth=curr_depth + 1)
                        body.append(else_bb)
                    
            else:
                if isNewBB:  # 如果上一个语句是基本块，则说明下一个插入的stmt是新的基本块
                    body.append(stmt_generator.basicblock_inst(self._bb_idx, indent=indent)) 
                    self._bb_idx += 1   # 因此需要插入标记
                    isNewBB = False # 普通stmt的下一句不会开启新基本块，因此设置标记为F
                stmt, new_local = stmt_generator.random_stmt(local_out_bb + local_in_bb, 
                                                             indent, 
                                                             max_depth=self._max_expr_complexity, 
                                                             min_depth=self._min_expr_complexity)
                if new_local != None:
                    local_in_bb.append(new_local)
                body.append(stmt)
            _break = random.choice([True, False])    
            if _break and i >= self._max_block_size:
                break
        # body.append(utils._basicblock_inst(self._bb_idx, indent=indent))
        return body
        
    def make_function(self, arg_count, funcname, stmt_generator:Statement):
        local_vars = []

        # prelog
        head = C.function(funcname, 'int')
        for i in range(arg_count):
            p_var = f"p{i}"
            head.add_param(C.variable(p_var, 'int'))
            local_vars.append(p_var)
        
        # local var
        local_var_cnt = random.randint(self._min_local_variables, self._max_local_variables)
        local_const_cnt = random.randint(self._min_const_variables, self._max_const_variables)
        func_body = C.block(innerIndent=2)
        defs_list = []
        for i in range(local_var_cnt):
            var = f"v{i}"
            inst = f"f_rand_{i}"
            defs_list.append(stmt_generator.var_defination_stmt(var, inst))
            local_vars.append(var)
        for i in range(local_const_cnt):
            var = f"v{i + local_var_cnt}"
            defs_list.append(stmt_generator.const_defination_stmt(var))
            local_vars.append(var)
        random.shuffle(defs_list)
        for def_stmt in defs_list:
            func_body.append(def_stmt)

        # main compond
        self._bb_idx = 0
        commound = self.basicblock_rec(local_out_bb=local_vars,
                                       indent=2,
                                       curr_depth=0,
                                       stmt_generator=stmt_generator)
        func_body.append(commound.code)

        # insert ret stmt

        func_body.append(stmt_generator.basicblock_inst(self._bb_idx, indent=2))
        func_body.append(stmt_generator.ret_var_stmt(local_vars, indent=2, max_depth=self._max_expr_complexity))
        func_body.append(stmt_generator.ret_stmt(indent=2))
        
        # make function

        func = C.sequence()
        func.append(head)
        func.append(func_body)
        return func
        

    def _basicblock(self, idx, local_out, indent, max_exp_depth=1, max_exps=1):
        raise NotImplementedError
        local_in = []
        body = C.block(innerIndent=indent)
        for i in range(max_exps):
            stmt, new_local = utils._random_stmt(local_out + local_in, 
                                                 indent, 
                                                 max_exp_depth)
            if new_local != None:
                local_in.append(new_local)
            body.append(stmt)
            _break = random.choice([True, False])   
            if _break:
                break
        return body

    def make_main(self, callees:list, stmt_generator:Statement):
        head = C.function('main', 'int', )
        body = C.block(innerIndent=2)
        local_vars = []
        for i in range(self._max_args):
            var = f"v{i}"
            local_vars.append(var)
            assignConst = random.choice([True, False])
            if assignConst:
                body.append(stmt_generator.const_defination_stmt(var))
            else:
                inst = f"f_rand_{i}"
                body.append(stmt_generator.var_defination_stmt(var, inst))
        
        var_idx = self._max_args
        for func, nargs in callees:
            args = random.choices(local_vars, k=nargs)
            var = f"v{var_idx}"
            stmt = stmt_generator.nonvoid_call_stmt(var, func, args, 2)
            body.append(stmt)
            stmt = stmt_generator.void_call_stmt('printf', ['"%d"', var], 2)
            body.append(stmt)

            local_vars.append(var)
            var_idx += 1

        body.append(C.statement('return 0'))

        func = C.sequence()
        func.append(head)
        func.append(body)
        return func


if __name__ == '__main__':
    # bb = _basicblock(0, 
                     # ['v1', 'v2', 'v3'],
                     # indent=2, 
                     # max_exp_depth=2,
                     # max_exps=5)
    
    func = make_function(3, 'func')
    
    callees = [('func0', 3), ('func1', 2)]
    func = make_main(callees)
    print(func)
