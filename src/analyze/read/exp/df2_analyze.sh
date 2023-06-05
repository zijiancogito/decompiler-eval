#!/bin/bash

SRC_DIR=/home/eval/data/DF2/raw/src
DE_DIR=/home/eval/data/DF2/process/de
LOG_DIR=/home/eval/data/DF2/analyze/read/explen

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 exp_len.py -D df2 -s $SRC_DIR -d $DE_DIR -l $LOG_DIR