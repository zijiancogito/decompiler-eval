#!/bin/bash

DE_DIR=/home/eval/data/DF2/process/de
LOG_DIR=/home/eval/data/DF2/analyze/compile/errs

rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 clang-check.py -D df2 -d $DE_DIR -l $LOG_DIR