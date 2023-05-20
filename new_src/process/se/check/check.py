import sys
import os
import re 
import json
import shutil
import argparse
from tqdm import tqdm

optimizations = ['o0', 'o1', 'o2', 'o3', 'os']

def check_symbol(symbol):
    if re.match('(rand|f_rand|param|scanf|[-]*[0-9]+|0x[0-9a-fA-F]+)[0-9]*', str(symbol)):
        return True
    return False

def check_exp(exp, err_symbols):
    if "children" not in exp:
        return False
    if len(exp["children"]) == 0:
        isValid = check_symbol(exp["data"])
        if not isValid:
            err_symbols.append(exp["data"])
        return isValid
    chk = True
    for child in exp["children"]:
        chk = chk & check_exp(child, err_symbols)
    return chk

def check_file(json_file):
    js = None
    with open(json_file, 'r') as f:
        js = json.load(f)
    assert js, "Json loading failed."

    exps = js["expressions"]
    symbols = js["symbols"]
    invalid_symbols = []

    check_result = True

    for sym in symbols:
        isValid = check_symbol(sym)
        if isValid == False:
            check_result = False
            invalid_symbols.append(sym)
    
    invalid_exps = {}
    for exp in exps:
        err_symbols = []
        isValid = check_exp(exps[exp], err_symbols)
        if isValid == False:
            check_result = False
            invalid_exps[exp] = err_symbols

    log = None
    if not check_result:
        tmp_logs = []
        for exp in invalid_exps:
            tmp_log = f"{exp} {' '.join(invalid_exps[exp])}"
            tmp_logs.append(tmp_log)
        tmp_logs = "\t".join(tmp_logs)
        
        log = f"{json_file} | {' '.join(invalid_symbols)} | {tmp_logs}"

    return check_result, log


def check_ir(ir_dir, log_dir, move_dir):
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    for opt_level in optimizations:
        irs = os.listdir(os.path.join(ir_dir, opt_level))
        log_file = os.path.join(log_dir, f"{opt_level}-check.log")
        move_to = os.path.join(move_dir, opt_level)
        if not os.path.exists(move_to):
            os.makedirs(move_to)
        invalid_irs = []
        with open(log_file, 'w') as f:
            for ir in tqdm(irs):
                ir_path = os.path.join(ir_dir, opt_level, ir)
                isValid, log = check_file(ir_path)
                if log != None:
                    f.write(f"{log}\n")
                    invalid_irs.append(ir_path)

        for err_ir in invalid_irs:
            shutil.copy(err_ir, move_to)
        print(f"{len(invalid_irs)}/{len(irs)} files failed in {opt_level}.")
        print()


def check_de(de_dir, log_dir, move_dir):
    compilers = ['clang', 'gcc']
    decompilers = ['Ghidra', 'angr', 'BinaryNinja', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                log_file = os.path.join(log_sub_dir, f"{decompiler}-check.log")
                move_to = os.path.join(move_dir, compiler, opt_level, decompiler)
                if not os.path.exists(move_to):
                    os.makedirs(move_to)

                de_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                des = os.listdir(de_sub_dir)

                invalid_des = []
                with open(log_file, 'w') as f:
                    for de in tqdm(des):
                        de_path = os.path.join(de_sub_dir, de)
                        isValid, log = check_file(de_path)
                        if log != None:
                            f.write(f"{log}\n")
                            invalid_des.append(de_path)

                for err_de in invalid_des:
                    shutil.move(err_de, move_to)

                print(f"{len(invalid_des)}/{len(des)} files failed in {compiler} {opt_level} {decompiler}.")
                print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check.py')
    parser.add_argument('-c', '--choice', type=str, choices=['ir', 'de'], help="check ir or de")
    parser.add_argument('-i', '--input', type=str, help="check input dir")
    parser.add_argument('-l', '--log', type=str, help="log dir")
    parser.add_argument('-o', '--move', type=str, help="move invalid file to move dir")

    args = parser.parse_args()

    if args.choice == 'ir':
        check_ir(args.input, args.log, args.move)
    elif args.choice == 'de':
        check_de(args.input, args.log, args.move)

