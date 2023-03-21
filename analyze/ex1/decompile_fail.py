import sys

import os

root = '/home/eval/DF/err_de/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']

def analyze(compiler, decompiler):
    total = 0
    for option in ['o0', 'o1', 'o2', 'o3', 'os']:
        csv_path = os.path.join(root, compiler, decompiler, option, 'err.csv')
        with open(csv_path) as f:
            lines = f.readlines()
            print(f"{compiler} {decompiler} {option}: {len(lines)} {len(lines)/1000}")
            total += len(lines)
    print(f"Total {compiler} {decompiler}: {total} {total/5000}")
    print("=========================================================")

def analyze_all():
    for compiler in compilers:
        for decompiler in decompilers:
            analyze(compiler, decompiler)


if __name__ == '__main__':
    analyze_all()
