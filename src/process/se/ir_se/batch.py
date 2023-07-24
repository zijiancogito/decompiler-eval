import sys
import os
import re
import argparse
from tqdm import tqdm

import execution

sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from log import log_list2file


def execute_all(ir_dir, save_dir, log_dir, optimizations):
  bugs = []
  for opt_level in optimizations:
    ir_files = os.listdir(os.path.join(ir_dir, opt_level))
    print(f"Executing {opt_level}...")
    fail_cnt = 0
    for ir_file in tqdm(ir_files, desc=f"{opt_level}"):
      ir_path = os.path.join(ir_dir, opt_level, ir_file)
      if not os.path.exists(os.path.join(save_dir, opt_level)):
        os.makedirs(os.path.join(save_dir, opt_level))
      save_path = os.path.join(save_dir, opt_level, f"{ir_file.split('.')[0]}.json")
      try:
        fail = execution.execute_function(ir_path, save_path)
        if fail:
          bugs.append(f"{opt_level}\t{ir_path}")
          fail_cnt += 1
      except:
        bugs.append(f"{opt_level}\t{ir_path}")
        fail_cnt += 1
    print(f"{fail_cnt}/{len(ir_files)} files execution failed in {opt_level}.")
  if not os.path.exists(log_dir):
    os.makedirs(log_dir)
  log_list2file(bugs, os.path.join(log_dir, "execution_bug.log"))
  
if __name__ == '__main__':
  parser = argparse.ArgumentParser(prog='batch.py', description='ir symbolic execution program')
  parser.add_argument('-i', '--ir', type=str, help="ir dir")
  parser.add_argument('-o', '--save', type=str, help="execution result dir")
  parser.add_argument('-l', '--log', type=str, help="execution failed log dir")
  parser.add_argument('-O', '--optimizations', nargs='+', help="Optimizations")
  
  args = parser.parse_args()

  execute_all(args.ir, args.save, args.log, args.optimizations)


