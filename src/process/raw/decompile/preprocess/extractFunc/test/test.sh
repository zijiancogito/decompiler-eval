#!/bin/bash
P=/home/eval/data/POJ/raw/src
for f in ` ls $P `
do
    data_path=$P/$f
    python3 ../extractFunc.py -s $data_path -o ./out -e ./log.log >/dev/null
    echo Over: $data_path
done
