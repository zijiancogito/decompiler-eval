#!/bin/bash

DE_DIR=/home/eval/DF2/raw/de
LOG_DIR=/home/eval/DF2/trash/de/err

rm -r $LOG_DIR

python3 check_err.py -D df2 -d $DE_DIR -l $LOG_DIR