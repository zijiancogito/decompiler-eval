#!/bin/bash

IR_DIR=/home/eval/data/POJ/process/ir
DE_DIR=/home/eval/data/POJ/process/de
SRC_DIR=/home/eval/data/POJ/raw/src

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"
FUNC_FILTER=""

# Control Flow
echo "Control structure"
echo "-----------------------------------------------\n"
echo "Cyclomatic complexity"
CYCLE_LOG_DIR=/home/eval/data/POJ/analyze/read/cycle
rm -r $CYCLE_LOG_DIR
mkdir -p $CYCLE_LOG_DIR
python3 ./cycle/cycle.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $CYCLE_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "-----------------------------------------------\n"
echo "Gotos"
GOTO_LOG_DIR=/home/eval/data/POJ/analyze/read/goto
rm -r $GOTO_LOG_DIR
mkdir -p $GOTO_LOG_DIR
python3 ./goto/goto.py -d $DE_DIR -l $GOTO_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

# Code Complexity
echo "-----------------------------------------------\n"
echo "Line of Code"
LOC_LOG_DIR=/home/eval/data/POJ/analyze/read/loc
rm -r $LOC_LOG_DIR
mkdir -p $LOC_LOG_DIR
python3 ./loc/loc.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOC_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "-----------------------------------------------\n"
echo "Variables Count"
VAR_LOG_DIR=/home/eval/data/POJ/analyze/read/var
rm -r $VAR_LOG_DIR
mkdir -p $VAR_LOG_DIR
python3 ./var/var.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $VAR_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "-----------------------------------------------\n"
echo "Expression length"
EXP_LOG_DIR=/home/eval/data/POJ/analyze/read/explen
rm -r $EXP_LOG_DIR
mkdir -p $EXP_LOG_DIR
python3 ./exp/exp_len.py -s $SRC_DIR -d $DE_DIR -l $EXP_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS