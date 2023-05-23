#!/bin/bash
ROOT=/home/eval/data/CF/raw

rm -r $ROOT
mkdir -p $ROOT

python3 source_gen.py -d cf -o $ROOT -n 1000 -c csmith/config

