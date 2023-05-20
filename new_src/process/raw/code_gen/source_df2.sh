#!/bin/bash
ROOT=/home/eval/data/DF2/raw

rm -r $ROOT
mkdir -p $ROOT

python3 source_gen.py -d df2 -o $ROOT -f 1 -n 1000

