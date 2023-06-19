#!/bin/bash

ACC_DIR_1=/home/eval/data/DF2/analyze/acc1
ACC_DIR_2=/home/eval/data/DF2/analyze/acc2
DEC_LOG_1=/home/eval/data/DF2/experment/ex1-acc-1/dec
DEC_LOG_2=/home/eval/data/DF2/experment/ex1-acc-2/dec
OPT_LOG_1=/home/eval/data/DF2/experment/ex1-acc-1/opt
OPT_LOG_2=/home/eval/data/DF2/experment/ex1-acc-2/opt

rm -r $DEC_LOG_1 $DEC_LOG_2 $OPT_LOG_1 $OPT_LOG_2
mkdir -p $DEC_LOG_1 $DEC_LOG_2 $OPT_LOG_1 $OPT_LOG_2

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"
COLORS="black blue green orange purple"

python3 analyze.py -e decompilers -l $ACC_DIR_1 -s $DEC_LOG_1 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS -P $COLORS
# python3 analyze.py -e decompilers -l $ACC_DIR_2 -s $DEC_LOG_2 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS -P $COLORS
# python3 analyze.py -e decompilers -l $ACC_DIR_1 -s $OPT_LOG_1 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS -P $COLORS
# python3 analyze.py -e decompilers -l $ACC_DIR_2 -s $OPT_LOG_2 -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS -P $COLORS


