#!/bin/bash
DE_DIR1=/home/eval/data/DF2/process/de
DE_DIR=/home/eval/data/DF2/process/de2
LOG_DIR=/home/eval/data/DF2/trash/de2/concat

rm -r $DE_DIR
cp -r $DE_DIR $DE_DIR1

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check_concat.py -d df2 -i $DE_DIR -l $LOG_DIR -o replace