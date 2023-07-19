#!/bin/bash

COMPILERS="clang gcc"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

DE_DIR=/home/eval/data/POJ/process/de
ROUND_1=/home/eval/data/POJ/recompile/round-1
FAIL_DIR=$ROUND_1/fail-compilation/
LOG_DIR=$ROUND_1/raw_compilation-msg/

rm -r $FAIL_DIR $LOG_DIR
mkdir -p $FAIL_DIR $LOG_DIR

python3 clang-check.py -d $DE_DIR -l $LOG_DIR -f $FAIL_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
