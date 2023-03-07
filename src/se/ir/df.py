import os
import sys
sys.path.append('../utils')
sys.path.append('.')
sys.path.append('../..')

from func_timeout import func_set_timeout
import utils
import llvmlite.binding as llvm
import re
from ircfg import *
import networkx as nx
from execution import execution_var, find_parameters

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

def symbolic_execution(function):
    tmp_dict = {}
    iidx_table = {}
    oidx_table = {}
    output_symbols = {}

    find_parameters(function, tmp_dict, iidx_table)
    for block in function.blocks:
        execution_var(block, tmp_dict, iidx_table, oidx_table, output_symbols)

    input_symbols = []
    for sym in iidx_table:
        if sym not in ['scanf', 'param']:
            input_symbols.append(sym)
            continue

        for i in range(iidx_table[sym]):
            input_symbols.append(f"{sym}{i}")

    return output_symbols, input_symbols

def dump_to_file(save_to, filename, funcname, exps, input_s):
    if not os.path.exists(os.path.join(save_to, filename)):
        os.makedirs(os.path.join(save_to, filename))

    outfile = os.path.join(save_to, filename, f'{funcname}.json')
    js_dict = {}
    exps_json = {}
    for v in exps:
        exps_json[v] = exptree_to_json(exps[v])
    js_dict['expressions'] = exps_json
    js_dict['symbols'] = input_s
    with open(outfile, 'w') as out:
        json.dump(js_dict, out)

def process_functions(llvm_ir, filename, save_to):
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    for function in mod.functions:
        if function.name in utils.compiler_generated_funcs:
            continue
        if function.name in utils.syscall_funcs:
            continue
        if function.name.startswith('llvm.lifetime'):
            continue
        if function.name in ['f_scanf_nop', 'f_printf', 'f_rand', 'main']:
            continue
        output_s, input_s= symbolic_execution(function)
        if output_s != None:
            dump_to_file(save_to, filename, function.name, output_s, input_s)

if __name__ == '__main__':
    llvm_ir = read_ir("/home/eval/DF/ir_test/8.ll")
    process_functions(llvm_ir, '13', '.')


