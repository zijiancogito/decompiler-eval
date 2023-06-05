#!/bin/bash

IR_DIR=/home/eval/data/CF/process/ir
DE_DIR=/home/eval/data/CF/process/de
SRC_DIR=/home/eval/data/CF/raw/src

# Control Flow
echo "Control structure"
echo "-----------------------------------------------\n"
echo "Cyclomatic complexity"
CYCLE_LOG_DIR=/home/eval/data/CF/analyze/read/cycle
rm -r $CYCLE_LOG_DIR
mkdir -p $CYCLE_LOG_DIR
python3 ./cycle/cycle.py -D cf -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $CYCLE_LOG_DIR

echo "-----------------------------------------------\n"
echo "Gotos"
GOTO_LOG_DIR=/home/eval/data/CF/analyze/read/goto
rm -r $GOTO_LOG_DIR
mkdir -p $GOTO_LOG_DIR
python3 ./goto/goto.py -D cf -d $DE_DIR -l $LOG_DIR

# Code Complexity
echo "-----------------------------------------------\n"
echo "Line of Code"
LOC_LOG_DIR=/home/eval/data/CF/analyze/read/loc
rm -r $LOC_LOG_DIR
mkdir -p $LOC_LOG_DIR
python3 ./loc/loc.py -D cf -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOC_LOG_DIR

echo "-----------------------------------------------\n"
echo "Variables Count"
VAR_LOG_DIR=/home/eval/data/CF/analyze/read/var
rm -r $VAR_LOG_DIR
mkdir -p $VAR_LOG_DIR
python3 ./var/var.py -D cf -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $VAR_LOG_DIR

echo "-----------------------------------------------\n"
echo "Expression length"
EXP_LOG_DIR=/home/eval/data/CF/analyze/read/explen
rm -r $EXP_LOG_DIR
mkdir -p $EXP_LOG_DIR
python3 exp_len.py -D cf -s $SRC_DIR -d $DE_DIR -l $EXP_LOG_DIR