#!/bin/bash

IR_DIR=/home/eval/data/DF2/process/ir
DE_DIR=/home/eval/data/DF2/process/de
SRC_DIR=/home/eval/data/DF2/raw/src

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"
FUNC_FILTER="func0"

# Code Complexity
echo "-----------------------------------------------\n"
echo "Line of Code"
LOC_LOG_DIR=/home/eval/data/DF2/analyze/read/loc
rm -r $LOC_LOG_DIR
mkdir -p $LOC_LOG_DIR
python3 ./loc/loc.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOC_LOG_DIR -f $FUNC_FILTER -D $DECOMPILERS -C $COMPILERS -O OPTIMIZATIONS

echo "-----------------------------------------------\n"
echo "Variables Count"
VAR_LOG_DIR=/home/eval/data/DF2/analyze/read/var
rm -r $VAR_LOG_DIR
mkdir -p $VAR_LOG_DIR
python3 ./var/var.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $VAR_LOG_DIR -f $FUNC_FILTER -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS

echo "-----------------------------------------------\n"
echo "Expression length"
EXP_LOG_DIR=/home/eval/data/DF2/analyze/read/explen
rm -r $EXP_LOG_DIR
mkdir -p $EXP_LOG_DIR
python3 ./exp/exp_len.py -s $SRC_DIR -d $DE_DIR -l $EXP_LOG_DIR -f $FUNC_FILTER -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS