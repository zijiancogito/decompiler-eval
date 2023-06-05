import os
import shutil
from pathlib import Path
import argparse

def rank_dir(d):
    path = Path(d)
    for file in path.rglob("*.c"):
        print(file)


def move_files(from_dir, to_dir):
    from_path = Path(from_dir)
    ori_files = from_path.rglob("*.c")
    count = 0
    for f in ori_files:
        new_path = os.path.join(to_dir, f"{count}.c")
        shutil.copy(f, new_path)
        count += 1

    return


if __name__ == '__main__':
    # rank_dir('/home/eval/trash/POJ/ds1')   
    parser = argparse.ArgumentParser(description='move_files.py')
    parser.add_argument('--src', type=str)
    parser.add_argument('--to', type=str)
    
    args = parser.parse_args()

    move_files(args.src, args.to)
