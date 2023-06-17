#!/bin/bash

RAW_ERR_DIR=/home/eval/data/DF2/trash/de/errs
NEW_ERR_DIR=/home/eval/data/DF2/analyze/decompile/errs

rm -r $NEW_ERR_DIR
mkdir -p $NEW_ERR_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 err-analyze.py -e $RAW_ERR_DIR -l $NEW_ERR_DIR -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS