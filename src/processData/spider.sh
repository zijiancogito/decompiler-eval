#!/bin/bash
datas_path="/home/eval/DF/bin/clang/o3"
save_to="/home/eval/DF/de/clang"

while :
do
    let num=0
    for file in `ls $datas_path`
    do
        if [ ! -e $save_to/angr/o3/$file.txt ] ||
           [ ! -e $save_to/BinaryNinja/o3/$file.txt ] ||
           [ ! -e $save_to/Boomerang/o3/$file.txt ] ||
           [ ! -e $save_to/dewolf/o3/$file.txt ] ||
           [ ! -e $save_to/Ghidra/o3/$file.txt ] ||
           [ ! -e $save_to/RecStudio/o3/$file.txt ] ||
           [ ! -e $save_to/Reko/o3/$file.txt ] ||
           [ ! -e $save_to/Relyze/o3/$file.txt ] ||
           [ ! -e $save_to/RetDec/o3/$file.txt ] ||
           [ ! -e $save_to/Snowman/o3/$file.txt ] ; then
            data_path=$datas_path/$file
            python3 run_spider.py $data_path $save_to o3 >/dev/null
            echo Over: $data_path
            let num+=1
        fi
    done

    if [ $num -eq 0 ]; then
        break
    fi
done

echo $a
