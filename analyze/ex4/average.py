import sys
import os
import csv
import numpy as np

import pdb

root = '/home/eval/DF/var/var_count/de'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']

def analyze(csv_file):
    res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        res.append([])
    with open(csv_file, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        cnt = 0
        for row in reader:
            cnt += 1
            src = int(row[1])
            if src == 0:
                continue
            for idx, i in enumerate(row[2:]):
                if int(i) == 0:
                    continue
                else:
                    res[idx].append(round(abs(src - int(i)) / src, 2))
    return res

def analyze_neg(csv_file):
    res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        res.append([])
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
                    if src - int(i) > 0:
                        res[idx].append(round((int(i)- src) / src, 2))
                    else:
                        continue
    return res

def analyze_pos(csv_file):
    res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        res.append([])
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
                    if src - int(i) < 0:
                        res[idx].append(round((int(i) - src) / src, 2))
                    else:
                        continue
    return res


def analyze_all():
    csvs = os.listdir(root)
    all_res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        all_res.append([])
    for csv_file in csvs:
        res = analyze(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            all_res[idx] = all_res[idx] + i

    avg_res = []
    for res in all_res:
        if len(res) == 0:
            avg_res.append(0)
        else:
            avg_res.append(round(np.mean(res), 2))

    neg_res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        neg_res.append([])
    for csv_file in csvs:
        res = analyze_neg(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            neg_res[idx] = neg_res[idx] + i

    avg_neg_res = []
    for res in neg_res:
        if len(res) == 0:
            avg_neg_res.append(0)
        else:
            avg_neg_res.append(round(np.mean(res), 2))

    pos_res = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        pos_res.append([])
    for csv_file in csvs:
        res = analyze_pos(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            pos_res[idx] = pos_res[idx] + i

    avg_pos_res = []
    for res in pos_res:
        if len(res) == 0:
            avg_pos_res.append(0)
        else:
            avg_pos_res.append(round(np.mean(res), 2))
    
    print("Average")
    pretty_print(avg_res)
    print("Negative average (src > dec)")
    pretty_print(avg_neg_res)
    print("Postive average (src < dec)")
    pretty_print(avg_pos_res)

def pretty_print(res):
    cnt = 0
    for compiler in compilers:
        print(compiler)
        for decompiler in decompilers:
            print(decompiler, end='\t')
            for option in options:
                print(f"{res[cnt]}", end='\t')
                cnt += 1
            print()
        print()

if __name__ == '__main__':
    analyze_all()

