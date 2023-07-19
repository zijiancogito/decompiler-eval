#!/bin/bash

RAW_DE_DIR=/home/eval/data/POJ/raw/de/

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 ./change_ext.py -d $RAW_DE_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS