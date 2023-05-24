#!/bin/bash

DE_DIR=/home/eval/CF/raw/de
LOG_DIR=/home/eval/CF/trash/de/err

rm -r $LOG_DIR

python3 check_err.py -o check -D cf -d $DE_DIR -l $LOG_DIR