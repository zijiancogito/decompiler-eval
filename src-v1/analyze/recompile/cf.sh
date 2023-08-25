#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/trash/compile/errs
ANALYZE_DIR=/home/eval/data/CF/analyze/compile/errs

rm -r $LOG_DIR
mkdir -p $LOG_DIR
rm -r $ANALYZE_DIR
mkdir -p $ANALYZE_DIR

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 ./check/clang-check.py -d $DE_DIR -l $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
python3 ./analyze/err-analyze.py -e $LOG_DIR -l $ANALYZE_DIR -D $DECOMPILERS