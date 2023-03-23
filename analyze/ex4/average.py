import sys
import os
import csv
import numpy as np

root = '/home/eval/DF/var/var_count/de'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']

def analyze(csv_file):
    res = [list()] * len(compilers) * len(decompilers) * len(options)
    with open(csv_file, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        for row in reader:
            src = int(row[1])
            if src == 0:
                continue
            for idx, i in enumerate(row[2:]):
                if int(i) == 0:
                    continue
                else:
                    res[idx].append(abs(src - int(i)) / src)
    print(res)
    return res

def analyze_all():
    csvs = os.listdir(root)
    all_res = [list()] * len(compilers) * len(decompilers) * len(options)
    for csv_file in csvs:
        res = analyze(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            all_res[idx] = all_res[idx] + i

    avg_res = []
    for res in all_res:
        avg_res = np.mean(res)
    print(avg_res)

if __name__ == '__main__':
    analyze_all()

