import sys

import os
import json

def check_symbol(symbol):
    if re.match('(param|scanf|f_rand)[0-9]*'):
        return True
    return False

def check_exp(exp):
    if len(exp.children) == 0:
        return check_symbol(exp.root_data)
    chk = True
    for child in exp.children:
        chk = chk & check_exp(child)
    return chk

def check_df_ir(json_file):
    js = None
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
        files = os.listdir(sub_dir)
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
        for sym in symbosl:
            assert check_symbol(sym), f"Check symbol in {json_file} failed."

def check_cf_ir_dir(dir):
    sub_dirs = os.listdir(dir)

    for sub_dir in sub_dirs:
        files = os.listdir(sub_dir)
        for f in files:
            file_path = os.path.join(dir, sub_dir, f)
            check_cf_ir(file_path)


if __name__ == "__main__":
    if sys.argv[1] == 'dfir':
        df_ir = "/home/eval/DF/se/ir/"
        for option in ["o0", "o1", "o2", "o3", "os"]:
            dir = os.path.join(df_ir, option)
            check_df_ir_dir(dir)
    elif sys.argv[1] == 'cfir':
        df_ir = "/home/eval/DF/se/ir/"
        for option in ["o0", "o1", "o2", "o3", "os"]:
            dir = os.path.join(df_ir, option)
            check_cf_ir_dir(dir)

        
    
