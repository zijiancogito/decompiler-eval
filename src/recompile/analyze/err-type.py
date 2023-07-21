import os
import re

def token_type(token):
    if re.match(r'lab\_[\s\S]+', token):
        return 'label'
    else:
        return None

def err_msg_parser(err_msg):
    tokens = re.findall(r"\'([^\']+)\'", err_msg)
    for tok in tokens:
        if token_type(tok) == None:
            print(tok)

def check_file(path):
    with open(path, 'r') as f:
        msgs = f.readlines()
        for msg in msgs:
            err_msg_parser(msg)

def test():
    optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
    compilers = ['clang', 'gcc']
    decompilers = ['BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
    root_dir = '/home/eval/data/POJ/recompile/round-1/raw_compilation-msg'

    for compiler in compilers:
        for opt_level in optimizations:
            for decompiler in decompilers:
                path = os.path.join(root_dir, f"raw-compile-err-{decompiler}.csv")
                check_file(path)

if __name__ == '__main__':
    test()


