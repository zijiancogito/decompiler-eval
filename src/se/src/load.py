import angr
import sys
sys.path.append('.')
from utils import *

def load(bin_path):
    print("Loading binary.")
    proj = angr.Project(bin_path, auto_load_libs=False)

    print("Building CFG")
    proj.cfg = proj.analyses.CFGFast(normalize=True)
    proj.funcs = proj.cfg.kb.functions

    #map from addr to block
    proj.block_map = {}
    for func in proj.funcs.values():
        for blk in func.blocks:
            proj.block_map[blk.addr] = blk

    # init function arg register
    proj.func_calling_regs = {}

    # handle entry function
    proj.analysis_funcs = [
            f_addr for f_addr in proj.funcs
            if 'sub' not in proj.funcs[f_addr].name
            and '$' not in proj.funcs[f_addr].name
            and proj.funcs[f_addr].name not in compiler_generated_funcs 
            and proj.funcs[f_addr].name not in syscall_funcs
    ]

    # collect debug mapping
    
    for f in proj.analysis_funcs:
        print(f'{hex(f)}: {proj.funcs[f].name}')

    # get hook points
    # when se we should not jmp to the function
    proj.hook_points = {}
    for f in proj.analysis_funcs:
        proj.hook_points[f] = find_hook_points(proj, f)

    # get exit points
    proj.exit_points = {}
    for f in proj.analysis_funcs:
        proj.exit_points[f] = find_exit_points(proj, f)

    proj.ret_points = {}
    for f in proj.analysis_funcs:
        proj.ret_points[f] = find_ret_points(proj, f)

    proj.mem_read_dict = {}
    proj.mem_write_dict = {}

    proj.mem_write_litf_dict = {}

    return proj

def find_hook_points(proj, func_addr):
    assert (func_addr in proj.funcs)

    # hook_points contain list of (hook_address, skip_length)
    # skip_length is the size of current instruction
    hook_points = []
    bbs = proj.funcs[func_addr].blocks
    for bb in bbs:
        for insn in bb.capstone.insns:
            mne = insn.mnemonic
            if mne in x86_call:
                hook_points.append((insn.address, insn.size))
    return hook_points 

def find_exit_points(proj, func_addr):
    assert (func_addr in proj.funcs)
    exit_points = []
    bbs = proj.funcs[func_addr].blocks
    for bb in bbs:
        insn = bb.capstone.insns[-1]
        mne = insn.mnemonic
        if mne in x86_exit:
            exit_points.append(insn.address)
    return exit_points
            
def func_prologue_analysis(proj):
    proj.func_prologue_summary = {}
    proj.func_prologue_end_addr = {}
    # for func_addr in proj.analysis_funcs:
        # try:
            # proj.func_prologue_end_addr[func_addr] = 

def find_ret_points(proj, func_addr):
    # Find all output points
    # 1. return value: read eax before execute ret.
    # 2. printf
    assert (func_addr in proj.funcs)

    ret_eax = []
    bbs = proj.funcs[func_addr].blocks

    for bb in bbs:
        insn = bb.capstone.insns[-1]
        mne = insn.mnemonic
        if mne == 'ret':
            ret_eax.append(insn.address)

