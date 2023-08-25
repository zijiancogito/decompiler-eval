#!/bin/bash

COMPILERS="clang gcc"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

ROOT_DIR=/home/eval/data/DSMITH/se-sample
IR_DIR=$ROOT_DIR/ir
DEC_DIR=$ROOT_DIR/de1

LOG_DIR=/home/eval/data/DSMITH/analyze/concolic-bb
rm -r $LOG_DIR
mkdir -p $LOG_DIR

python3 bb-accuracy.py -i $IR_DIR -d $DEC_DIR -l $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
