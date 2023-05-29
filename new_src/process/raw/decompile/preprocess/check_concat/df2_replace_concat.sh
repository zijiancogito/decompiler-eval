#!/bin/bash

DE_DIR=/home/eval/data/DF2/process/de
LOG_DIR=/home/eval/data/DF2/trash/de/concat

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check_concat.py -d df2 -i $DE_DIR -l $LOG_DIR -o replace