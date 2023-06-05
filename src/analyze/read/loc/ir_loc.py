import sys
import os
import llvmlite.binding as llvm
import re

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def get_ir_lines(ir_file, functions=['func0']):
    llvm_ir = None
    with open(ir_file, 'r') as f:
        llvm_ir = f.read().strip()

    assert llvm_ir, f"Load ir file {ir_file} Error."
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()

    locs = {}
    for function in mod.functions:
        if len(functions) > 0 and function.name not in functions:
            continue
        locs[function.name] = line_of_function(function)

    return locs

def line_of_function(function):
    loc = len(str(function).strip().split('\n'))
    return loc

if __name__ == '__main__':
    locs = get_ir_lines('../../test/0.ll', ['func0'])
    print(locs)
