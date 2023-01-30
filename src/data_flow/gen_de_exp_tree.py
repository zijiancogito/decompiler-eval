import os
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

file_name = '/root/decompiler-eval/test-manual/decompiler/13-d.c'
STR = (c_char * (len(file_name) + 1))(*bytes(file_name,'utf-8'))
cast(STR, POINTER(c_char))
paths = run_se(STR).decode()

paths = load_from_json(json.loads(paths))
