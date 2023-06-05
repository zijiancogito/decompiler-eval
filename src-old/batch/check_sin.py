import sys
import re
import os
import json
import shutil

def check_symbol(symbol):
    if re.match('(rand|param|scanf|printf|__isoc99_scanf|__printf_chk|f_rand|[-]*[0-9]+)[0-9]*', str(symbol)):
        return True
    return False

def check_exp(exp):
    if "children" not in exp:
        return False
    if len(exp["children"]) == 0:
        if check_symbol(exp["data"]) == False:
            return False
    chk = True
    for child in exp["children"]:
        chk = chk & check_exp(child)
    return chk

def check_file(json_file):
    js = None
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."
    
    exps = js["expressions"][0]
    symbols = js["symbols"]
    for sym in symbols:
        check_res = check_symbol(sym)
        assert check_res, f"Invalid symbol {sym}."
    for exp in exps:
        check_res = check_exp(exps[exp])
        assert check_res, f"Invalid expression {exp}."

def check(json_file):
    js = None
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."
    
    exps = js["expressions"][0]
    symbols = js["symbols"]
    for sym in symbols:
        check_res = check_symbol(sym)
        if check_res == False:
            # print(f"Invalid Symbol {sym} in {json_file}")
            return False, sym

    for exp in exps:
        check_res = check_exp(exps[exp])
        if check_res == False:
            # print(f"Invalid Expression {exp} in {json_file}")
            return False, exp
    return True, None

def check_list(l):
    files = []
    with open(l, 'r') as f:
        files = f.readlines()
    basedir = os.path.dirname(l)
    results = {}
    for f in files:
        if 'func' not in f:
            continue
        res, sym = check(os.path.join(basedir, f.strip()))
        if sym != None:
            if sym in results:
                results[sym].append(f)
            else:
                results[sym] = [f]
    for sym in results:
        print(f"{sym}\t{len(results[sym])}")
        for f in results[sym]:
            print(f"\t{f.strip()}")
        print()




if __name__ == "__main__":
    if sys.argv[1] == 'sin':
        check_file(sys.argv[2])
    elif sys.argv[1] == 'list':
        check_list(sys.argv[2])
