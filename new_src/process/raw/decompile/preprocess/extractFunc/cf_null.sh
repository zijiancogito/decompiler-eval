#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/trash/de/null-func/

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check_null_func.py -D cf -d $DE_DIR -l $LOG_DIR
