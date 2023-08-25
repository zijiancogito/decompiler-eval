import sys

import os
import llvmlite.binding as llvm
import re

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def line_of_function(function):
    loc = len(str(function).strip().split('\n'))
    return loc

def get_ir_function_lines(ir_file):
    llvm_ir = None
    with open(ir_file, 'r') as f:
        llvm_ir = f.read().strip()

    assert llvm_ir, f"Load ir file {ir_file} Error."

    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()
    locs = {}
    for function in mod.functions:
        if not re.match('func[0-9]', function.name):
            continue
        locs[function.name] = line_of_function(function)

    return locs
