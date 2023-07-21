import os
import re

def token_type(token):
    raise NotImplementedError

def err_msg_parser(err_msg):
    tokens = re.findall(r"\'[^\']*\'", err_msg)
    print(tokens)


def test():
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    compilers = ['clang', 'gcc']
    decompilers = ['BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    root_dir = '/home/eval/data/POJ/recompile

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:

