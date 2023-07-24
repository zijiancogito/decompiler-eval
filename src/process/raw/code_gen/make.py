import sys
import os
import csv
import subprocess
import argparse
from tqdm import tqdm

err_list = []

def compile_ir(opt_level, src_path, save_to):
    c_list = os.listdir(src_path)
    cnt = 0
    total = 0
    for c in tqdm(c_list):
        total += 1
        c_path = os.path.join(src_path, c)
        c_name = os.path.splitext(c)[0]
        ll_path = os.path.join(save_to, c_name+'.ll')
        cmd = f'clang -{opt_level.capitalize()} -emit-llvm -fno-inline-functions -fno-default-inline -fno-inline-functions-called-once ' + c_path + ' -S -o ' + ll_path
        with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
            stdout, stderr = p.communicate()
            stderr = stderr.decode('ISO-8859-1')
            if ('error' in stderr):
                print(c_path, stderr)
                # with open(f'err_{opt_level}_ir.csv', 'a') as f:
                    # row = [c_path]
                    # write = csv.writer(f)
                    # write.writerow(row)
                # print(f'{opt_level}-ir-Error: ', c_path)
            else:
                cnt += 1
                # print(f'{opt_level}-ir-Complete: ', c_path)

    print(f"{cnt}/{total} {opt_level}-ir-Complete.")

def compile_bin(opt_level, compiler, src_path, save_to):
    c_list = os.listdir(src_path)
    cnt = 0
    total = 0
    for c in tqdm(c_list):
        total += 1
        c_path = os.path.join(src_path, c)
        c_name = os.path.splitext(c)[0]
        binary_path = os.path.join(save_to, c_name)
        cmd = f'{compiler} -fno-default-inline -{opt_level.capitalize()} -fno-inline-functions -fno-inline-functions-called-once ' + c_path + ' -o ' + binary_path
        with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
            stdout, stderr = p.communicate()
            stderr = stderr.decode('ISO-8859-1')
            if ('error' in stderr):
                print(c_path, stderr)
                # with open(f'err_{opt_level}_c.csv', 'a') as f:
                    # row = [c_path]
                    # write = csv.writer(f)
                    # write.writerow(row)
                # print(f'{opt_level}-c-Error: ', c_path)
            else:
                cnt += 1
                # print(f'{opt_level}-c-Complete: ', c_path)
    print(f"{cnt}/{total} {opt_level}-bin-Complete.")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='compile source')
    parser.add_argument('--opt', type=str, choices=['o0', 'o1', 'o2', 'o3', 'os'], help="compiler optimization level.")
    parser.add_argument('-c', '--compiler', choices=['clang', 'gcc'], type=str, required=False, help="compiler")
    parser.add_argument('--ir', action='store_true', help="ir or bin")
    parser.add_argument('--src', type=str, default='../src', help='path to source code to be compiled')
    parser.add_argument('-o', '--save-to', default='../', help='path to save results')

    args= parser.parse_args()
    
    if args.ir:
        save_to = os.path.join(args.save_to, args.opt)
        if not os.path.exists(save_to):
            os.makedirs(save_to)
        compile_ir(args.opt, args.src, save_to)
    else:
        save_to = os.path.join(args.save_to, args.compiler, args.opt)
        if not os.path.exists(save_to):
            os.makedirs(save_to)
        compile_bin(args.opt, args.compiler, args.src, save_to)
