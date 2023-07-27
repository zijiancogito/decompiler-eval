import os
import json
import argparse

def count_json(path):
    json_obj = None
    with open(path, 'r') as f:
        try:
            json_obj = json.load(f)
        except:
            json_obj = None
    
    if json_obj == None:
        return None

    exps = json_obj["paths"]
    paths = []
    for k in list(exps.keys()):
        if k != "":
            paths.append(k)
    return len(paths)

def get_topk(d, topk):
    files = os.listdir(d)
    rets = []
    for f in files:
        path = os.path.join(d, f)
        cnt = count_json(path)
        if cnt != None and cnt <= topk and cnt != 0:
            rets.append(f)
    return set(rets)

def count_irs(root_dir, optimizations, topk):
    for opt in optimizations:
        sub_dir = os.path.join(root_dir, opt)
        ir_files = os.listdir(sub_dir)
        paths = {}
        null_cnt = 0
        for ir_file in ir_files:
            ir_path = os.path.join(sub_dir, ir_file)
            cnt = count_json(ir_path)
            if cnt == 0:
                null_cnt += 1
            if cnt != None and cnt != 0:
                if cnt in paths:
                    paths[cnt] += 1
                else:
                    paths[cnt] = 1
        print(f"Opt {opt}", end='\t')
        keys = list(paths.keys())
        keys.sort()
        topk_cnt = 0
        for key in keys:
            if key <= topk:
                topk_cnt += paths[key]
            # print(f"{key} paths:\t{paths[key]}")
        print(f"TOP {topk}:\t{topk_cnt}\t NULL:\t{null_cnt}")
        print()

def count_decs(root_dir, optimizations, compilers, decompilers, topk):
    for compiler in compilers:
        for opt in optimizations:
            for decompiler in decompilers:
                sub_dir = os.path.join(root_dir, compiler, opt, decompiler)
                ir_files = os.listdir(sub_dir)
                paths = {}
                null_cnt = 0
                for ir_file in ir_files:
                    ir_path = os.path.join(sub_dir, ir_file)
                    cnt = count_json(ir_path)
                    if cnt == 0:
                        null_cnt += 1
                    if cnt != None and cnt != 0:
                        if cnt in paths:
                            paths[cnt] += 1
                        else:
                            paths[cnt] = 1
                print(f"Opt {opt}", end='\t')
                keys = list(paths.keys())
                keys.sort()
                topk_cnt = 0
                for key in keys:
                    if key <= topk:
                        topk_cnt += paths[key]
                    # print(f"{key} paths:\t{paths[key]}")
                # print()
                print(f"TOP {topk}:\t{topk_cnt}\t NULL:\t{null_cnt}")
                print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='count-pathes.py')
    parser.add_argument('-d', '--dir', type=str, help='')
    parser.add_argument('-o', '--option', choices=['ir', 'de'], default='ir')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    parser.add_argument('-k', '--topk', type=int)

    args = parser.parse_args()
    
    if args.option == 'ir':
        count_irs(args.dir, args.optimizations, args.topk)
    elif args.option == 'de':
        count_decs(args.dir, args.optimizations, args.compilers, args.decompilers, args.topk)
