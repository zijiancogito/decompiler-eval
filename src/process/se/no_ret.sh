#!/bin/bash

ROOT=/home/eval/data/DSMITH
echo "Execution decompiling results of DF-de1"
DE_DIR_1=$ROOT/process/de1
DE_DIR_2=$ROOT/se-sample/de1

# rm -r $DE_SE_DIR_1
# rm -r $DE_SE_LOG_DIR_1
# mkdir -p $DE_SE_DIR_1
# mkdir -p $DE_SE_LOG_DIR_1
decompilers=(BinaryNinja Hex-Rays Ghidra RetDec)
# decompilers=(BinaryNinja)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]};
do
    for com in ${compilers[@]};
    do
        for opti in ${optis[@]};
        do
            de_dir=$DE_DIR_1/$com/$opti/$dec
            se_dir=$DE_DIR_2/$com/$opti/$dec
            i=0
            l=`ls $de_dir | wc -l`
            echo -e "\nSymbolic executing $dec result of $com $opti"
            for file in `seq 0 999`
            do
                de_file=$de_dir/$file.c
                js_file=$se_dir/$file.json
                if [ ! -e $js_file ]
                then
                    continue
                fi
                # echo $de_file
                python3 ./de_se/execution.py -i $de_file
                let i=i+1
                let num=i*100/l
                str=$(seq -s "#" $num | tr -d "[:digit:]")
                printf "[%-99s] %d%% \r" "$str" "$num"
            done
            echo "" 
        done
    done

done
