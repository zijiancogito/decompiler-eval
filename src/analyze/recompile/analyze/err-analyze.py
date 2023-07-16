import sys
import os
import subprocess
import shutil

from tqdm import tqdm
import re

import argparse

def parse_token(token_str):
  token_type = re.sub(r'[0-9]+', 'x', str(token_str), 0)
  return token_type

def parse_err(err_str):
  err_pat = r'error: ([^\n]+)'
  err_msgs = re.finditer(err_pat, err_str)
  err_dict = {}
  err_filter = r'\'[^\n\']*\''
  for e in tqdm(err_msgs):
    err_tokens = re.finditer(err_filter, e.group(1))
    err_type = re.sub(err_filter, '', e.group(1), 10).strip()
    token_types = ' '.join([parse_token(t.group(0)) for t in err_tokens])
    if err_type in err_dict:
      if token_types in err_dict[err_type]:
        err_dict[err_type][token_types] += 1
      else:
        err_dict[err_type][token_types] = 1
    else:
      err_dict[err_type] = {}
      err_dict[err_type][token_types] = 1
  
  return err_dict

def analyze_all(decompilers, err_dir, log_dir):
  if not os.path.exists(log_dir):
    os.makedirs(log_dir)
  for decompiler in decompilers:
    err_log_path = os.path.join(err_dir, f"raw-compile-err-{decompiler}.csv")
    token_logs = []
    type_logs = []
    with open(err_log_path, 'r') as f:
      err_dict = parse_err(f.read())
      
      for err_type in err_dict:
        type_count = 0
        for token_type in err_dict[err_type]:
          token_log_line = f"{err_type}\t{token_type}\t{err_dict[err_type][token_type]}"
          token_logs.append(token_log_line)
          type_count += err_dict[err_type][token_type]
        type_log_line = f"{err_type}\t{type_count}"
        type_logs.append(type_log_line)
    
    if not os.path.exists(os.path.join(log_dir, "token")):
      os.makedirs(os.path.join(log_dir, "token"))
    token_log_path = os.path.join(log_dir, "token", f"token-err-{decompiler}.csv")
    token_logs.sort()
    log(token_logs, token_log_path)
    
    if not os.path.exists(os.path.join(log_dir, "type")):
      os.makedirs(os.path.join(log_dir, "type"))
    type_log_path = os.path.join(log_dir, "type", f"type-err-{decompiler}.csv")
    type_logs.sort()
    log(type_logs, type_log_path)

def log(log_list, log_file):
    with open(log_file, 'w') as f:
        for l in log_list:
            f.write(l)
            f.write('\n')

if __name__ == '__main__':
  parser = argparse.ArgumentParser(prog='clang-check.py')
  # parser.add_argument('-D', '--dataset', choices=['df2', 'cf', 'poj'], type=str, help='Datasets')
  parser.add_argument('-e', '--err', type=str, help='dir of DEC')
  parser.add_argument('-l', '--log', type=str, help='log dir')
  parser.add_argument('-D', '--decompilers', nargs='+', help='log dir')
  parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
  parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

  args = parser.parse_args()

  # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
  analyze_all(args.decompilers, args.err, args.log)
