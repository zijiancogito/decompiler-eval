import sys
import os
import csv
import subprocess
import argparse
from tqdm import tqdm

err_list = []


def make_ir(opt_level, src_path, save_to):
    c_list = os.listdir(src_path)
    cnt = 0
    total = 0
    for c in tqdm(c_list):
        total += 1
        c_path = os.path.join(src_path, c)
        c_name = os.path.splitext(c)[0]
        ll_path = os.path.join(save_to, c_name+'.ll')
        cmd = f'clang -{opt_level.capitalize()} -emit-llvm -fno-inline-functions -fno-default-inline -fno-inline-functions-called-once ' + c_path + ' -S -o ' + ll_path
        with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
            stdout, stderr = 