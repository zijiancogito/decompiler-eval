import sys

import os

def move_df_ir(dir, save_to):
    sub_dirs = os.listdir(dir)
    for sub_dir in sub_dirs:
        files = os.listdir(os.path.join(dir, sub_dir))
        flag = False
        for f in files:
            with open(os.path.join(dir, sub_dir, f), 'r') as of:
                contents = of.read()
                if 'null' in contents:
                    flag = True
        if flag == True:
            cmd = f"mv {os.path.join(dir, sub_dir)} {save_to}"
            os.system(cmd)

if __name__ == "__main__":
    if sys.argv[1] == 'dfir':
        root = '/home/eval/DF/se/ir/'
        for opt in ["o0", "o1", "o2", "o3", "os"]:
            save_to = os.path.join(root, 'fail', opt)
            dir = os.path.join(root, opt)
            move_df_ir(dir, save_to)
