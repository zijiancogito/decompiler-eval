#!/bin/bash

RAW_ERR_DIR=/home/eval/data/CF/trash/de/err
NEW_ERR_DIR=/home/eval/data/CF/analyze/decompile/errs

rm -r $NEW_ERR_DIR
mkdir -p $NEW_ERR_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 err-analyze.py -e $RAW_ERR_DIR -l $NEW_ERR_DIR -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS