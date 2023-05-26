#!/bin/bash

DEC_DIR=/home/eval/data/DF2/process/de
OUT_DIR=/home/eval/data/DF2/trash/de/de_cond

rm -r $OUT_DIR
mkdir -p $OUT_DIR

python3 check_cond.py -i $DEC_DIR -o $OUT_DIR