#!/bin/bash

ROOT=/home/eval/data/DSMITH
IR=$ROOT/process/ir
DEC=$ROOT/de

SAMPLE_ROOT=/home/eval/data/DSMITH/sample
SAM_IR=$SAMPLE_ROOT/ir
SAM_DEC=$SAMPLE_ROOT/dec

rm -r $SAM_IR $SAM_DEC
mkdir -p $SAM_IR $SAM_DEC

OPTIMIZATIONS="o0 o1 o2 o3 os"
COMPILERS="clang gcc"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 sample.py -i $IR_DIR -d $DEC_DIR -id $SAM_IR -dd $SAM_DEC -O $OPTIMIZATIONS -C $COMPILERS -D $DECOMPILERS