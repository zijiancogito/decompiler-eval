#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/raw/compile/errs

rm -r $LOG_DIR
mkdir -p $LOG_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 clang-check.py -d $DE_DIR -l $LOG_DIR -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS
rm *.plist