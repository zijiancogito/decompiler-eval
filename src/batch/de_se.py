import sys
sys.path.append('../se/ir')
sys.path.append('../se/utils')
sys.path.append('../')
import os
os.chdir('../data_flow')
from exp_tree.exp_tree import *
import json
from ctypes import *

dese = cdll.LoadLibrary("libse.so")
run_se = dese.process
run_se.argtypes = [POINTER(c_char)]
run_se.restype = c_char_p

def batch_de_execution(de_dir, save_to):
    de_files = os.listdir(de_dir)
    for filename in de_files:
        de_file = os.path.join(de_dir, filename)
        STR = (c_char * (len(de_file) + 1))(*bytes(de_file,'utf-8'))
        cast(STR, POINTER(c_char))
        paths = run_se(STR).decode()
        paths = load_from_json(json.loads(paths))
        fns = os.path.splitext(filename)[0].split('-')
        funcname = fns[-1]
        fns.pop()
        dir_name = '-'.join(fns)
        dir_path = os.path.join(save_to, dir_name)
        if not os.path.exists(dir_path):
            os.makedirs(dir_path)
        with open(os.path.join(dir_path, funcname + '.json'), 'w') as f:
            json.dump(paths, f)
