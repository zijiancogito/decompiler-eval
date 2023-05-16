import sys
import os
import llvmlite.binding as llvm
import re

import pygraphviz as pgv
import networkx as nx
import matplotlib.pyplot as plt

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_all_asmprinters()

def isBranch(opc):
    if opc == 'select':
        return True

def get_ir_cycles(function):
    dot_str = llvm.get_function_cfg(function, show_inst=False)
    Gtmp = pgv.AGraph(dot_str)
    G = nx.Graph(Gtmp)
    cycles = len(G.edges) - len(G.nodes) + 2
    return cycles
    
if __name__ == '__main__':
    llvm_ir = None
    path = "/home/eval/decompiler-eval/new_src/test/0.ll"
    with open(path, 'r') as f:
        llvm_ir = f.read().strip()

    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()

    for function in mod.functions:
        print(function.name)
        get_ir_cycles(function)