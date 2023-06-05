#!/bin/bash

DE_DIR=/home/eval/data/DF2/raw/de
LOG_DIR=/home/eval/data/DF2/trash/de/err

rm -r $LOG_DIR

python3 check_err.py -o check -D df2 -d $DE_DIR -l $LOG_DIR
