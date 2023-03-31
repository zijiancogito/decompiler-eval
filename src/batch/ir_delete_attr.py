import sys

import os

def delete_attr(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    with open(ir_path, 'w') as f:
        for l in lines:
            if l.startswith('attributes'):
                pass
            else:
                f.write(l)

def delete_comment(ir_path):
    lines = None
    with open(ir_path, 'r') as f:
        lines = f.readlines()
    with open(ir_path, 'w') as f:
        for l in lines:
            if l.startswith(';'):
                pass
            else:
                f.write(l)


def batch_delete(ir_dir):
    irs = os.listdir(ir_dir)
    for ir in irs:
        delete_attr(os.path.join(ir_dir, ir))



if __name__ == "__main__":
    if sys.argv[1] == 'bat':
        batch_delete(sys.argv[2])
    elif sys.argv[1] == 'com':
        delete_comment(sys.argv[2])
