#!/bin/bash
datas_path="/home/eval/POJ/process/O1/binary"
save_to="/home/eval/POJ/process/O1/ida"
for file in `ls $datas_path`
do
    data_path=$datas_path/$file
    python3 run_spider.py $data_path $save_to >/dev/null
    echo Over: $data_path
done
