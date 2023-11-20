import os
import sys
import llvmlite.binding as llvm

import re
import json
from func_timeout import func_set_timeout


sys.path.append('../../../utils/exptree/')
from exp_tree import ExpTree, exptree_to_json, json_to_exptree
from cfg import CFG

import ir_parser


llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def ir_execution(ir_path, out, func_filter=[]):
    llvm_ir = None
    with open(ir_path, 'r') as f:
        llvm_ir = f.read().strip()
    assert llvm_ir, f"Failed to read IR file {ir_path}."

    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    for function in mod.functions:
        if function.name not in func_filter:
            continue
        paths, syms = None, None
        try:
            paths, syms = symbolic_execution(function)

@func_set_timeout(10)
def function_execution(function):
    if "select" in str(function):
        raise NotImplementedError
    blocks = {}
    labels = []

    # Get blocks-label map 
    for block in function.blocks:
        label = ir_parser.get_label_of_block(block)
        blocks[label] = blcok
        labesl.append(label)
    # build cfg
    cfg = build_cfg(blocks)
    cfg.set_entry(0)
    cfg.set_exit(labels[-1])
    paths = cfg.get_all_path()

    exe_results = {}  # path: expression
    init_dict = {}
    in_symbols_table = {}
    ir_parser.


def build_cfg(blocks):
    edges = []

    for label in blocks:
        block = blocks[label]
        last_insn = None
        for insn in block.instructions:
            last_insn = insn
        if last_insn.opcode == 'br':
            jump_tos = ir_parser.parse_jump_instruction(last_insn)
            for addr in jump_tos:
                edges.append((label, addr))
        elif last_insn.opcode == 'switch':
            dest_pat = r'label %([0-9]+)'
            jump_tos = [int(i) for i in re.findall(dest_pat, str(last_insn))]
            for addr in jump_tos:
                edges.append((label, addr))
    cfg = CFG(edges)
    return cfg


    