import os
import sys
import llvmlite.binding as llvm

import re
import json
from func_timeout import func_set_timeout


sys.path.append('../../../utils/exptree/')
from exp_tree import ExpTree, exptree_to_json, json_to_exptree
from cfg import CFG


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


def build_cfg(blocks):
    cfg = CFG()
    for label in blocks:
        cfg.cfg.add_node(label)
    