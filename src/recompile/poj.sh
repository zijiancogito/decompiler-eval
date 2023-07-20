#!/bin/bash

SRC_DIR=/home/eval/data/POJ/raw/src
OLD_DE_DIR=/home/eval/data/POJ/raw/de
NEW_DE_DIR=/home/eval/data/POJ/process/de

# rm -r $NEW_DE_DIR
# mkdir -p $NEW_DE_DIR

COMPILERS="clang gcc"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

# python3 ./rebuild-source/build.py -s $SRC_DIR -d $OLD_DE_DIR -o $NEW_DE_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS

LOG_DIR=/home/eval/data/POJ/recompile/raw_msg/
rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 ./clang-check/clang-check.py -d $NEW_DE_DIR -l $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
