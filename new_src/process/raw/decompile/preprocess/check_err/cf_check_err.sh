#!/bin/bash

DE_DIR=/home/eval/data/CF/raw/de
LOG_DIR=/home/eval/data/CF/trash/de/err

rm -r $LOG_DIR

python3 check_err.py -o check -D cf -d $DE_DIR -l $LOG_DIR
