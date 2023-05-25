import os
import sys
import argparse


def err_type(path):
    content = None
    with open(path, 'r') as f:
        content = f.read().strip()
        if len(content.split('\n')) > 3:
            content = None
    return content

def check_err_type(path):
    err_logs = []
    with open(path, 'r') as f:
        err_logs = [l.split('\t')[1] for l in f.readlines() if l.strip() != ""]
    
    err_dict = {}
    for err in err_logs:
        if err not in err_dict:
            err_dict[err] = 1
        else:
            err_dict[err] += 1
    return err_dict, len(err_logs)

def print_err_types(log_dir, optimizations):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            for decompiler in decompilers:
                print(f"{compiler}-{opt_level}-{decompiler}:")
                log_file = os.path.join(log_sub_dir, f"decompiling-err-{decompiler}.csv")
                err_types, err_cnt = check_err_type(log_file)
                for err in err_types:
                    print(f"{err}\t{err_types[err]}/{err_cnt}\t{round(err_types[err]/err_cnt, 2)}")
            print()
        print()

def check_all(de_dir, log_dir, optimizations):
    compilers = ['clang', 'gcc']
    decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']

    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:12}".format("|Angr"), end='\t')
        print("{0:12}".format("|BinaryNinja"), end='\t')
        print("{0:12}".format("|Ghidra"), end='\t')
        print("{0:12}".format("|Hex-Rays"), end='\t')
        print("{0:12}".format("|RetDec"))
        for opt_level in optimizations:
            log_sub_dir = os.path.join(log_dir, compiler, opt_level)
            if not os.path.exists(log_sub_dir):
                os.makedirs(log_sub_dir)
            print("{0:15}".format(opt_level), end='\t')
            
            for decompiler in decompilers:
                logs = []
                dec_sub_dir = os.path.join(de_dir, compiler, opt_level, decompiler)
                dec_files = os.listdir(dec_sub_dir)
                for dec_file in dec_files:
                    content = err_type(os.path.join(dec_sub_dir, dec_file))
                    if content != None:
                        content = ' '.join(content.split('\n'))
                        logs.append(f"{dec_file}\t{content}")
            
                log_file = os.path.join(log_sub_dir, f"decompiling-err-{decompiler}.csv")
                log(logs, log_file)
                print("{0:12}".format(f"{round((len(dec_files) - len(logs)) / len(dec_files), 3)}"), end='\t')

            print()
        print()
                        

def log(logs, log_file):
    with open(log_file, 'w') as f:
        for l in logs:
            f.write(f"{l}\n")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='check_err.py')
    parser.add_argument('-o', '--option', choices=['check', 'print'], type=str, help='Options')
    parser.add_argument('-D', '--dataset', choices=['df2', 'cf'], type=str, help='Datasets')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-l', '--log', type=str, help='log dir')
    
    args = parser.parse_args()

    if args.option == 'check':
        if args.dataset == 'df2':
            optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
            check_all(args.dec, args.log, optimizations)
        elif args.dataset == 'cf':
            optimizations = ['o0']
            check_all(args.dec, args.log, optimizations)
    elif args.option == 'print':
        if args.dataset == 'df2':
            optimizations = ['o0', 'o1', 'o2', 'o3', 'os']
            print_err_types(args.log, optimizations)
        elif args.dataset == 'cf':
            optimizations = ['o0']
            print_err_types(args.log, optimizations)
             
