import sys
import re
import os
import json
import shutil

def check_symbol(symbol):
    res = re.match('(rand|param|scanf|printf|__isoc99_scanf|__printf_chk|f_rand|[-]*[0-9]+)[0-9]*', str(symbol))
    assert res, "Invalid symbos {symbol}."
    return res

def check_exp(exp):
    if "children" not in exp:
        return False
    if len(exp["children"]) == 0:
        return check_symbol(exp["data"])
    chk = True
    for child in exp["children"]:
        chk = chk & check_exp(child)
    return chk

def check_file(json_file):
    js = None
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."
    
    for path in js["paths"]:
        exps = path["expressions"]
        symbols = path["symbols"]
        for sym in symbols:
            check_res = check_symbol(sym)
            assert check_res, f"Invalid symbol {sym}."

        for exp in exps:
            check_res = check_exp(exps[exp])
            assert check_res, f"Invalid expression {exp}."

if __name__ == "__main__":
    check_file(sys.argv[1])
