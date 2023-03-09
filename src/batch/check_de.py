import os
import csv
from check import *

def check(path):
    if os.path.isdir(path):
        for f in os.listdir(path):
            new_path = os.path.join(path, f)
            check(new_path)
    else:
        res = check_not_symbol_in_de(path)
        print(path, res)
        if not res:
            with open('err.csv', 'a') as f:
                writer = csv.writer(f)
                writer.writerow([path])
 
if __name__ == "__main__":
    dir_name = "/home/eval/DF/se/clang/ida"
    check(dir_name)