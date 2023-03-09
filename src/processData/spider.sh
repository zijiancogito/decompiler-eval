#!/bin/bash
datas_path="/home/eval/DF/bin/clang/os"
save_to="/home/eval/DF/de/clang"

while :
do
    let num=0
    for file in `ls $datas_path`
    do
        if [ ! -e $save_to/angr/os/$file.txt ] ||
           [ ! -e $save_to/BinaryNinja/os/$file.txt ] ||
           [ ! -e $save_to/Boomerang/os/$file.txt ] ||
           [ ! -e $save_to/dewolf/os/$file.txt ] ||
           [ ! -e $save_to/Ghidra/os/$file.txt ] ||
           [ ! -e $save_to/RecStudio/os/$file.txt ] ||
           [ ! -e $save_to/Reko/os/$file.txt ] ||
           [ ! -e $save_to/Relyze/os/$file.txt ] ||
           [ ! -e $save_to/RetDec/os/$file.txt ] ||
           [ ! -e $save_to/Snowman/os/$file.txt ] ; then
            data_path=$datas_path/$file
            python3 run_spider.py $data_path $save_to os >/dev/null
            echo Over: $data_path
            let num+=1
        fi
    done

    if [ $num -eq 0 ]; then
        break
    fi
done

echo $a
