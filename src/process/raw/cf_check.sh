#!/bin/bash

DE_DIR=/home/eval/data/CF/raw/de
COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0"

python3 ./decompile/check_decompiling.py -o de -d $DE_DIR -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS