import os
import sys
sys.path.append('../utils')
sys.path.append('.')
sys.path.append('../..')

from func_timeout import func_set_timeout
import utils
from ctypes import CFUNCTYPE, c_double
import llvmlite.binding as llvm
import re
from ircfg import *
import networkx as nx
from execution import *

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

def build_cfg(blocks):
    cfg = IRCFG()

    for label in blocks:
        cfg.cfg.add_node(label)

    index = 0
    for label in blocks:
        block = blocks[label]
        last_insn = None
        for insn in block.instructions:
            last_insn = insn
        if last_insn.opcode == 'br':
            jump_to = parse_jump_instruction(last_insn)
            for addr in jump_to:
                cfg.cfg.add_edge(label, addr)

    return cfg

def symbolic_execution(function):
    block_dict = {}
    labels = []
    for block in function.blocks:
        label = get_label_of_block(block)
        block_dict[label] = block
        labels.append(label)

    cfg = build_cfg(block_dict)
    cfg.set_entry(0)
    cfg.set_exit(labels[-1])
    cfg.build_edge_cfg()
    cfg.find_path()

    conditions = []
    symbols = []
    for path in cfg.paths:
        tmp_dict = {}
        cond = []
        iidx_table = {}

        find_parameters(function, tmp_dict, iidx_table)

        next_block = None
        pre_block = None
        for ver in path:
            label = int(ver.split('-')[0])
            pre_block = label
            next_block = int(ver.split("-")[1])

            block = block_dict[label]
            condition = execution_cond(block, tmp_dict, iidx_table, next_block, pre_block)
            if condition != None:
                cond.append(condition)

        last_block = block_dict[next_block]
        last_condition = execution_cond(last_block, tmp_dict, iidx_table, -1, pre_block)
        if last_condition != None:
            cond.append(last_condition)

        conditions.append(cond)
        
        symbol = []
        for sym in iidx_table:
            for i in range(iidx_table[sym]):
                symbol.append(f"{sym}{i}")
        symbols.append(symbol)

    return conditions, symbols
    
def dump_to_file(save_to, filename, funcname, conds, symbols):
    if not os.path.exists(os.path.join(save_to, filename)):
        os.makedirs(os.path.join(save_to, filename))
    outfile = os.path.join(save_to, filename, f'{funcname}.json')

    js_dict = {}
    js_dict["paths"] = []
    for symbol, cond in zip(symbols, conds):
        expression = {}
        expression["symbols"] = []
        expression["conditions"] = []
        for c in cond:
            expression["conditions"].append(exptree_to_json(c))

        for s in symbol:
            expression["symbols"].append(s)

        js_dict["paths"].append(expression)

    with open(outfile, 'w') as out:
        json.dump(js_dict, out)

def process_functions(llvm_ir, filename, save_to):
    mod = llvm.parse_assembly(llvm_ir)
    # mod.verify()
    for function in mod.functions:
        if function.name in utils.compiler_generated_funcs:
            continue
        if function.name in utils.syscall_funcs:
            continue
        if function.name.startswith('llvm.'):
            continue
        if function.name == 'main':
            continue
        result = symbolic_execution(function)
        if result != None:
            dump_to_file(save_to, filename, function.name, result[0], result[1])

if __name__ == '__main__':
    llvm_ir = read_ir('/home/eval/decompiler-eval/src/csmith/test.ll')
    process_functions(llvm_ir, '13', '.')
