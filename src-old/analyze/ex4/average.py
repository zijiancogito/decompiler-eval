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
    var_count = []
    for i in range(len(compilers) * len(decompilers) * len(options)):
        res.append([])
        var_count.append([])
    var_count.append([])
    func_var = {'pos': 0, 'neg': 0, 'eq': 0}
    with open(csv_file, 'r') as f:
        reader = csv.reader(f, delimiter=' ')
        cnt = 0
        for row in reader:
            cnt += 1
            src = int(row[1])
            var_count[0].append(src)
            if src == 0:
                continue
            for idx, i in enumerate(row[2:]):
                var_count[idx+1].append(int(i))
                if int(i) == 0:
                    continue
                else:
                    res[idx].append(round(abs(src - int(i)) / src, 2))
                    if src < int(i):
                        func_var['pos'] = func_var['pos'] + 1
                    elif src > int(i):
                        func_var['neg'] = func_var['neg'] + 1
                    else:
                        func_var['eq'] = func_var['eq'] + 1
    return res, var_count, func_var

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
    all_var_count = [0] * (len(compilers) * len(decompilers) * len(options) + 1)
    func_vars = {'pos': 0, 'neg': 0, 'eq': 0}
    for csv_file in csvs:
        res, var_count, func_var = analyze(os.path.join(root, csv_file))
        func_vars['pos'] = func_vars['pos'] + func_var['pos']
        func_vars['neg'] = func_vars['neg'] + func_var['neg']
        func_vars['eq'] = func_vars['eq'] + func_var['eq']
        for idx, i in enumerate(res):
            all_res[idx] = all_res[idx] + i
        for idx, i in enumerate(var_count):
            all_var_count[idx] += np.sum(i)


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

    print("Variables Count")
    print_var_count(all_var_count)
    print("Average")
    pretty_print(avg_res)
    print("Negative average (src > dec)")
    pretty_print(avg_neg_res)
    print("Postive average (src < dec)")
    pretty_print(avg_pos_res)

    total = func_vars['pos'] + func_vars['neg'] + func_vars['eq']
    print(f"Pos(dec > src): {round(func_vars['pos'] / total, 2)}\nNeg(src > dec): {round(func_vars['neg'] / total, 2)}\nEQ: {round(func_vars['eq'] / total, 2)}")

def print_var_count(var_count):
    cnt = 1
    for compiler in compilers:
        print(f"---------------------------{compiler}-------------------------------")
        print("Decompiler\tSource\tO0\tO1\tO2\tO3\tOs")
        for decompiler in decompilers:
            print("{0:15}".format(decompiler), end='\t')
            print(var_count[0], end='\t')
            for option in options:
                print(var_count[cnt], end='\t')
                cnt += 1
            print()
        print()

def pretty_print(res):
    cnt = 0
    for compiler in compilers:
        print(f"---------------------------{compiler}-------------------------------")
        print("Decompiler\tO0\tO1\tO2\tO3\tOs")
        for decompiler in decompilers:
            print("{0:15}".format(decompiler), end='\t')
            for option in options:
                print(f"{res[cnt]}", end='\t')
                cnt += 1
            print()
        print()

if __name__ == '__main__':
    analyze_all()

