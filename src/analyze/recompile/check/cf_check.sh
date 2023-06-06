#!/bin/bash

DE_DIR=/home/eval/data/CF/process/de
LOG_DIR=/home/eval/data/CF/analyze/compile/errs

python3 clang-check.py -D cf -d $DE_DIR -l $LOG_DIR
rm *.plist