#!/bin/bash

ERR_DIR=/home/eval/data/POJ/recompile/round-1/err-msgs-type-files
LOG_DIR=/home/eval/data/POJ/recompile/round-1/err-type-file-cnt

rm -r $LOG_DIR
mkdir -p $LOG_DIR

COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 err-type.py -o count -e $ERR_DIR -s $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS