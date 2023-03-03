#!/bin/bash
datas_path="/home/eval/DF/bin/gcc/o1"
save_to="/home/eval/DF/de/gcc/ida/o1"

while :
do
    let num=0
    for file in `ls $datas_path`
    do
        if [ ! -e $save_to/$file.txt ]; then
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
