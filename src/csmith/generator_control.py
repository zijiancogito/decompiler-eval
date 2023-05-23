import sys

import os

def gen(config_list, save_to):
    cmd = f"csmith {' '.join(config_list)} --output {save_to}"
    os.system(cmd)


if __name__ == "__main__":
    config = None
    with open(sys.argv[1], 'r') as f:
        config = [i.strip() for i in f.readlines()]
    assert config, "Read config failed."
    save_to_dir = '/home/eval/CF'
    gen(config, f'test.c')
