#!/bin/bash
RAW_DE_DIR=/home/eval/data/DF2/process/de
DE_DIR=/home/eval/data/DF2/process/de2
LOG_DIR=/home/eval/data/DF2/trash/de/concat2

rm -r $DE_DIR
cp -r $RAW_DE_DIR $DE_DIR

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check_concat.py -d df2 -i $DE_DIR -l $LOG_DIR -o replace