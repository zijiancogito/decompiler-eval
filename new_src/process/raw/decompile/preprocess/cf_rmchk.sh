#!/bin/bash

DE_DIR=/home/eval/CF/process/de
LOG_DIR=/home/eval/CF/trash/de/chk

rm -r $LOG_DIR

python3 remove_chk.py -i $DE_DIR -l $LOG_DIR -d cf