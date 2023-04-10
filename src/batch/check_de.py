import os
import csv
from check import *

def check(path):
    if os.path.isdir(path):
        for f in os.listdir(path):
            new_path = os.path.join(path, f)
            check(new_path)
    else:
        if os.path.splitext(path)[1] != '.json':
            return

        tmp_list = path.split('/')
        dec = tmp_list[6]

        res = check_err(path)
        if not res:
            print(path)
            with open(f'err/err_{dec}.csv', 'a') as f:
                writer = csv.writer(f)
                writer.writerow([path])

if __name__ == "__main__":
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'ida', 'RetDec']
    compilers = ['clang', 'gcc']
    for dec in decompilers:
        for com in compilers:
            check(f"/home/eval/DF/se/{com}/{dec}")
