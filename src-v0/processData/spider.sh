#!/bin/bash
optis=(o0 o1 o2 o3 os)
for opti in ${optis[@]}
do
    datas_path="/home/eval/DF/bin/gcc/"$opti
    save_to="/home/eval/DF/de/gcc"
    while :
    do
        let num=0
        for file in `ls $datas_path`
        do
            if [ ! -e $save_to/angr/$opti/$file.txt ] ||
               [ ! -e $save_to/BinaryNinja/$opti/$file.txt ] ||
               [ ! -e $save_to/Boomerang/$opti/$file.txt ] ||
               [ ! -e $save_to/dewolf/$opti/$file.txt ] ||
               [ ! -e $save_to/Ghidra/$opti/$file.txt ] ||
               [ ! -e $save_to/RecStudio/$opti/$file.txt ] ||
               [ ! -e $save_to/Reko/$opti/$file.txt ] ||
               [ ! -e $save_to/Relyze/$opti/$file.txt ] ||
               [ ! -e $save_to/RetDec/$opti/$file.txt ] ||
               [ ! -e $save_to/Snowman/$opti/$file.txt ] ; then
                data_path=$datas_path/$file
                python3 run_spider.py $data_path $save_to $opti >/dev/null
                echo Over: $data_path
                let num+=1
            fi
        done

        if [ $num -eq 0 ]; then
            break
        fi
    done
done

