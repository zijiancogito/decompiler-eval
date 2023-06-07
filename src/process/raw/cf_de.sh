#!/bin/bash

echo "--------------------------------------------------------------------\n"
echo "Checking Decompiling ERRORS"
RAW_DE_DIR=/home/eval/data/CF/raw/de
ERR_LOG_DIR=/home/eval/data/CF/trash/de/err
rm -r $ERR_LOG_DIR
python3 ./decompile/preprocess/check_err/check_err.py -o check -D cf -d $RAW_DE_DIR -l $ERR_LOG_DIR
python3 ./decompile/preprocess/check_err/check_err.py -o print -D cf -l $ERR_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Extract func_1 from decompiling results\n"
DE_DIR=/home/eval/data/CF/process/de
ERR=/home/eval/data/CF/trash/de/extract_func_log
rm -r $ERR
rm -r $DE_DIR
decoms=(angr BinaryNinja Ghidra Hex-Rays RetDec)
coms=(clang gcc)
optis=(o0)
for dec in ${decoms[@]}
do
    for com in ${coms[@]}
    do
        for opti in ${optis[@]}
        do
            datas_path=$RAW_DE_DIR/$com/$opti/$dec
            save_to=$DE_DIR/$com/$opti/$dec
            err_file=$ERR/$com/$opti/$dec/err.csv
            for file in `ls $datas_path`
            do
                data_path=$datas_path/$file
                python3 ./decompile/preprocess/extractFunc/extractFunc.py -s $data_path -o $save_to -e $err_file -f func_1 >/dev/null
                echo Over: $data_path
            done
        done
    done
done

echo "--------------------------------------------------------------------\n"
echo "Remove files not in IR.\n"
IR_DIR=/home/eval/data/CF/process/ir
python3 ./decompile/preprocess/remove_unused/remove_not_in_ir.py -d $DE_DIR -i $IR_DIR -D cf

echo "--------------------------------------------------------------------\n"
echo "Check Number of NULL FUNC"
NULL_FUNC_LOG_DIR=/home/eval/data/CF/trash/de/null-func/
rm -r $NULL_FUNC_LOG_DIR
mkdir -p $NULL_FUNC_LOG_DIR
python3 ./decompile/preprocess/extractFunc/check_null_func.py -D cf -d $DE_DIR -l $NULL_FUNC_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Change the extension of files from .txt to .c"
python3 ./decompile/preprocess/change_ext/change_ext.py -D cf -d $DE_DIR
