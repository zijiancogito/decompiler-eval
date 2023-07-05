import os
import sys

import llvmlite.binding as llvm

import re
import json
from func_timeout import func_set_timeout

sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree/')
from exp_tree import ExpTree, copy_tree, exptree_to_json
from instruction import execution_instruction

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

def execute_function(ir_path, save_to, func_filter='func'):
  llvm_ir = None
  with open(ir_path, 'r') as f:
    llvm_ir = f.read().strip()
  assert llvm_ir, f"Failed to read IR file {ir_path}."
  
  mod = llvm.parse_assembly(llvm_ir)
  mod.verify()
  try:
    for function in mod.functions:
      if function.name != 'func':
        continue
      exps, syms = symbolic_execution(function)
      if exps != None:
        dump_to_file(save_to, exps, syms)
      break
  except:
    return True

def dump_to_file(save_to, exps, syms):
  js_dict = {}
  exps_json = {}
  for path in exps:
    exps_json[path] = exptree_to_json(exps[path])
  js_dict["symbols"] = syms
  js_dict["path"] = exps_json
  with open(save_to, 'w') as out:
    json.dump(js_dict, out)
    
def symbolic_execution(function):
  in_symbols_table = {}

  find_parameters(str(function).strip(),
                  tmp_dict,
                  in_symbols_table)
  
  for 