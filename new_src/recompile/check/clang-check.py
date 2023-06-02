import sys
import os
import subprocess

import json
import re

import argparse

def clang_check(path):
    opt = "--analyze"
    extra_opt = "--extra-arg='-ferror-limit=10000'"
    _chk = subprocess.run(["clang-check", opt, extra_opt, path], shell=True, check=True, capture_output=True)
    print(_chk.stderr)
    

if __name__ == '__main__':
    clang_check('/home/eval/decompiler-eval/new_src/test/0-de.c')