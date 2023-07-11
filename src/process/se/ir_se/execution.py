import os
import sys

import llvmlite.binding as llvm

import re
import json
from func_timeout import func_set_timeout

sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree/')
from exp_tree import ExpTree, copy_tree, exptree_to_json
from instruction import execution_instruction, execution_phi
from cfg import CFG

import ir_parser

import copy

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
  blocks = {}
  labels = []
  for block in function.blocks:
    label = ir_parser.get_label_of_block(block)
    blocks[label] = block
    labels.append(label)

  cfg = build_cfg(blocks)
  cfg.set_entry(0)
  cfg.set_exit(labels[-1])
  cfg.normalize_cfg()
  paths = cfg.get_all_path()
  
  exe_results = {}
  for path in paths:
    in_symbols_table = {}
    tmp_dict = {}
    ir_parser.find_parameters(str(function).strip(),
                              tmp_dict,
                              in_symbols_table)
    ir_parser.find_inputs(blocks[cfg.entry], tmp_dict, in_symbols_table)
    print(in_symbols_table)

    path_labels = []
    for ver in path:
      block = blocks[ver]
      bb_inst = ir_parser.extract_bb_inst(block)
      path_labels.append(bb_inst)
      
    ret_var = ir_parser.find_return(blocks[cfg.exit])
    print(ret_var)
    ret_value = None
    if ret_var != None and ret_var in tmp_dict:
      ret_value = tmp_dict[ret_var]
    exe_results['-'.join(path_labels)] = copy.deepcopy(ret_value)
    
  return exe_results
      
def execution_block(block, pre_block, tmp_dict):
  for instruction in block.instructions:
    if instruction.opcode == 'phi':
      result = execution_phi(str(instruction).strip(), tmp_dict, pre_block)
      tmp_dict[result[0]] = copy.deepcopy(result[1])
    elif instruction.opcode == 'ret':
      continue
    else:
      execution_instruction(instruction, tmp_dict)
      
  
def build_cfg(blocks):
  cfg = CFG()
  for label in blocks:
    cfg.cfg.add_node(label)
    
  for label in blocks:
    block = blocks[label]
    last_insn = None
    for insn in block.instructions:
      last_insn = insn
    if last_insn.opcode == 'br':
      jump_to = ir_parser.parse_jump_instruction(last_insn)
      for addr in jump_to:
        cfg.cfg.add_edge(label, addr)
  return cfg

def test(ir_path):
  llvm_ir = None
  with open(ir_path, 'r') as f:
    llvm_ir = f.read()
  mod = llvm.parse_assembly(llvm_ir)
  
  for func in mod.functions:
    if func.name == 'func0':
      symbolic_execution(func)

if __name__ == '__main__':
  ir_path = "/home/eval/decompiler-eval/case/22.ll"
  test(ir_path)




    
 