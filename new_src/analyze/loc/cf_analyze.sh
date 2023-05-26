#!/bin/bash

IR_DIR=/home/eval/data/CF/process/ir
DE_DIR=/home/eval/data/CF/process/de
SRC_DIR=/home/eval/data/CF/raw/src
LOG_DIR=/home/eval/data/CF/analyze/loc

python3 loc.py -D cf -i $IR_DIR -d $DE_DIR -s $SRC_DIR -l $LOG_DIR