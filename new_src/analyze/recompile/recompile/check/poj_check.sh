#!/bin/bash

DE_DIR=/home/eval/data/POJ/process/de
LOG_DIR=/home/eval/data/POJ/analyze/compile/errs

python3 clang-check.py -D poj -d $DE_DIR -l $LOG_DIR