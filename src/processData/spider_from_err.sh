#!/bin/bash
err_file="/home/eval/POJ/process/test/test.csv"
save_to="/home/eval/POJ/process/test/c"
IFS=$'\r\n'
for file in `cat $err_file`
do
	python3 run_spider.py $file $save_to >/dev/null
	echo Over: $file
done
