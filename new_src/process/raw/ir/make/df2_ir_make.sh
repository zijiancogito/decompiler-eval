#!/bin/bash

SRC_ROOT=/home/eval/data/DF2/raw/src
IR_ROOT=/home/eval/data/DF2/raw/ir

echo "Compiling IRs from O0 to Os"
echo "Compile O0 IRs"
cd ../../code_gen/
python3 make.py --opt o0 --ir --src $SRC_ROOT -o $IR_ROOT

echo "\nCompile O1 IRs"
python3 make.py --opt o1 --ir --src $SRC_ROOT -o $IR_ROOT

echo "\nCompile O2 IRs"
python3 make.py --opt o2 --ir --src $SRC_ROOT -o $IR_ROOT

echo "\nCompile O3 IRs"
python3 make.py --opt o3 --ir --src $SRC_ROOT -o $IR_ROOT

echo "\nCompile Os IRs"
python3 make.py --opt os --ir --src $SRC_ROOT -o $IR_ROOT



