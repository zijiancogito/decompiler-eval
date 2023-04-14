#!/bin/bash
decoms=(angr BinaryNinja Ghidra Hex-Rays RetDec)
coms=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decoms[@]}
do
    for com in ${coms[@]}
    do
        for opti in ${optis[@]}
        do
            datas_path=/home/eval/DF2/raw_de/$com/$opti/$dec
            save_to=/home/eval/DF2/de_src/$com/$opti/$dec
            err_file=/home/eval/DF2/de_src/err_log/$com/$opti/$dec/err.csv
            for file in `ls $datas_path`
            do
                data_path=$datas_path/$file
                python3 extractFunc.py -s $data_path -o $save_to -e $err_file -f func0 >/dev/null
                echo Over: $data_path
            done
        done
    done
done
