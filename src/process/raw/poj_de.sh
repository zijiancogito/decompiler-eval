#!/bin/bash

echo "--------------------------------------------------------------------\n"
echo "Checking Decompiling ERRORS"
RAW_DE_DIR=/home/eval/data/POJ/raw/de
ERR_LOG_DIR=/home/eval/data/POJ/trash/de/err
rm -r $ERR_LOG_DIR
python3 check_err.py -o check -D poj -d $RAW_DE_DIR -l $ERR_LOG_DIR
python3 check_err.py -o print -D poj -l $ERR_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Remove files not in IR.\n"
IR_DIR=/home/eval/data/POJ/process/ir
python3 remove_not_in_ir.py -d $DE_DIR -i $IR_DIR -D cf

echo "--------------------------------------------------------------------\n"
echo "Check Number of NULL FUNC"
NULL_FUNC_LOG_DIR=/home/eval/data/POJ/trash/de/null-func/
rm -r $NULL_FUNC_LOG_DIR
mkdir -p $NULL_FUNC_LOG_DIR
python3 check_null_func.py -D cf -d $DE_DIR -l $NULL_FUNC_LOG_DIR


echo "--------------------------------------------------------------------\n"
echo "Change the extension of files from .txt to .c"
python3 ./decompile/preprocess/change_ext/change_ext.py -D poj -d $DE_DIR