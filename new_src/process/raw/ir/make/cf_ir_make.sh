#!/bin/bash

SRC_ROOT=/home/eval/data/CF/raw/src
IR_ROOT=/home/eval/data/CF/raw/ir

echo "Compile O0 IRs"
cd ../../code_gen/
python3 make.py --opt o0 --ir --src $SRC_ROOT -o $IR_ROOT

