#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/analyze/read/goto

rm -r $LOG_DIR
mkdir -p $LOG_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 goto.py -d $DE_DIR -l $LOG_DIR -f func_1 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS
