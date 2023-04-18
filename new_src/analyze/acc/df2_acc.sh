#!/bin/bash

IR_DIR=/home/eval/DF2/se/ir
DE_DIR=/home/eval/DF2/se/de
LOG_DIR=/home/eval/DF2/analyze/acc

python3 accuracy.py -e df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR
