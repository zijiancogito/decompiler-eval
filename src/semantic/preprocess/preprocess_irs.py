import sys
import os
import argparse
from tqdm import tqdm

import llvmlite.binding as llvm
import logging

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()


def delete_attr(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()

    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith('attributes'):
                f.write(l)
            else:
                logging.info(f"Remove ATTR statements from {ir_path}.")

def delete_comment(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    
    with open(ir_path, 'w') as f:
        for l in lines:
            if not l.strip().startswith(';'):
                f.write(l)
            else:
                logging.info(f"Remove COMMENT from {ir_path}.")

def try_load_ir(ir_path):
    content = None
    with open(ir_path, 'r') as f:
        content = f.read().strip()
    try:
        llvm.parse_assembly(content)
    except:
        # shutil.move(ir_path, os.path.join(out_dir, ir_bname))
        os.unlink(ir_path)
        logging.info(f"File {ir_path} cannot be parsed by llvmlite.")

def check_load_ir(ir_path):
    content = None
    with open(ir_path, 'r') as f:
        content = f.read().strip()
    
    try:
        llvm.parse_assembly(content)
        return True
    except:
        return False

def delete(ir_dir, passes=[]):
    ir_files = os.listdir(ir_dir)
    for ir_file in tqdm(ir_files):
        ir_path = os.path.join(ir_dir, ir_file)
        if 'attr' in passes:
            delete_attr(ir_path)
        if 'comment' in passes:
            delete_comment(ir_path)
        if 'load' in passes:
            try_load_ir(ir_path)

def check(ir_dir):
    ir_files = os.listdir(ir_dir)
    cnt = 0
    for ir_file in tqdm(ir_files):
        ir_path = os.path.join(ir_dir, ir_file)
        chk_res = check_load_ir(ir_path)
        if chk_res == False:
            cnt += 1
            logging.error(f"File {ir_path} check failed.")
    print(f"{cnt} files check failed. Please check log file for the details.")
    
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Preprocess IR files.')
    parser.add_argument('--src', type=str, required=True, help='Path to source code')
    parser.add_argument('--log', type=str, required=True, help='Path to logging')
    parser.add_argument('--opt', choices=['del', 'chk'], required=True, help='Options')
    parser.add_argument('--pass', nargs='+', required='True', help='Checking passes.')
    
    args = parser.parse_args()

    if not os.path.exists(os.path.dirname(args.log)):
        os.makedirs(os.path.dirname(args.log))
        
    logging.basicConfig(filename=args.log,
                        encoding='utf-8', 
                        format='%(asctime)s %(filename)s : %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %A %H:%M:%S',
                        level=logging.DEBUG,
                        filemode='a')

    if args.opt == 'del':
        delete(args.src, args.pass)
    elif args.opt == 'chk':
        check(args.src)        
    
    


    

