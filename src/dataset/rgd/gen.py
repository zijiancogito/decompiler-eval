import sys
import os
import argparse
from tqdm import tqdm

def load_config(config_file):
    config= []
    with open(config_file, 'r') as f:
        lines = f.readlines()
        for l in lines:
            config.append(re.sub(' ', '=', l.strip(), 1))
    
    return ' '.join(config)

def generate(dsmith, save_to, config_file, number):
    if not os.path.exists(save_to):
        os.makedirs(save_to)

    config = load_config(config_file)
    for i in tqdm(range(number)):
        out = os.path.join(save_to, f"{i}.c")
        cmd = f"python3 {dsmith} {config} -o {out}"
        os.system(cmd)

    return 


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='gen.py')
    parser.add_argument('-o', '--save', type=str, default='../', help='root path to save the results')
    parser.add_argument('-n', '--number', type=int, default=1000, help='number of source code files you want to generate')
    parser.add_argument('-c', '--config', type=str, default='./config', help='config of DSMITH')
    parser.add_argument('-s', '--script', type=str, default='', help='DSMITH script path')

    args = parser.parse_args()

    generate(args.script, args.save, args.config, args.number)