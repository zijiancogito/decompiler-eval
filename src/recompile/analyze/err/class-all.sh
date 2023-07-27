#!/bin/bash


RAW_DIR=/home/eval/data/POJ/recompile/round-1/raw-compilation-msg
SAVE_DIR=/home/eval/data/POJ/recompile/round-1/err-msgs-type-toks

rm -r $SAVE_DIR
mkdir -p $SAVE_DIR

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 err-type.py -e $RAW_DIR -s $SAVE_DIR -o class -D $DECOMPILERS