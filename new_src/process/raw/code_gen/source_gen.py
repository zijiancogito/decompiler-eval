import sys
import os
import argparse
from tqdm import tqdm

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='source_gen.py')
    parser.add_argument('-d', '--dataset', type=str, choices=['df2', 'cf'], help='dataset')
    parser.add_argument('-o', '--save', type=str, default='../', help='root path to save the results')
    parser.add_argument('-f', '--func', type=int, default=1, help='number of functions in one source file') 
    parser.add_argument('-n', '--number', type=int, default=1000, help='number of source code files you want to generate')

    args = parser.parse_args()

    save_to = os.path.join(args.save, 'src')
    if not os.path.exists(save_to):
        os.makedirs(save_to)

    if args.dataset == 'df2':
        print(f"Generating source codes for DF2")
        for i in tqdm(range(args.number)):
            out = os.path.join(save_to, f'{i}.c')
            # print(f"Generate {i}.c")
            cmd = f'python3 code_generate/gen.py gen -f {out} -n {args.func}'
            os.system(cmd)

    
