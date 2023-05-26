#!/bin/bash

IR_DIR=/home/eval/data/DF2/process/ir
IR_SE_DIR=/home/eval/data/DF2/se/ir
LOG_FILE=/home/eval/data/DF2/se/trash/ir/exe_fail

rm -r $IR_SE_DIR
mkdir -p $IR_SE_DIR

python3 ir_se.py -D df2 -i $IR_DIR -o $IR_SE_DIR -l $LOG_FILE

