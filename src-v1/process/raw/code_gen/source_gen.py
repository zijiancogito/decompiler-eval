import sys
import os
import argparse
from tqdm import tqdm

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='source_gen.py')
    parser.add_argument('-d', '--dataset', type=str, choices=['df2', 'cf', 'dsmith'], help='dataset')
    parser.add_argument('-o', '--save', type=str, default='../', help='root path to save the results')
    parser.add_argument('-f', '--func', type=int, default=1, help='number of functions in one source file') 
    parser.add_argument('-n', '--number', type=int, default=1000, help='number of source code files you want to generate')
    parser.add_argument('-c', '--config', type=str, default='./config', help='config of CSMITH, REQUIRED when generate CF')
    parser.add_argument('-s', '--script', type=str, default='', help='DSMITH script path')

    args = parser.parse_args()

    save_to = os.path.join(args.save, 'src')
    if not os.path.exists(save_to):
        os.makedirs(save_to)

    code_path = "/home/eval/decompiler-eval/src/process/raw/code_gen"
    if args.dataset == 'df2':
        print(f"Generating source codes for DF2")
        for i in tqdm(range(args.number)):
            out = os.path.join(save_to, f'{i}.c')
            # print(f"Generate {i}.c")
            cmd = f'python3 {code_path}/code_generate/gen.py gen -f {out} -n {args.func}'
            os.system(cmd)
    elif args.dataset == 'cf':
        print(f"Generating source codes for CF")
        config = None
        with open(args.config, 'r') as f:
            config = [i.strip() for i in f.readlines()]
        assert config, "Read config failed."

        for i in tqdm(range(args.number)):
            out = os.path.join(save_to, f'{i}.c')
            cmd = f"csmith {' '.join(config)} --output {out}"
            os.system(cmd)
    elif args.dataset == 'dsmith':
        print(f"Generating source codes for DSMITH")
        config = {'--max-funcs': 1,
                  '--max-args': 0,
                  '--min-args': 0,
                  '--max-block-size': 5,
                  '--min-block-size': 3,
                  '--max-block-depth': 2,
                  '--min-expr-complexity': 2,
                  '--max-expr-complexity': 5,
                  '--max-local-variables': 5,
                  '--min-local-variables': 3,
                  '--max-const-variables': 5,
                  '--min-const-variables': 3,
                  '--max-const-values': 1000}
        config_str = ""
        for k in config:
            v = config[k]
            config_str += f" {k}={v}"
        print(config_str)
        for i in tqdm(range(args.number)):
            out = os.path.join(save_to, f"{i}.c")
            cmd = f"python3 {args.script} {config_str} --divs --logic -o {out}"
            os.system(cmd)
        