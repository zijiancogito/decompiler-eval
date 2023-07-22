#!/bin/bash

ERR_DIR=/home/eval/data/POJ/recompile/round-1/err-type-file-cnt
LOG_DIR=/home/eval/data/POJ/recompile/round-1


DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 err-type.py -o summarize -e $ERR_DIR -s $LOG_DIR -D $DECOMPILERS 