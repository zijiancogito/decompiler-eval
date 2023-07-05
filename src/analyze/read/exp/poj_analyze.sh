#!/bin/bash

IR_DIR=/home/eval/data/POJ/process/ir
DE_DIR=/home/eval/data/POJ/process/de
SRC_DIR=/home/eval/data/POJ/raw/src

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"
FUNC_FILTER=""



echo "-----------------------------------------------\n"
echo "Expression length"
EXP_LOG_DIR=/home/eval/data/POJ/analyze/read/explen
rm -r $EXP_LOG_DIR
mkdir -p $EXP_LOG_DIR
python3 exp_len.py -s $SRC_DIR -o analyze -d $DE_DIR -l $EXP_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS