import os
os.chdir('../../data_flow')
import sys
sys.path.append('.')
sys.path.append('../')
from exp_tree.exp_tree import *
import json
from ctypes import *

dese = cdll.LoadLibrary("libse.so")
run_se = dese.process
run_se.argtypes = [POINTER(c_char)]
run_se.restype = c_char_p

file_name = '/home/kali/oliver/decompiler-eval/test-manual/decompiler/31-d.c'
STR = (c_char * (len(file_name) + 1))(*bytes(file_name,'utf-8'))
cast(STR, POINTER(c_char))
paths = run_se(STR).decode()

paths = load_from_json(json.loads(paths))

print('\n')
print(file_name)
for i in range(len(paths)):
    path = paths[i]
    print('\n\nPath', i + 1)
    print('Conditions: ')
    for j in range(len(path['conditions'])):
        con = path['conditions'][j]
        print('\nconditions', j + 1, ': ')
        con.show()
    print('\nVariables: ')
    for key in path['outputs'].keys():
        print('')
        print(key, ':')
        path['outputs'][key].show()
