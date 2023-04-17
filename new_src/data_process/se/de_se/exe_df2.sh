#!/bin/bash

DE_DIR=/home/eval/DF2/de_src
DE_SE_DIR=/home/eval/DF2/se/de
DE_SE_LOG_DIR=/home/eval/DF2/se/trash/de/bug

rm -r $DE_SE_DIR
rm -r $DE_SE_LOG_DIR
mkdir -p $DE_SE_DIR
mkdir -p $DE_SE_LOG_DIR

decompilers=(angr BinaryNinja Ghidra Hex-Rays RetDec)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]}
do
    for com in ${compilers[@]}
    do
        for opti in ${optis[@]}
        do
            de_dir=$DE_DIR/$com/$opti/$dec
            se_dir=$DE_SE_DIR/$com/$opti/$dec
            err_log_file=$DE_SE_LOG_DIR/$com/$opti/$dec.log
            i=0
            l=`ls $de_dir | wc -l`
            echo -e "\nSymbolic executing $dec result of $com $opti"
            for file in `ls $de_dir`
            do
                de_file=$de_dir/$file
                python3 de_se.py -e df2 -i $de_file -o $se_dir -l $err_log_file
                let i=i+1
                let num=i*100/l
                str=$(seq -s "#" $num | tr -d "[:digit:]")
                printf "[%-99s] %d%% \r" "$str" "$num"
            done
            echo "" 
        done
    done
done
