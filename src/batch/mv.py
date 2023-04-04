import os
import csv
import shutil

def mv(csv_path):
    with open(csv_path, 'r') as f:
        reader = csv.reader(f)
        rows = [r for r in reader]
    for r in rows:
        row = r[0]
        if os.path.exists(row):
            tmp_list = row.split('/')
            tmp_list = tmp_list[5:]
            t = '-'.join(tmp_list)
            shutil.move(row, os.path.join("/home/eval/DF/se/fail_de", t))

if __name__ == "__main__":
    csvs = ['/home/eval/decompiler-eval/src/batch/err_vxx.csv', '/home/eval/decompiler-eval/src/batch/err_global.csv', '/home/eval/decompiler-eval/src/batch/err_other.csv']
    for c in csvs:
        mv(c)
