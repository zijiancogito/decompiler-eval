#!/bin/bash

ROOT_DIR=/home/caoy/deceval/data/POJ/recompile/round-2
FIXED_DIR=$ROOT_DIR/fixed
UNFIXED_DIR=$ROOT_DIR/unfixed
TIMEOUT_DIR=$ROOT_DIR/timeout

COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 repair-result.py -f $FIXED_DIR -u $UNFIXED_DIR -t $TIMEOUT_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS