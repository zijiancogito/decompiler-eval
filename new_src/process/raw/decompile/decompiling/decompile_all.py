import os
import sys

import decompiler_angr
import decompiler_binja
import decompiler_ghidra
import decompiler_hexrays
import decompiler_retdec

from tqdm import tqdm
import argparse

def decompile(binfile, decompiler, out):
    decompiler_output = None
    if decompiler == 'angr':
        decompiler_output = decompiler_angr.decompile(binfile, r'func0')
    elif decompiler == 'BinaryNinja':
        decompiler_output = decompiler_binja.decompile(binfile, r'func0')
    elif decompiler == 'Ghidra':
        decompiler_output = decompiler_ghidra.decompile(binfile)
    elif decompiler == 'Hex-Rays':
        decompiler_output = decompiler_hexrays.decompile(binfile)
    elif decompiler == 'RetDec':
        decompiler_output = decompiler_retdec.decompile(binfile)
        
    with open(out, 'w') as f:
        f.write(decompiler_output)
        
def batch(bindir, decompiler, outdir):
    if not os.path.exists(outdir):
        os.makedirs(outdir)

    binfiles = os.listdir(bindir)
    for binfile in tqdm(binfiles):
        binpath = os.path.join(bindir, binfile)
        outpath = os.path.join(outdir, f"{binfile.split('.')[0]}.txt")
        decompile(binpath, decompiler, outpath)
        
def process_df2(bin_root, out_root):
    compilers = ['clang', 'gcc']
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    
    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                bindir = os.path.join(bin_root, compiler, opt_level, decompiler)
                outdir = os.path.join(out_root, compiler, opt_level, decompiler)
                batch(bindir, decompiler, outdir)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='decompile_all.py')
    parser.add_argument('-d', '--dataset', choices=['df2'], type=str, help='Datasets')
    parser.add_argument('-b', '--bin', type=str, help='binary dir')
    parser.add_argument('-s', '--save', type=str, help='save dir')

    args = parser.parse_args()

    if args.experiment == 'df2':
        process_df2(args.bin, args.save)
