import os
import sys
sys.path.append('../utils')
sys.path.append('.')
sys.path.append('../..')
# sys.setrecursionlimit(500)
from func_timeout import func_set_timeout
import utils
from ctypes import CFUNCTYPE, c_double
import llvmlite.binding as llvm
import re
from ircfg import *
import networkx as nx

from execution import execution_block

from exp_tree.exp_tree import *

import json

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def read_ir(path):
    ir = None
    with open(path, 'r') as r:
        ir = r.read()
    return ir

def get_label_of_block(block):
    pattern = "[\s]+([0-9]+):[\S\s]+"
    match = re.match(pattern, str(block))
    if match:
        return int(match.group(1))
    else:
        return 0

def parse_jump_instruction(instruction):
    pattern = "label %([0-9]+)"
    find = re.findall(pattern, str(instruction))
    findi = []
    for i in find:
        findi.append(int(i))
    return findi

def build_cfg(function):
    # print(f"Function: {function.name}")
    cfg = IRCFG()
    last_block = None
    first_block = None
    # add vertices
    cnt = 0
    for block in function.blocks:
        label = get_label_of_block(block)
        if cnt == 0:
            first_block = label
        # print(f"Label: {label}")
        cfg.cfg.add_node(label)
        cnt += 1
        last_block = label
    if cnt == 0:       # no function definition
        return None

    cfg.set_entry(first_block)
    cfg.set_exit(last_block)
    
    # add edges
    for block in function.blocks:
        label = get_label_of_block(block)
        last_insn = None
        for insn in block.instructions:
            last_insn = insn
        if last_insn.opcode == 'br':
            jump_to = parse_jump_instruction(last_insn)
            for addr in jump_to:
                cfg.cfg.add_edge(label, addr)

    cfg.build_edge_cfg()

    if len(cfg.edge_cfg.nodes) == 1:
        for node in cfg.edge_cfg.nodes:
            cfg.paths = [[node]]
        return cfg
    traced_nodes = []
    for s in cfg.edge_cfg_entry:
        for e in cfg.edge_cfg_exit:
            try:
                path_tracer(cfg.paths, cfg.edge_cfg, s, e, len(cfg.edge_cfg.nodes), traced_nodes)
                if len(traced_nodes) == len(cfg.edge_cfg.nodes):
                    break
            except:
                continue
        if len(traced_nodes) == len(cfg.edge_cfg.nodes):
            break
    return cfg

@func_set_timeout(30)
def path_tracer(paths, graph, start, end, cutoff, traced_nodes):
    for path in nx.all_simple_paths(graph, start, end, cutoff):
        for p in path:
            node_s = p.split('-')[0]
            node_e = p.split('-')[1]
        traced_nodes.append(node_s)
        traced_nodes.append(node_e)
        traced_nodes = list(set(traced_nodes))

        paths.append(path)
        if len(traced_nodes) == cutoff:
            break
        
def symbolic_execution(function):
    cfg = build_cfg(function)
    if cfg == None:
        return None
    blks = function.blocks
    blks_dict = {}
    for blk in blks:
        label = get_label_of_block(blk)
        blks_dict[label] = blk
    
    path_exps = []
    path_cond = []
    for path in cfg.paths:
        tmp_dict = {}
        cond = []    
        iidx_table = {}
        oidx_table = {}
        output_symbols = {}
        last_label = None
        pre_label = None
        for ver in path:
            label =  int(ver.split("-")[0])
            block = blks_dict[label]
            # TODO
            curr_cond = execution_block(block, tmp_dict, iidx_table, oidx_table, output_symbols, int(ver.split("-")[1]), pre_label)
            if curr_cond != None:
                cond.append(curr_cond)
            last_label = int(ver.split("-")[1])
            pre_label = label
        last_block = blks_dict[last_label]
        last_cond = execution_block(last_block, tmp_dict, iidx_table, oidx_table, output_symbols, -1, pre_label)
        if last_cond != None:
            cond.append(last_cond)

        path_cond.append(cond)
        path_exps.append(output_symbols)

    #print_exps(path_cond, path_exps, cfg.paths)
    return path_cond, path_exps, cfg.paths

def key_variable_expression(all_vars, output_symbols):
    key_vars = {}
    for var in all_vars:
        if var in output_symbols:
            key_vars[var] = copy_tree(all_vars[var])
    return key_vars

def print_exps(path_cond, path_exps, paths):
    for cond, exp, path in zip(path_cond, path_exps, paths):
        print("Condition:")
        for c in cond:
            c.show()
            print()
        last = None
        for ver in path:
            label = int(ver.split("-")[0])
            print(label, end=' ')
            last = int(ver.split("-")[1])
        print(last, end=' ')
        print()
        print("Expression:")
        for var in exp:
            print(var, ' = ')
            exp[var].show()

def dump_to_file(save_to, filename, funcname, conds, exps, paths):
    if not os.path.exists(os.path.join(save_to, filename)):
        os.makedirs(os.path.join(save_to, filename))
    outfile = os.path.join(save_to, filename, f'{funcname}.json')
    js_dict = {}
    path_cnt = 0
    js_dict['expressions'] = []
    for cond, exp, path in zip(conds, exps, paths):
        expression = {}
        expression['conditions'] = []
        expression['variables'] = {}
        expression['path'] = []
        for c in cond:
            expression['conditions'].append(exptree_to_json(c))
        last = None
        for p in path:
            label = int(p.split("-")[0])
            expression['path'].append(label)
            last = int(p.split("-")[1])
        expression['path'].append(last)
        for v in exp:
            expression['variables'][v] = exptree_to_json(exp[v])
        js_dict['expressions'].append(expression)
    with open(outfile, 'w') as out:
        json.dump(js_dict, out)

def process_functions(llvm_ir, filename, save_to):
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    all_names = []
    for function in mod.functions:
        if function.name in utils.compiler_generated_funcs:
            continue
        if function.name in utils.syscall_funcs:
            continue
        all_names.append(function.name)
        result = symbolic_execution(function)
        if result != None:
            conds = result[0]
            exps = result[1]
            path = result[2]
            dump_to_file(save_to, filename, function.name, conds, exps, path)
    return all_names

if __name__ == '__main__':
    llvm_ir = read_ir("/home/eval/test/ir/case1003.ll")
    process_functions(llvm_ir, '13', '.')
# files = os.listdir('/home/caoy/cy_proj/eval/data/POJ/ir')
# all_names = list()
# for f in files:
    # #print(f"File: {f}")
    # llvm_ir = read_ir(os.path.join('/home/caoy/cy_proj/eval/data/POJ/ir',f))
    # names = process_functions(llvm_ir, f, '.')
    # all_names.extend(list(set(names)))
    # all_names = list(set(all_names))
