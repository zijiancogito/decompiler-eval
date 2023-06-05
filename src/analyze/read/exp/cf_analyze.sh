#!/bin/bash

SRC_DIR=/home/eval/data/CF/raw/src
DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/analyze/read/explen

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 exp_len.py -D cf -s $SRC_DIR -d $DE_DIR -l $LOG_DIR