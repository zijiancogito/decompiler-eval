#!/bin/bash
coms=(clang gcc)
optis=(o0 o1 o2 o3 os)
for com in ${coms[@]}
do
    for opti in ${optis[@]}
    do
        datas_path=/home/eval/DF2/bin/$com/$opti
        save_to=/home/eval/DF2/raw_de/$com/$opti
        while :
        do
            let num=0
            for file in `ls $datas_path`
            do
                if [ ! -e $save_to/angr/$file.txt ] ||
                [ ! -e $save_to/BinaryNinja/$file.txt ] ||
                [ ! -e $save_to/Ghidra/$file.txt ] ||
                [ ! -e $save_to/Hex-Rays/$file.txt ] ||
                [ ! -e $save_to/RetDec/$file.txt ] ; then
                    data_path=$datas_path/$file
                    python3 run_spider.py $data_path $save_to >/dev/null
                    echo Over: $data_path
                    let num+=1
                fi
            done

            if [ $num -eq 0 ]; then
                break
            fi
        done
    done
done
