#!/bin/bash

COMPILERS="clang gcc"
# DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
DECOMPILERS="Hex-Rays"
OPTIMIZATIONS="o0 o1 o2 o3 os"

DATA_DIR=/home/caoy/deceval/data/POJ
DE_DIR=$DATA_DIR/recompile/round-1/fail-compilation
FIXED_DIR=$DATA_DIR/recompile/round-2/fixed
UNFIXED_DIR=$DATA_DIR/recompile/round-2/unfixed
TIMEOUT_DIR=$DATA_DIR/recompile/round-2/timeout

mkdir -p $FIXED_DIR $UNFIXED_DIR $TIMEOUT_DIR


python3 drrepair.py -d $DE_DIR -f $FIXED_DIR -u $UNFIXED_DIR -t $TIMEOUT_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
