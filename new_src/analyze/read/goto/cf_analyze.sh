#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/analyze/read/goto

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 goto.py -D cf -d $DE_DIR -l $LOG_DIR