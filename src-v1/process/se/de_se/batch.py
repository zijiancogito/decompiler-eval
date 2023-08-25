import sys
import os
import argparse

sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from path_process import change_ext
from log import log_list2file


def se_all(dec_path, save_dir, log_path):
  if not os.path.exists(save_dir):
    os.makedirs(save_dir)
  save_path = os.path.join(save_dir, f"{change_ext(dec_path, 'json', '.')}")
  fail = exe_cf.process_function(dec_path, save_path)
  if fail:
    log_dir = os.path.dirname(log_path)
    if not os.path.exists(log_dir):
      os.makedirs(log_dir)
    log_list2file([dec_path], log_path)
    