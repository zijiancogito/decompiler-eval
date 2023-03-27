import sys
sys.path.append('./')

import os
dec_root = '/home/eval/DF/de/'
src_root = '/home/eval/DF/data'
out_root = '/home/eval/DF/var/var_count/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko','Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']


