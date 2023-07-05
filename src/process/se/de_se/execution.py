import sys
import json
from ctypes import *
from json_to_exptree import load_from_json

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
    

