#!/bin/bash
path='/home/data/decompile_data/tmp'
for file in `ls $path`
do
    data_path=$path/$file
    python3 de_se.py $data_path
done

