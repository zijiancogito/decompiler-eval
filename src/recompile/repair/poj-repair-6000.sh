#!/bin/bash

COMPILERS="clang gcc"
# DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
DECOMPILERS="BinaryNinja"
OPTIMIZATIONS="o0 o1 o2 o3 os"

DE_DIR=/home/eval/data/POJ/recompile/round-1/fail-compilation
FIXED_DIR=/home/eval/POJ/recompile/round-2/fixed
UNFIXED_DIR=/home/eval/POJ/recompile/round-2/unfixed
TIMEOUT_DIR=/home/eval/POJ/recompile/round-2/timeout


PROFILE=/home/caoy/deceval/recompile/usiijz40.default-release

python3 drrepair.py -d $DE_DIR -f $FIXED_DIR -u $UNFIXED_DIR -t $TIMEOUT_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS -p $PROFILE