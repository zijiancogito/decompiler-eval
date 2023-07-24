#!/bin/bash

COMPILERS="clang gcc"
DECOMPILERS="BinarNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

ROOT=/home/eval/data/DSMITH/
IR_DIR=$ROOT/process/ir
IR_SE_DIR=$ROOT/se/ir
IR_SE_LOG_DIR=$ROOT/trash/se/ir/exe_fail

rm -r $IR_SE_DIR $IR_SE_LOG_DIR
mkdir -p $IR_SE_DIR $IR_SE_LOG_DIR

echo "Execute IRs"

python3 ./ir_se/batch.py -i $IR_DIR -o $IR_SE_DIR -l $IR_SE_LOG_DIR -O $OPTIMIZATIONS
