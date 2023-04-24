#!/bin/bash
ROOT=/home/eval/DF2

echo "Generate source codes"
python3 data_gen.py -o $ROOT -f 1 -n 1000

