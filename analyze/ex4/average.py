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
    return res

def analyze_neg(csv_file):
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
                    if src - int(i) < 0:
                        res[idx].append((src - int(i)) / src)
                    else:
                        continue
    return res

def analyze_pos(csv_file):
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
                    if src - int(i) >= 0:
                        res[idx].append((src - int(i)) / src)
                    else:
                        continue
    return res

def analyze_all():
    csvs = os.listdir(root)
    all_res = [[0]] * len(compilers) * len(decompilers) * len(options)
    for csv_file in csvs:
        res = analyze(os.path.join(root, csv_file))
        import pdb
        pdb.set_trace()
        for idx, i in enumerate(res):
            print(i)
            all_res[idx] = all_res[idx] + np.sum(i)

    avg_res = []
    for res in all_res:
        avg_res.append(np.mean(res))

    neg_res = [[0]] * len(compilers) * len(decompilers) * len(options)
    for csv_file in csvs:
        res = analyze(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            neg_res[idx] = neg_res[idx] + np.sum(i)

    avg_neg_res = []
    for res in neg_res:
        avg_neg_res.append(np.mean(res))

    pos_res = [[0]] * len(compilers) * len(decompilers) * len(options)
    for csv_file in csvs:
        res = analyze(os.path.join(root, csv_file))
        for idx, i in enumerate(res):
            pos_res[idx] = pos_res[idx] + np.sum(i)

    avg_pos_res = []
    for res in pos_res:
        avg_pos_res.append(np.mean(res))
    
    print(avg_res)
    print(avg_neg_res)
    print(avg_pos_res)

if __name__ == '__main__':
    analyze_all()

