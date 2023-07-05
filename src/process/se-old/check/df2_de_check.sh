#!/bin/bash

DE_DIR=/home/eval/DF2/se/de/
LOG_DIR=/home/eval/DF2/se/de/check_log/
MOVE_DIR=/home/eval/DF2/se/trash/de/check_fail

rm -r $LOG_DIR
rm -r $MOVE_DIR
mkdir -p $LOG_DIR
mkdir -p $MOVE_DIR


python3 check.py -c de -i $DE_DIR -l $LOG_DIR -o $MOVE_DIR
