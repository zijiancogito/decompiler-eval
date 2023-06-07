#!/bin/bash

RAW_ERR_DIR=/home/eval/data/CF/raw/compile/errs
NEW_ERR_DIR=/home/eval/data/CF/analyze/compile/errs

rm -r $NEW_ERR_DIR
mkdir -p $NEW_ERR_DIR

DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
python3 err-analyze.py -e $RAW_ERR_DIR -l $NEW_ERR_DIR -D $DECOMPILERS