#!/bin/bash

IR_DIR=/home/eval/DF2/ir
DE_DIR=/home/eval/DF2/de
SRC_DIR=/home/eval/DF2/src
LOG_DIR=/home/eval/DF2/analyze/loc

python3 loc.py -D df2 -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOG_DIR
