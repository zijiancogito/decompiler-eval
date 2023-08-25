#!/bin/bash
#
DECOMPILERS="Ghidra BinaryNinja Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

echo "--------------------------------------------------------------------\n"
echo "Checking Decompiling ERRORS"
ROOT=/home/eval/data/DSMITH
RAW_DE_DIR=$ROOT/raw/de
ERR_LOG_DIR=$ROOT/trash/de/err
rm -r $ERR_LOG_DIR
mkdir -p $ERR_LOG_DIR

python3 ./decompile/preprocess/check_err/check_err.py -o check -d $RAW_DE_DIR -l $ERR_LOG_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

# echo "--------------------------------------------------------------------\n"
echo "Print Decompiling ERRORS"
python3 ./decompile/preprocess/check_err/check_err.py -o print -l $ERR_LOG_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

# echo "--------------------------------------------------------------------\n"
echo "Extract func0 from decompiling results\n"
DE_DIR=$ROOT/process/de
EXTRACT_FUNC_ERR=$ROOT/trash/de/extract_func_log
rm -r $EXTRACT_FUNC_ERR
rm -r $DE_DIR
mkdir -p $EXTRACT_FUNC_ERR
mkdir -p $DE_DIR
decoms=(Ghidra BinaryNinja Hex-Rays RetDec)
coms=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decoms[@]};
do
    for com in ${coms[@]};
    do
        for opti in ${optis[@]};
        do
            echo ${dec}-${com}-${opti}
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

echo "Check _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -o check -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

echo "Remove _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -o replace -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

echo "Check _chk() function in decompiling results"
python3 ./decompile/preprocess/remove_chk/remove_chk.py -i $DE_DIR -o check -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS




echo "--------------------------------------------------------------------\n"
echo "Check CONCAT stmt function in decompiling results"
python3 ./decompile/preprocess/check_concat/check_concat.py -i $DE_DIR -o check -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

echo "--------------------------------------------------------------------\n"
echo "Remove CONCAT stmt function in decompiling results"
DE_DIR_1=$ROOT/process/de1
CONCAT_LOG_DIR_1=/home/eval/data/DF2/trash/de/concat1
rm -r $DE_DIR_1
cp -r $DE_DIR $DE_DIR_1
rm -r $CONCAT_LOG_DIR_1
mkdir -p $CONCAT_LOG_DIR_1
python3 ./decompile/preprocess/check_concat/check_concat.py -i $DE_DIR_1 -l $CONCAT_LOG_DIR_1 -o replace -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

#python3 ./decompile/preprocess/check_global/check_global.py -i $DE_DIR -o $DE_DIR_1 -r $RAW_DE_DIR -O $OPTIMIZATIONS -D RetDec -C $COMPILERS
echo "--------------------------------------------------------------------\n"
echo "Remove CONCAT stmt function in decompiling results"
DE_DIR_2=$ROOT/process/de2
CONCAT_LOG_DIR_2=/home/eval/data/DF2/trash/de/concat2
rm -r $DE_DIR_2
cp -r $DE_DIR $DE_DIR_2
rm -r $CONCAT_LOG_DIR_2
mkdir -p $CONCAT_LOG_DIR_2
python3 ./decompile/preprocess/check_concat/check_concat.py -i $DE_DIR_2 -l $CONCAT_LOG_DIR_2 -o replace -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

# python3 ./decompile/preprocess/check_global/check_global.py -i $DE_DIR -o $DE_DIR_2 -r $RAW_DE_DIR -O $OPTIMIZATIONS -D RetDec -C $COMPILERS

echo "--------------------------------------------------------------------\n"
echo "Check CONCAT stmt function in decompiling results"
DE_DIR1=$ROOT/process/de1
DE_DIR2=$ROOT/process/de2
python3 ./decompile/preprocess/check_concat/check_concat.py -i $DE_DIR1 -o check -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS
python3 ./decompile/preprocess/check_concat/check_concat.py -i $DE_DIR2 -o check -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

echo "--------------------------------------------------------------------\n"
echo "Change the extension of files from .txt to .c"
python3 ./decompile/preprocess/change_ext/change_ext.py -d $DE_DIR_1 -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS
python3 ./decompile/preprocess/change_ext/change_ext.py -d $DE_DIR_2 -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS

