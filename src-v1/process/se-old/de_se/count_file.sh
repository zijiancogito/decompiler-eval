#!/bin/bash

DE_DIR=/home/eval/data/DF2/se/de

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 count_files.py -o de -d $DE_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS