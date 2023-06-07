import os
import sys
import argparse

from tqdm import tqdm

def parse_err_type(path):
    err_logs = []
    with open(path, 'r') as f:
        err_logs = [l.split('\t')[1] for l in f.readlines() if l.strip() != ""]
    
    err_dict = {}
    for err in err_logs:
        if err not in err_dict:
            err_dict[err] = 1
        else:
            err_dict[err] += 1
    return err_dict, len(err_logs)

def analyze_all(compilers, decompilers, optimizations, err_dir, log_dir):
  if not os.path.exists(log_dir):
    os.makedirs(log_dir)

  for decompiler in decompilers:
    err_dict = {}
    for compiler in compilers:
      for opt_level in optimizations:
        log_path = os.path.join(err_dir, compiler, opt_level, f"decompiling-err-{decompiler}.csv")
        _types, _ = parse_err_type(log_path)
        for err in _types:
          if err in err_dict:
            err_dict[err] += _types[err]
          else:
            err_dict[err] = _types[err]
    err_logs = []
    for err in err_dict:
      err_logs.append(f"{err}\t{err_dict[err]}")
    
    log_path = os.path.join(log_dir, f"decompiling-err-{decompiler}.csv")
    log(err_logs, log_path)
    
def log(logs, log_file):
  with open(log_file, 'w') as f:
    for l in logs:
      f.write(f"{l}\n")
      
if __name__ == '__main__':
  parser = argparse.ArgumentParser(prog='decompile/err-analyze.py')
  # parser.add_argument('-D', '--dataset', choices=['df2', 'cf', 'poj'], type=str, help='Datasets')
  parser.add_argument('-e', '--err', type=str, help='dir of DEC')
  parser.add_argument('-l', '--log', type=str, help='log dir')
  parser.add_argument('-D', '--decompilers', nargs='+', help='log dir')
  parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
  parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

  args = parser.parse_args()

  # decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']
  analyze_all(args.compilers, args.decompilers, args.optimizations, args.err, args.log)
