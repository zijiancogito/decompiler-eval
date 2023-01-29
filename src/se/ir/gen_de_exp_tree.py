import os
os.chdir('../../data_flow')
import json
from ctypes import *
from exp_tree import *

dese = cdll.LoadLibrary("libse.so")
run_se = dese.process
run_se.argtypes = [POINTER(c_char)]
run_se.restype = c_char_p

file_name = 'test.c'
STR = (c_char * (len(file_name) + 1))(*bytes(file_name,'utf-8'))
cast(STR, POINTER(c_char))
paths = run_se(STR).decode()

paths = load_from_json(json.loads(paths))
