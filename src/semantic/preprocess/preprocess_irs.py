import sys
import os
import argparse
from tqdm import tqdm

import llvmlite.binding as llvm
import shutil

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def check_attr(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()

    for l in lines:
        if l.strip().startswith('attributes'):
            return False
    return True 

def delete_attr(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()

    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith('attributes'):
                f.write(l)

def delete_comment(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    
    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith(';'):
                f.write(l)

def try_load_ir(ir_path, out_dir):
    lines = None
    with open(ir_path, 'r') as f:
        content = f.read().strip()
    ir_bname = os.path.basename(ir_path)
    try:
        mod = llvm.parse_assembly(content)
    except:
        shutil.move(ir_path, os.path.join(outdir, ir_bname))

def delete(ir_dir, out_dir):
    ir_files = os.listdir(ir_dir)


