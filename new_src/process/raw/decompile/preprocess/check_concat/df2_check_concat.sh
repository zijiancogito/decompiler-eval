#!/bin/bash

DE_DIR=/home/eval/data/DF2/process/de
DE_DIR1=/home/eval/data/DF2/process/de1
DE_DIR2=/home/eval/data/DF2/process/de2


python3 check_concat.py -d df2 -i $DE_DIR -o check
python3 check_concat.py -d df2 -i $DE_DIR1 -o check
python3 check_concat.py -d df2 -i $DE_DIR2 -o check
