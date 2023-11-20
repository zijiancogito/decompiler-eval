import os
import shutil
import random
import argparse
import logging

def common_de(de_dir, decompilers):
    sets = set()
    for decompiler in decompilers:
        if len(sets) == 0:
            sets = set([os.path.splitext(f)[0] for f in os.listdir(os.path.join(de_dir, decompiler))])
        else:
            sets = sets.intersection(set([os.path.splitext(f)[0] for f in os.listdir(os.path.join(de_dir, decompiler))]))
    return sets


def common(ir_dir, de_dir, out_dir, k, decompilers):
    ir_files = set([os.path.splitext(f)[0] for f in os.listdir(ir_dir)])
    de_files = common_de(de_dir, decompilers)
    common_files = ir_files.intersection(de_files)
    sample_set = random.choices(list(common_files), k)
    
    ir_new_dir = os.path.join(out_dir, 'ir')
    if not os.path.exists(ir_new_dir):
        os.makedirs(ir_new_dir)
    
    for f in sample_set:
        ir_raw = os.path.join(ir_dir, f'{f}.ll')
        ir_new = os.path.join(ir_new_dir, f'{f}.ll')
        shutil.copy(ir_raw, ir_new)

    for decompiler in decompilers:
        de_new_dir = os.path.join(out_dir, decompiler)
        if not os.path.exists(de_new_dir):
            os.makedirs(de_new_dir)
        for f in sample_set:
            de_raw = os.path.join(de_dir, decompiler, f'{f}.c')
            de_new = os.path.join(de_new_dir, f'{f}.c')
            shutil.copy(de_raw, de_new)

def sample_by_ir(ir_dir, de_dir, out_dir, k, decompilers):
    ir_files = set([os.path.splitext(f)[0] for f in os.listdir(ir_dir)])
    sampled_set = random.choices(list(ir_files), k)

    ir_new_dir = os.path.join(out_dir, 'ir')
    if not os.path.exists(ir_new_dir):
        os.makedirs(ir_new_dir)

    for f in sample_set:
        ir_raw = os.path.join(ir_dir, f'{f}.ll')
        ir_new = os.path.join(ir_new_dir, f'{f}.ll')
        shutil.copy(ir_raw, ir_new)

    for decompiler in decompilers:
        de_new_dir = os.path.join(out_dir, decompiler)
        if not os.path.exists(de_new_dir):
            os.makedirs(de_new_dir)
        for f in sampled_set:
            de_raw = os.path.join(de_dir, decompiler, f'{f}.c')
            de_new = os.path.join(de_new_dir, f'{f}.c')
            shutil.copy(de_raw, de_new)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Sample dataset for experiment.')
    parser.add_argument('--ir', type=str, required=True, help='Path to ir')
    parser.add_argument('--de', type=str, required=True, help='Path to dec')
    parser.add_argument('--out', type=str, required=True, help='Path to out')
    parser.add_argument('--log', type=str, required=True, help='Path to logging')
    parser.add_argument('--decompiler', nargs='+', required=True, help='Decompilers.')
    parser.add_argument('-k', type=int, required=True, help='K samples.')
    parser.add_argument('--opt', type=str, choices=['com', 'ir'], required=True)
    
    args = parser.parse_args()

    if not os.path.exists(os.path.dirname(args.log)):
        os.makedirs(os.path.dirname(args.log))
        
    logging.basicConfig(filename=args.log,
                        encoding='utf-8', 
                        format='%(asctime)s %(filename)s : %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %A %H:%M:%S',
                        level=logging.DEBUG,
                        filemode='a')
    
    if args.opt == 'com':
        common(args.ir, args.de, args.out, args.k, args.decompiler)
    elif args.opt == 'ir':
        sample_by_ir(args.ir, args.de, args.out, args.k, args.decompiler)