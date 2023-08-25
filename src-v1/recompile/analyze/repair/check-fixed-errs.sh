#!/bin/bash

ROOT_DIR=/home/caoy/deceval/data/POJ/recompile
FIXED_DIR=$ROOT_DIR/round-2/fixed
ERR_MSG_DIR=$ROOT_DIR/round-1/err-msgs-type-files
LOG_DIR=$ROOT_DIR/round-2/fixed-errs

rm -r $LOG_DIR
mkdir -p $LOG_DIR

COMPILERS="gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 fixed-errs.py -f $FIXED_DIR -m $ERR_MSG_DIR -l $LOG_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS