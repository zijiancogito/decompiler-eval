import sys

import os
import llvmlite.binding as llvm
import re

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()


def get_vars_from_file(code_file, functions=['func0']):
    llvm_ir = None
    with open(code_file, 'r') as f:
        llvm_ir = f.read().strip()

    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    vars = {}
    for function in mod.functions:
        if function.name not in functions:
            continue
        vars[function.name] = get_var_count(function)
    return vars

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

if __name__ == '__main__':
    vars = get_vars_from_file('../../test/0.ll', ['func0'])
    print(vars)
