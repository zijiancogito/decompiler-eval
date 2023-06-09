#!/bin/bash

IR_DIR=/home/eval/data/CF/process/ir
DE_DIR=/home/eval/data/CF/process/de
SRC_DIR=/home/eval/data/CF/raw/src
LOG_DIR=/home/eval/data/CF/analyze/read/loc

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 loc.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOG_DIR -f func_1 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS