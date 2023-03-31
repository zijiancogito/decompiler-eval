import sys

import os
 
root = '/home/eval/DF/err_se/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']
root_de_err = '/home/eval/DF/err_de/'

def get_line(f):
    s = 0
    with open(f) as f:
        lines = f.readlines()
        for l in lines:
            if l.strip() != '':
                s += 1
    return s

def analyze(compiler, decompiler):
    total = 0
    total_de = 0
    for option in options:
        se_csv = os.path.join(root, compiler, decompiler, option, 'err.csv')
        de_csv = os.path.join(root_de_err, compiler, decompiler, option, 'err.csv')
        de_count = 1000 - get_line(de_csv)
        se_count = (de_count * 10) - get_line(se_csv)
        if de_count == 0:
            print(f"{compiler} {decompiler} {option}: 0 0")
        else:
            print(f"{compiler} {decompiler} {option}: {se_count} {round(se_count/ (de_count*10), 2)}")
        total += se_count
        total_de += (1000 - de_count) * 10
    if total_de == 0:
        print(f"Total {compiler} {decompiler}: 0 0")
    else:
        print(f"Total {compiler} {decompiler}: {total} {round(total/ total_de, 2)}")
    print("=========================================================")

def analyze_all():
    for compiler in compilers:
        for decompiler in decompilers:
            analyze(compiler, decompiler)

if __name__ == '__main__':
    analyze_all()
