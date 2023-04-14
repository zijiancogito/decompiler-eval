#!/bin/bash

IR_DIR=/home/eval/DF2/se/ir/
LOG_DIR=/home/eval/DF2/se/ir/check_log/

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check.py -c ir -i $IR_DIR -l $LOG_DIR
