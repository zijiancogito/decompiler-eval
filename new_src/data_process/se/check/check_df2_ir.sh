#!/bin/bash

IR_DIR=/home/eval/DF2/se/ir/
LOG_DIR=/home/eval/DF2/se/ir/check_log/
MOVE_DIR=/home/eval/DF2/se/trash/ir/

rm -r $LOG_DIR
rm -r $MOVE_DIR
mkdir -p $LOG_DIR
mkdir -p $MOVE_DIR


python3 check.py -c ir -i $IR_DIR -l $LOG_DIR -o $MOVE_DIR
