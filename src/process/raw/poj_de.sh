#!/bin/bash
#

DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

echo "--------------------------------------------------------------------\n"
echo "Checking Decompiling ERRORS"
RAW_DE_DIR=/home/eval/data/POJ/raw/de
ERR_LOG_DIR=/home/eval/data/POJ/trash/de/err
rm -r $ERR_LOG_DIR
python3 ./decompile/preprocess/check_err/check_err.py -o check -d $RAW_DE_DIR -l $ERR_LOG_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS
python3 ./decompile/preprocess/check_err/check_err.py -o print -l $ERR_LOG_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

mkdir -p /home/eval/data/POJ/process/
DE_DIR=/home/eval/data/POJ/process/de
cp -r $RAW_DE_DIR $DE_DIR
RAW_IR_DIR=/home/eval/data/POJ/raw/ir
IR_DIR=/home/eval/data/POJ/process/ir
rm -r $IR_DIR
cp -r $RAW_IR_DIR $IR_DIR

POISON_MOVE_DIR=/home/eval/data/POJ/trash/ir/poison
python3 ./ir/check/check_attr.py -i $IR_DIR -d df2
echo "\n"
python3 ./ir/check/check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR -d df2

echo "checking result"
python3 ./ir/check/check.py -i $IR_DIR -o ATTR POISON -d df2

echo "--------------------------------------------------------------------\n"
echo "Remove files not in IR.\n"
python3 ./decompile/preprocess/remove_unused/remove_not_in_ir.py -d $DE_DIR -i $IR_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

# echo "--------------------------------------------------------------------\n"
# echo "Check Number of NULL FUNC"
# NULL_FUNC_LOG_DIR=/home/eval/data/POJ/trash/de/null-func/
# rm -r $NULL_FUNC_LOG_DIR
# mkdir -p $NULL_FUNC_LOG_DIR
# python3 check_null_func.py -d $DE_DIR -l $NULL_FUNC_LOG_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS -t poj

echo "--------------------------------------------------------------------\n"
echo "Change the extension of files from .txt to .c"
python3 ./decompile/preprocess/change_ext/change_ext.py -d $DE_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS