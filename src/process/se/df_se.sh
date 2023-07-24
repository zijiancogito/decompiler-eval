#!/bin/bash

echo "Execution decompiling results of DF-de1"
DE_DIR_1=path/to/decompile_result
DE_SE_DIR_1=path/to/symbolic_execution_result
DE_SE_LOG_DIR_1=path/to/log
rm -r $DE_SE_DIR_1
rm -r $DE_SE_LOG_DIR_1
mkdir -p $DE_SE_DIR_1
mkdir -p $DE_SE_LOG_DIR_1
decompilers=(BinaryNinja Ghidra Hex-Rays RetDec)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]}
do
    for com in ${compilers[@]}
    do
        for opti in ${optis[@]}
        do
            de_dir=$DE_DIR_1/$com/$opti/$dec
            se_dir=$DE_SE_DIR_1/$com/$opti/$dec
            err_log_file=$DE_SE_LOG_DIR_1/$com/$opti/$dec.log
            i=0
            l=`ls $de_dir | wc -l`
            echo -e "\nSymbolic executing $dec result of $com $opti"
            for file in `ls $de_dir`
            do
                de_file=$de_dir/$file
                python3 ./de_se/de_se.py -i $de_file -o $se_dir -l $err_log_file
                let i=i+1
                let num=i*100/l
                str=$(seq -s "#" $num | tr -d "[:digit:]")
                printf "[%-99s] %d%% \r" "$str" "$num"
            done
            echo "" 
        done
    done
done
