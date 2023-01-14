import os
import sys
sys.path.append('../utils')
sys.path.append('.')
sys.setrecursionlimit(500)
import utils
from ctypes import CFUNCTYPE, c_double
import llvmlite.binding as llvm
import re
from ircfg import *
import networkx as nx

from execution import find_input_variables, find_output_variables
from execution import execution_block

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
    
    # print(f"Entry: {first_block}")
    # print(f"Exit: {last_block}")

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
    for s in cfg.edge_cfg_entry:
        for e in cfg.edge_cfg_exit:
            for path in nx.all_simple_paths(cfg.edge_cfg, s, e):
                cfg.paths.append(path)
    return cfg

def symbolic_execution(function):
    cfg = build_cfg(function)
    if cfg == None:
        return None
    blks = function.blocks
    blks_dict = {}
    for blk in blks:
        label = get_label_of_block(blk)
        blks_dict[label] = blk
    
    input_symbols = find_input_variables(function)
    output_symbols = find_output_variables(function)
    # print(input_symbols)
    # print(output_symbols)

    tmp_dict = {}
    for path in cfg.paths:
        for ver in path:
            label =  cfg.idx2ver[ver]
            block = blks_dict[label]
            # TODO
            execution_block(block, tmp_dict)

def process_functions(llvm_ir):
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()

    for function in mod.functions:
        if function.name in utils.compiler_generated_funcs:
            continue
        if function.name in utils.syscall_funcs:
            continue
        symbolic_execution(function)

files = os.listdir('../err_lls')
for f in files:
    print(f"File: {f}")
    llvm_ir = read_ir(os.path.join('../err_lls',f))
    process_functions(llvm_ir)
    
