#!/bin/bash

RAW_DE=/home/eval/CF/raw/de
SAVE_DE=/home/eval/CF/process/de
ERR=/home/eval/CF/trash/de/extract_func_log
rm -r $ERR
rm -r $SAVE_DE
decoms=(angr BinaryNinja Ghidra Hex-Rays RetDec)
coms=(clang gcc)
optis=(o0)
for dec in ${decoms[@]}
do
    for com in ${coms[@]}
    do
        for opti in ${optis[@]}
        do
            datas_path=$RAW_DE/$com/$opti/$dec
            save_to=$SAVE_DE/$com/$opti/$dec
            err_file=$ERR/$com/$opti/$dec/err.csv
            for file in `ls $datas_path`
            do
                data_path=$datas_path/$file
                python3 extractFunc.py -s $data_path -o $save_to -e $err_file -f func_1 >/dev/null
                echo Over: $data_path
            done
        done
    done
done