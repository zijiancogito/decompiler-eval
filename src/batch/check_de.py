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
        res = check_vxx(path)
        if not res:
            with open('err_vxx.csv', 'a') as f:
                writer = csv.writer(f)
                writer.writerow([path])
        res = check_global(path)
        if not res:
            with open('err_global.csv', 'a') as f:
                writer = csv.writer(f)
                writer.writerow([path])
 
        res = check_all_err(path)
        if not res:
            with open('err_other.csv', 'a') as f:
                writer = csv.writer(f)
                writer.writerow([path])

if __name__ == "__main__":
    dir_name = "/home/eval/DF/se/gcc"
    check(dir_name)
