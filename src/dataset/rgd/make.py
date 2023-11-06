import sys
import os
import csv
import subprocess
import argparse
from tqdm import tqdm
import logging


def make_ir(config, src_path, save_to):
    if not os.path.exists(save_to):
        os.makedirs(save_to)
    opt = config["opt"]
    cflags = config["cflags"]
    c_list = os.listdir(src_path)
    cnt = 0
    err_cnt = 0
    total = 0
    for c in tqdm(c_list):
        total += 1
        c_path = os.path.join(src_path, c)
        c_name = os.path.splitext(c)[0]
        ll_path = os.path.join(save_to, c_name+'.ll')
        cmd = f"clang -emit-llvm -{opt} {' '.join(cflags)} {c_path} -S -o {ll_path}"
        with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
            stdout, stderr = p.communicate()
            stderr = stderr.decode('ISO-8859-1')
            if ('error' in stderr):
                logging.error(f"IR ERROR: {opt} {c_path} {stderr}")
                err_cnt += 1
            else:
                logging.info(f"IR PASS: {opt} {c_path}")
                cnt += 1
    print(f"{cnt}/{total} {opt} IR compilation complete.")

def make_bin(config, src_path, save_to):
    if not os.path.exists(save_to):
        os.makedirs(save_to)
    opt = config["opt"]
    cflags = config["cflags"]
    cc = config["cc"]
    c_list = os.listdir(src_path)
    cnt = 0
    err_cnt = 0
    total = 0
    for c in tqdm(c_list):
        total += 1
        c_path = os.path.join(src_path, c)
        c_name = os.path.splitext(c)[0]
        binary_path = os.path.join(save_to, c_name)
        cmd = f"{cc} -{opt} {' '.join(cflags)} {c_path} -o {binary_path}"
        with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
            stdout, stderr = p.communicate()
            stderr = stderr.decode('ISO-8859-1')
            if 'error' in stderr:
                logging.error(f"BIN ERROR: {cc} {opt} {c_path}")
                err_cnt += 1
            else:
                logging.info(f"BIN PASS: {cc} {opt} {c_path}")
                cnt += 1
    print(f"{cnt}/{total} {opt} BIN compilation complete.")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Batch compilation program for random data set.')
    parser.add_argument('--opt', nargs='+', required=True, help="Compiler optimization level.")
    parser.add_argument('--src', type=str, required=True, help='Path to source code')
    parser.add_argument('--out', type=str, required=True, help='Path to save results')
    parser.add_argument('--log', type=str, required=True, help='Path to logging')

    subparsers = parser.add_subparsers(dest="command", help='sub-command help')

    ir_parser = subparsers.add_parser('ir', help='IR')
    ir_parser.add_subparsers()

    bin_parser = subparsers.add_parser('bin', help='BIN')
    bin_parser.add_argument('--cc', type=str, default='gcc', required=False, help='Path to compiler')
    bin_parser.add_subparsers()

    args = parser.parse_args()
    
    if not os.path.exists(os.path.dirname(args.log)):
        os.makedirs(os.path.dirname(args.log))

    logging.basicConfig(filename=args.log,
                        encoding='utf-8', 
                        format='%(asctime)s %(filename)s : %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %A %H:%M:%S',
                        level=logging.DEBUG,
                        filemode='a')


    cflags = ['-fno-inline-functions',
              '-fno-default-inline',
              '-fno-inline-functions-called-once'
    ]


    if args.command == 'ir':
        for opt in args.opt:
            config = {"cflags": cflags, "opt": opt,}
            src_dir = os.path.join(args.src)
            out_dir = os.path.join(args.out, opt)
            make_ir(config, src_dir, out_dir)
    elif args.command == 'bin':
        for opt in args.opt:
            config = {"cflags": cflags, "opt": opt, "cc": args.cc}
            src_dir = os.path.join(args.src)
            out_dir = os.path.join(args.out, args.cc, opt)
            make_bin(config, src_dir, out_dir)

    