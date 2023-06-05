import sys

import os
import llvmlite.binding as llvm
import re

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def read_ir(path):
    ir = None
    with open(path, 'r') as f:
        ir = f.read()
    return ir.strip()

def get_var_count(function):
    last_block = None
    for block in function.blocks:
        last_block = block
    if last_block == None:
        return 0
    last_var = None
    for insn in last_block.instructions:
        pat = '\%([\S]+) [\S\s]+'
        mat = re.match(pat, str(insn).strip())
        if not mat:
            continue
        last_var = int(mat.groups(1)[0])

    if last_var == None:
        return 0
    return last_var

def get_functions(ir_file):
    llvm_ir = read_ir(ir_file)
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    vars = {}
    for function in mod.functions:
        if not re.match('func[0-9]', function.name):
            continue
        vars[function.name] = get_var_count(function)
    return vars


