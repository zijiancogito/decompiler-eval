#!/bin/bash

DE_DIR=/home/eval/data/DF2/process/de
LOG_DIR=/home/eval/data/DF2/trash/de/null-func/

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 check_null_func.py -D df2 -d $DE_DIR -l $LOG_DIR