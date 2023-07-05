import os

def file_prefix(path, split):
    bsn = os.path.basename(path)
    prefix = bsn.split(split)[0]
    return prefix

def change_ext(path, new_ext, split):
    bsn = os.path.basename(path)
    new_f = f"{bsn.split(split)[0]}.{new_ext}"
    return new_f