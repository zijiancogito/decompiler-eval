import sys

import utils
import cfile as C
import random

# def _if_else_stmt(local_vars, bb1, bb2):
    # C.
MAX_ARGS = 5
MAX_LOCALS = 5
MAX_CONSTS = 5
MAX_EXP_DEPTH = 3
MAX_BB_DEPTH = 3
MAX_BB = 5



def make_function(arg_count):
    local_var_cnt = random.randint(1, MAX_ARGS)
    local_const_cnt = random.randint(0, MAX_CONSTS)
    func_body = C.block(innerIndent=2)
    locals = []
    defs_list = []
    for i in range(local_var_cnt):
        var = f"v{i}"
        inst = f"f_rand_{i}"
        defs_list.append(utils._var_defination_stmt(var, inst))
        locals.append(var)
    for i in range(local_const_cnt):
        var = f"v{i + local_var_cnt}"
        defs_list.append(utils._const_defination_stmt(var))
        locals.append(var)
    random.shuffle(defs_list)
    for def_stmt in defs_list:
        func_body.append(def_stmt)
    
    bb_idx = 0
    def _basicblock_rec(local_out, indent, max_exp_depth=1, max_bb_depth=1, max_bb=1, curr_depth=1):
        nonlocal bb_idx
        # if curr_depth >= max_bb_depth:
            # return None
        local_in = []
        body = C.block(innerIndent=indent, indent=indent-2)
        for i in range(max_bb):
            insert_bb = random.choice([True, False])
            if insert_bb and curr_depth < max_bb_depth:
                blk_type = random.choice(['while', 'if'])
                if blk_type == 'while':
                    cond_stmt = utils._while_stmt(local_out + local_in, indent)
                    body.append(cond_stmt)
                    bb = _basicblock_rec(local_out + local_in, 
                                         indent + 2, 
                                         max_exp_depth, 
                                         max_bb_depth, 
                                         max_bb, 
                                         curr_depth + 1)
                    bb_idx += 1
                    body.append(bb)
                elif blk_type == 'if':
                    cond_stmt = utils._if_stmt(local_out + local_in, indent)
                    body.append(cond_stmt)
                    bb = _basicblock_rec(local_out + local_in, 
                                         indent + 2, 
                                         max_exp_depth, 
                                         max_bb_depth, 
                                         max_bb, 
                                         curr_depth + 1)
                    bb_idx += 1
                    body.append(bb)
                    hasElse = random.choice([True, False])                
                    if hasElse:
                        else_stmt = utils._else_stmt(indent)
                        body.append(else_stmt)
                        else_bb = _basicblock_rec(local_out + local_in, 
                                                  indent + 2, 
                                                  max_exp_depth,     
                                                  max_bb_depth, 
                                                  max_bb, 
                                                  curr_depth + 1)
                        bb_idx += 1
                        body.append(else_bb)
            else:
                stmt, new_local = utils._random_stmt(local_out + local_in, 
                                                     indent, 
                                                     max_exp_depth)
                if new_local != None:
                    local_in.append(new_local)
                body.append(stmt)
            _break = random.choice([True, False])    
            if _break:
                break
        body.append(utils._basicblock_inst(bb_idx, indent=indent))
        return body
    
    commound = _basicblock_rec(local_out=locals,
                               indent=2,
                               max_exp_depth=MAX_EXP_DEPTH,
                               max_bb_depth=MAX_BB_DEPTH,
                               max_bb=MAX_BB,
                               curr_depth=0)
    func_body.append(commound.code)

    return func_body
    

def _basicblock(idx, local_out, indent, max_exp_depth=1, max_exps=1):
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
    

if __name__ == '__main__':
    bb = _basicblock(0, 
                     ['v1', 'v2', 'v3'],
                     indent=2, 
                     max_exp_depth=2,
                     max_exps=5)
    
    func = make_function(3)
    print(func)
