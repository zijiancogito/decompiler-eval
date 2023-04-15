#!/bin/bash

ROOT=/home/eval/DF2

echo "Compiling IRs from O0 to Os"
echo "Compile O0 IRs"
python3 make.py --opt o0 --ir --src $ROOT/src -o $ROOT

echo "\nCompile O1 IRs"
python3 make.py --opt o1 --ir --src $ROOT/src -o $ROOT

echo "\nCompile O2 IRs"
python3 make.py --opt o2 --ir --src $ROOT/src -o $ROOT

echo "\nCompile O3 IRs"
python3 make.py --opt o3 --ir --src $ROOT/src -o $ROOT

echo "\nCompile Os IRs"
python3 make.py --opt os --ir --src $ROOT/src -o $ROOT



