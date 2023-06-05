#!/bin/bash

IR_DIR=/home/eval/data/DF2/process/ir
DE_DIR=/home/eval/data/DF2/process/de
SRC_DIR=/home/eval/data/DF2/raw/src
LOG_DIR=/home/eval/data/DF2/analyze/read/var

python3 var.py -D df2 -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOG_DIR
