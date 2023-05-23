import os
import sys
from multiprocessing import Process, RLock, freeze_support
import re

import decompiler_angr
import decompiler_binja
import decompiler_ghidra
import decompiler_hexrays
import decompiler_retdec

from tqdm import tqdm
import argparse

import datetime

def decompile(binfile, decompiler, out, func_filter=r'func0'):
    decompiler_output = None
    if decompiler == 'angr':
        try:
            decompiler_output = decompiler_angr.decompile(binfile, func_filter)
        except:
            decompiler_output = "Not Impletement Error."
    elif decompiler == 'BinaryNinja':
        decompiler_output = decompiler_binja.decompile(binfile, func_filter)
    elif decompiler == 'Ghidra':
        decompiler_output = decompiler_ghidra.decompile(binfile)
    elif decompiler == 'Hex-Rays':
        decompiler_output = decompiler_hexrays.decompile(binfile)
    elif decompiler == 'RetDec':
        decompiler_output = decompiler_retdec.decompile(binfile)
    
    with open(out, 'w') as f:
        f.write(decompiler_output)
        
def err_log(err_line):
    with open('log', 'w+') as f:
        f.write(f"{datetime.datetime.now()}\t{err_line}\n")

def batch(idx, bindir, decompiler, outdir, func_filter=r'func0'):
    if not os.path.exists(outdir):
        os.makedirs(outdir)

    binfiles = [f for f in os.listdir(bindir)
                    if re.fullmatch("[0-9]+", f)]

    pro_bar = tqdm(range(len(binfiles)), ncols=80, desc=f"{decompiler}", 
                   position=idx, ascii=True, leave=False)
    for binfile in binfiles:
        binpath = f"{bindir}/{binfile}"
        outpath = f"{outdir}/{binfile}.txt"
        decompile(binpath, decompiler, outpath, func_filter)
        pro_bar.update()
    pro_bar.close()
    
def multi_process(bin_dir, out_dir):
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    # freeze_support()
    process_list = []
    binfiles = os.listdir(bin_dir)
    # pro_bars = [tqdm(range(len(binfiles)), ncols=80, desc=f"{decompiler}", 
    #                delay=0.01, position=idx, ascii=False, leave=False)
    #             for idx, decompiler in enumerate(decompilers)]
    for idx, decompiler in enumerate(decompilers):
        outdir = os.path.join(out_dir, decompiler)
        p = Process(target=batch, args=(idx, bin_dir, decompiler, outdir))
        p.start()
        process_list.append(p)
        # batch(bindir, decompiler, outdir)
    for p in process_list:
        p.join()
        
def process_df2(bin_root, out_root):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'RetDec']
    decompilers = ['angr']
    for compiler in compilers:
        for opt_level in optimizations:
            print(f"Compiler: {compiler}\t Opt Level: {opt_level}")
            for idx, decompiler in enumerate(decompilers):
                bindir = f"{bin_root}/{compiler}/{opt_level}"
                outdir = f"{out_root}/{compiler}/{opt_level}/{decompiler}"
                batch(idx, bindir, decompiler, outdir)
            
            
                

def process_cf(bin_root, out_root):
    compilers = ['clang', 'gcc']
    optimizations = ['o0']
    # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    decompilers = ['Ghidra']
    
    for compiler in compilers:
        for opt_level in optimizations:
            for idx, decompiler in enumerate(decompilers):
                print(f"Compiler: {compiler}\t Opt Level: {opt_level}\tDecompiler: {decompiler}")
                bindir = f"{bin_root}/{compiler}/{opt_level}"
                outdir = f"{out_root}/{compiler}/{opt_level}/{decompiler}"
                batch(idx, bindir, decompiler, outdir, func_filter=r'func\_[0-9]+')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='decompile_all.py')
    parser.add_argument('-d', '--dataset', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-b', '--bin', type=str, help='binary dir')
    parser.add_argument('-s', '--save', type=str, help='save dir')

    args = parser.parse_args()

    if args.dataset == 'df2':
        process_df2(args.bin, args.save)
    elif args.dataset == 'cf':
        process_cf(args.bin, args.save)
