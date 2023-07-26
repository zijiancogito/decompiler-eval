import sys
import json
from ctypes import *
from func_timeout import func_set_timeout
from json_to_exptree import load_from_json

@func_set_timeout(15)
def execute_function(dec_path, save_to, exp):
  paths = symbolic_execution(dec_path, exp)
  if paths is not None:
    dump_to_file(save_to, paths)
    return False
  else:
    with open(save_to, 'w') as f:
      f.write("")
    return True

def dump_to_file(save, paths):
  with open(save, 'w') as f:
    json.dump(paths, f)

def symbolic_execution(de_file, exp):
    dese = cdll.LoadLibrary("/home/eval/decompiler-eval/src/process/se/de_se/se/libse.so")
    run_se = dese.process
    run_se.argtypes = [POINTER(c_char), c_int]
    run_se.restype = c_char_p
    STR = (c_char * (len(de_file) + 2))(*bytes(de_file,'utf-8'))
    cast(STR, POINTER(c_char))
    paths = run_se(STR, 0)

    if paths is not None:
        paths = load_from_json(json.loads(paths.decode()), exp)

    return paths

