import sys
import re
import os
import json
import shutil

def check_symbol(symbol):
    if re.match("(rand|param|scanf|f_rand|[-]*[0-9]+|0x[0-9a-fA-F]+)[0-9]*", str(symbol)):
        return True
    return False

def check_exp(exp):
    if "children" not in exp:
        return False
    if len(exp["children"]) == 0:
        return check_symbol(exp["data"])
    chk = True
    for child in exp["children"]:
        chk = chk & check_exp(child)
    return chk

def check(de_json):
    js = None
    with open(de_json, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."

    exps = js["expressions"][0]
    symbols = js["symbols"]
    new_symbols = []
    for sym in symbols:
        # if check_symbol(sym):
            # new_symbols.append(sym)
        if not check_symbol(sym):
            return False

    for exp in exps:
        check_res = check_exp(exps[exp])
        if check_res == False:
            return False

    return True

    # new_js = {"symbols": new_symbols, "expressions": [exps]}
    # with open(de_json, 'w') as f:
        # f.write(json.dumps(new_js))

de_root = '/home/eval/DF/se/de/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'ida', 'RetDec']
options = ['o0', 'o1', 'o2', 'o3', 'os']
move_to = '/home/eval/DF/se/fail_de'
log_root = '/home/eval/DF/err_se'

def check_all(dir):
    sub_dirs = os.listdir(dir)
    compiler = dir.split('/')[-3]
    decompiler = dir.split('/')[-2]
    opt_level = dir.split('/')[-1]
    for index in sub_dirs:
        sub_dir = os.path.join(dir, index)
        jsons = os.listdir(sub_dir)
        for js_file in jsons:
            js_path = os.path.join(sub_dir, js_file)
            if not re.match('func[0-9]\.json', js_file):
                continue
            # check(js_path)
            res = check(js_path)
            new_json = os.path.join(move_to, f'{compiler}-{decompiler}-{opt_level}-{index}-{js_file}')
            if res == False:
                shutil.move(js_path, new_json)
                log_file = os.path.join(log_root, compiler, decompiler, opt_level, 'err.csv')
                with open(log_file, 'w+') as f:
                    f.write(f'\njs_path')


if __name__ == '__main__':
    for compiler in compilers:
        for decompiler in decompilers:
            for opt_level in options:
                sub_dir = os.path.join(de_root, compiler, decompiler, opt_level)
                check_all(sub_dir)

