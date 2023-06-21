#!/bin/bash

DE_DIR=/home/eval/data/POJ/process/de
LOG_DIR=/home/eval/data/POJ/trash/compile/errs
ANALYZE_DIR=/home/eval/data/POJ/analyze/compile/errs

rm -r $LOG_DIR
mkdir -p $LOG_DIR
rm -r $ANALYZE_DIR
mkdir -p $ANALYZE_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 ./check/clang-check.py -d $DE_DIR -l $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
python3 ./analyze/err-analyze.py -e $LOG_DIR -l $ANALYZE_DIR -D $DECOMPILERS