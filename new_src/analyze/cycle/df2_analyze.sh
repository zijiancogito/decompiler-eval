#!/bin/bash

IR_DIR=/home/eval/CF/ir
DE_DIR=/home/eval/CF/de
SRC_DIR=/home/eval/CF/src
LOG_DIR=/home/eval/CF/analyze/cycle

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 cycle.py -D df2 -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOG_DIR
