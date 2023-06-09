#!/bin/bash

#-----------------------------------------------------------------------------
echo "--------------------------------------------------------------------\n"
echo "Checking Decompiling ERRORS"
RAW_DE_DIR=/home/eval/data/DF2/raw/de
ERR_LOG_DIR=/home/eval/data/CF/trash/de/err
rm -r $ERR_LOG_DIR
python3 ./decompile/preprocess/check_err/check_err.py -o check -D cf -d $RAW_DE_DIR -l $ERR_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Print Decompiling ERRORS"
python3 ./decompile/preprocess/check_err/check_err.py -o print -D df2 -l $ERR_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Extract func0 from decompiling results\n"
DE_DIR=/home/eval/data/DF2/process/de
EXTRACT_FUNC_ERR=/home/eval/data/DF2/trash/de/extract_func_log
rm -r $EXTRACT_FUNC_ERR
rm -r $DE_DIR
mkdir -p $EXTRACT_FUNC_ERR
mkdir -p $DE_DIR
decoms=(angr BinaryNinja Ghidra Hex-Rays RetDec)
coms=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decoms[@]}
do
    for com in ${coms[@]}
    do
        for opti in ${optis[@]}
        do
            datas_path=$RAW_DE_DIR/$com/$opti/$dec
            save_to=$DE_DIR/$com/$opti/$dec
            err_file=$EXTRACT_FUNC_ERR/$com/$opti/$dec/err.csv
            for file in `ls $datas_path`
            do
                data_path=$datas_path/$file
                python3 ./decompile/preprocess/extractFunc/extractFunc.py -s $data_path -o $save_to -e $err_file -f func0 >/dev/null
                # echo Over: $data_path
            done
        done
    done
done

echo "--------------------------------------------------------------------\n"
echo "Remove files not in IR.\n"
IR_DIR=/home/eval/data/DF2/process/ir
python3 ./decompile/preprocess/remove_unused/remove_not_in_ir.py -d $DE_DIR -i $IR_DIR -D df2

echo "--------------------------------------------------------------------\n"
echo "Check Number of NULL FUNC"
NULL_FUNC_LOG_DIR=/home/eval/data/DF2/trash/de/null-func/
rm -r $NULL_FUNC_LOG_DIR
mkdir -p $NULL_FUNC_LOG_DIR
python3 ./decompile/preprocess/extractFunc/check_null_func.py -D df2 -d $DE_DIR -l $NULL_FUNC_LOG_DIR

echo "--------------------------------------------------------------------\n"
echo "Check _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -d df2 -o check

echo "--------------------------------------------------------------------\n"
echo "Remove _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -d df2 -o replace

echo "--------------------------------------------------------------------\n"
echo "Check _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -d df2 -o check

echo "--------------------------------------------------------------------\n"
echo "Check IF stmt function in decompiling results"
python3 ./decompile/preprocess/check_if/check_if.py -i $DE_DIR -o check

echo "--------------------------------------------------------------------\n"
echo "Remove IF stmt function in decompiling results"
IF_MOVE_DIR=/home/eval/data/DF2/trash/de/de_if
rm -r $IF_MOVE_DIR
mkdir -p $IF_MOVE_DIR
python3 ./decompile/preprocess/check_if/check_if.py -i $DE_DIR -o replace -l $IF_MOVE_DIR

echo "--------------------------------------------------------------------\n"
echo "Check IF stmt function in decompiling results"
python3 ./decompile/preprocess/check_if/check_if.py -i $DE_DIR -o check

echo "--------------------------------------------------------------------\n"
echo "Check COND stmt function in decompiling results"
python3 ./decompile/preprocess/check_if/check_cond.py -o check -i $DE_DIR

echo "--------------------------------------------------------------------\n"
echo "Remove COND stmt function in decompiling results"
COND_MOVE_DIR=/home/eval/data/DF2/trash/de/de_cond
rm -r $COND_MOVE_DIR
mkdir -p $COND_MOVE_DIR
python3 ./decompile/preprocess/check_if/check_cond.py -o replace -i $DE_DIR -l $COND_MOVE_DIR

echo "--------------------------------------------------------------------\n"
echo "Check COND stmt function in decompiling results"
python3 ./decompile/preprocess/check_if/check_cond.py -o check -i $DE_DIR


echo "--------------------------------------------------------------------\n"
echo "Check CONCAT stmt function in decompiling results"
python3 ./decompile/preprocess/check_concat/check_concat.py -d df2 -i $DE_DIR -o check

echo "--------------------------------------------------------------------\n"
echo "Remove CONCAT stmt function in decompiling results"
DE_DIR_1=/home/eval/data/DF2/process/de1
CONCAT_LOG_DIR_1=/home/eval/data/DF2/trash/de/concat1
rm -r $DE_DIR_1
cp -r $DE_DIR $DE_DIR_1
rm -r $CONCAT_LOG_DIR_1
mkdir -p $CONCAT_LOG_DIR_1
python3 ./decompile/preprocess/check_concat/check_concat.py -d df2 -i $DE_DIR_1 -l $CONCAT_LOG_DIR_1 -o replace

echo "--------------------------------------------------------------------\n"
echo "Remove CONCAT stmt function in decompiling results"
DE_DIR_2=/home/eval/data/DF2/process/de2
CONCAT_LOG_DIR_2=/home/eval/data/DF2/trash/de/concat2
rm -r $DE_DIR_2
cp -r $DE_DIR $DE_DIR_2
rm -r $CONCAT_LOG_DIR_2
mkdir -p $CONCAT_LOG_DIR_2
python3 ./decompile/preprocess/check_concat/check_concat.py -d df2 -i $DE_DIR_2 -l $CONCAT_LOG_DIR_2 -o replace

echo "--------------------------------------------------------------------\n"
echo "Check CONCAT stmt function in decompiling results"
DE_DIR1=/home/eval/data/DF2/process/de1
DE_DIR2=/home/eval/data/DF2/process/de2
python3 ./decompile/preprocess/check_concat/check_concat.py -d df2 -i $DE_DIR1 -o check
python3 ./decompile/preprocess/check_concat/check_concat.py -d df2 -i $DE_DIR2 -o check

echo "--------------------------------------------------------------------\n"
echo "Change the extension of files from .txt to .c"
python3 ./decompile/preprocess/change_ext/change_ext.py -D df2 -d $DE_DIR_1
python3 ./decompile/preprocess/change_ext/change_ext.py -D df2 -d $DE_DIR_2

