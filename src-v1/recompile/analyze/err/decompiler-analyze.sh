#!/bin/bash

ERR_DIR=/home/eval/data/POJ/recompile/round-1/raw-compilation-msg
LOG_DIR=/home/eval/data/POJ/recompile/round-1/err-msgs-type

rm -r $LOG_DIR
mkdir -p $LOG_DIR

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 err-type.py -o all -e $ERR_DIR -s $LOG_DIR -D $DECOMPILERS