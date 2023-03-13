import sys
import re
import os
import json

def check_symbol(symbol):
    if re.match('(rand|param|scanf|printf|__isoc99_scanf|__printf_chk|f_rand|[-]*[0-9]+)[0-9]*', str(symbol)):
        return True
    print(symbol)
    return False

def check_exp(exp):
    if len(exp["children"]) == 0:
        return check_symbol(exp["data"])
    chk = True
    for child in exp["children"]:
        chk = chk & check_exp(child)
    return chk

def check_df_ir(json_file):
    js = None
    print(f"check {json_file}")
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."

    exps = js["expressions"]
    symbols = js["symbols"]

    for sym in symbols:
        assert check_symbol(sym), f"Check symbols of {json_file} failed."

    for exp in exps:
        assert check_exp(exps[exp]), f"Check expression {exp} in {json_file} failed."

def check_df_ir_dir(dir):
    sub_dirs = os.listdir(dir)

    for sub_dir in sub_dirs:
        files = os.listdir(os.path.join(dir, sub_dir))
        for f in files:
            file_path = os.path.join(dir, sub_dir, f)
            check_df_ir(file_path)

def check_cf_ir(json_file):
    js = None
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."

    for path in js["paths"]:
        exps = path["conditions"]
        symbols = path["symbols"]
        for exp in exps:
            assert check_exp(exp), f"Check expression in {json_file} failed."
        for sym in symbols:
            assert check_symbol(sym), f"Check symbol in {json_file} failed."

def check_cf_ir_dir(dir):
    sub_dirs = os.listdir(dir)

    for sub_dir in sub_dirs:
        files = os.listdir(os.path.join(dir, sub_dir))
        for f in files:
            file_path = os.path.join(dir, sub_dir, f)
            check_cf_ir(file_path)

def check_all_err(json_file):
    with open(json_file, 'r') as f:
        js = json.load(f)
    if 'expressions' in js.keys():
        paths = js["expressions"]
        for path in paths:
            exps = path.values()
            for exp in exps:
                if not check_exp(exp):
                    return False
    return True

def check_vxx(json_file):
    with open(json_file, 'r') as f:
        cnt = f.read()
    l = re.findall('v[0-9]+|a[0-9]+', cnt)
    if len(l) == 0:
        return True
    return False

def check_global(json_file):
    with open(json_file, 'r') as f:
        js = json.load(f)
    for s in js["symbols"]:
        if 'global' in s:
            return False
    return True

if __name__ == "__main__":
    if sys.argv[1] == 'dfir':
        df_ir = "/home/eval/DF/se/ir/"
        for option in ["o0", "o1", "o2", "o3", "os"]:
            dir = os.path.join(df_ir, option)
            check_df_ir_dir(dir)
    elif sys.argv[1] == 'cfir':
        cf_ir = "/home/eval/CSMITH/se/ir/"
        for option in ["o0", "o1", "o2", "o3", "os"]:
            dir = os.path.join(df_ir, option)
            check_cf_ir_dir(dir)

        
    
