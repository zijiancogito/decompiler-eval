#!/bin/bash

IR_DIR=/home/eval/data/CF/process/ir
DE_DIR=/home/eval/data/CF/process/de
SRC_DIR=/home/eval/data/CF/raw/src

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"
FUNC_FILTER="func_1"

# Control Flow
echo "Control structure"
echo "Control structure - Cyclomatic complexity"
echo "-----------------------------------------------\n"
CYCLE_LOG_DIR=/home/eval/data/CF/analyze/read/cycle
rm -r $CYCLE_LOG_DIR
mkdir -p $CYCLE_LOG_DIR
python3 ./cycle/cycle.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $CYCLE_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "Control structure - Gotos"
echo "-----------------------------------------------\n"
GOTO_LOG_DIR=/home/eval/data/CF/analyze/read/goto
rm -r $GOTO_LOG_DIR
mkdir -p $GOTO_LOG_DIR
python3 ./goto/goto.py -d $DE_DIR -l $GOTO_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

# Code Complexity
echo "Code Complexity"
echo "Code Complexity - Line of Code"
echo "-----------------------------------------------\n"
LOC_LOG_DIR=/home/eval/data/CF/analyze/read/loc
rm -r $LOC_LOG_DIR
mkdir -p $LOC_LOG_DIR
python3 ./loc/loc.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOC_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "Code Complexity - Variables Count"
echo "-----------------------------------------------\n"
VAR_LOG_DIR=/home/eval/data/CF/analyze/read/var
rm -r $VAR_LOG_DIR
mkdir -p $VAR_LOG_DIR
python3 ./var/var.py -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $VAR_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS

echo "Code Complexity - Expression length"
echo "-----------------------------------------------\n"
EXP_LOG_DIR=/home/eval/data/CF/analyze/read/explen
rm -r $EXP_LOG_DIR
mkdir -p $EXP_LOG_DIR
python3 ./exp/exp_len.py -s $SRC_DIR -d $DE_DIR -l $EXP_LOG_DIR -f $FUNC_FILTER -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS