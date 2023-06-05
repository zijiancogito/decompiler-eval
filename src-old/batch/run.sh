#!/bin/bash
decompilers=(angr BinaryNinja Ghidra ida RetDec)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]}
do
    for com in ${compilers[@]}
    do
        for opti in ${optis[@]}
        do
            f_p=/home/eval/DF/de/$com/$dec/$opti
            s_p=/home/eval/DF/se/$com/$dec/$opti
            for file in `ls $f_p`
            do
                data_path=$f_p/$file
                python3 de_se.py $data_path $s_p
            done
        done
    done
done

