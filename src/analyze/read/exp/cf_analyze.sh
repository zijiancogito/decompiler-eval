#!/bin/bash

SRC_DIR=/home/eval/data/CF/raw/src
DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/analyze/read/explen

rm -r $LOG_DIR
mkdir -p $LOG_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 exp_len.py -s $SRC_DIR -d $DE_DIR -l $LOG_DIR -f func_1 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS