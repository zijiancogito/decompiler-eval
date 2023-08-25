#!/bin/bash -v

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

IR_SE_DIR=/home/eval/data/DF2/se/ir
DE_SE_DIR_1=/home/eval/data/DF2/se/de1
DE_SE_DIR_2=/home/eval/data/DF2/se/de2

echo "Count files of IR SE"
python3 ./de_se/count_files.py -d $IR_SE_DIR -o ir -O $OPTIMIZATIONS

echo "Count files of DE SE 1"
python3 ./de_se/count_files.py -d $DE_SE_DIR_1 -o de -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS

echo "Count files of DE SE 2"
python3 ./de_se/count_files.py -d $DE_SE_DIR_2 -o de -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS