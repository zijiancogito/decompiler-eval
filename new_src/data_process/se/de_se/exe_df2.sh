#!/bin/bash

DE_DIR=/home/eval/DF2/de_src
DE_SE_DIR=/home/eval/DF2/se/de
DE_SE_LOG_DIR=/home/eval/DF2/se/trash/de/bug

rm -r $DE_SE_DIR
rm -r $DE_SE_LOG_DIR
mkdir -p $DE_SE_DIR
mkdir -p $DE_SE_LOG_DIR

python3 de_se.py -e df2 -i $DE_DIR -o $DE_SE_DIR -l $DE_SE_LOG_DIR
