import sys
sys.path.append('./')

import os
from var import *
dec_root = '/home/eval/DF/de/'
src_root = '/home/eval/DF/data'
out_root = '/home/eval/DF/var/var_count/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko','Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']

def count_path(path):
    files = os.listdir(path)
    pats = []
    for f in files:
        pat = get_vars_from_file(os.path.join(path, f))
        pats += pat
        pats = list(set(pats))
    return pats

def count_pats():
    pats = []
    for c in compilers:
        for d in decompilers:
            for o in options:
                path = os.path.join(dec_root, c, d, o)
                pat = count_path(path)
                pats = pats + pat
                pats = list(set(pats))
    src_pat = count_path(src_root)
    pats = pats + src_pat
    pats = list(set(pats))
    for i in pats:
        print(i)


if __name__ == '__main__':
    count_pats()


