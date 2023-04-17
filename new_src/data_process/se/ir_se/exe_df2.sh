#!/bin/bash

IR_DIR=/home/eval/DF2/ir
IR_SE_DIR=/home/eval/DF2/se/ir
LOG_FILE=/home/eval/DF2/se/trash/ir

rm -r $IR_SE_DIR
mkdir -p $IR_SE_DIR

python3 ir_se.py -e df2 -i $IR_DIR -o $IR_SE_DIR -l $LOG_FILE
