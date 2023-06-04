#!/bin/bash

mkdir -p /home/eval/data/POJ/raw
RAW_SRC=/home/eval/trash/POJ/ds1
NEW_SRC=/home/eval/data/POJ/raw/src/

rm -r $NEW_SRC
mkdir -p $NEW_SRC

python3 ./code_gen/poj/move_files.py --src $RAW_SRC --to $NEW_SRC

BIN_ROOT=/home/eval/data/POJ/raw/bin
rm -r $BIN_ROOT
mkdir -p $BIN_ROOT

echo "\nCompile gcc O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c gcc --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile gcc O1 Binaries"
python3 ./code_gen/make.py --opt o1 -c gcc --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile gcc O2 Binaries"
python3 ./code_gen/make.py --opt o2 -c gcc --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile gcc O3 Binaries"
python3 ./code_gen/make.py --opt o3 -c gcc --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile gcc Os Binaries"
python3 ./code_gen/make.py --opt os -c gcc --src $NEW_SRC -o $BIN_ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c clang --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile clang O1 Binaries"
python3 ./code_gen/make.py --opt o1 -c clang --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile clang O2 Binaries"
python3 ./code_gen/make.py --opt o2 -c clang --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile clang O3 Binaries"
python3 ./code_gen/make.py --opt o3 -c clang --src $NEW_SRC -o $BIN_ROOT
echo "\nCompile clang Os Binaries"
python3 ./code_gen/make.py --opt os -c clang --src $NEW_SRC -o $BIN_ROOT

IR_ROOT=/home/eval/data/POJ/raw/ir

rm -r $IR_ROOT
mkdir -p $IR_ROOT

echo "\nCompile O0 IRs"
python3 ./code_gen/make.py --opt o0 --ir --src $NEW_SRC -o $IR_ROOT
echo "\nCompile O1 IRs"
python3 ./code_gen/make.py --opt o1 --ir --src $NEW_SRC -o $IR_ROOT
echo "\nCompile O2 IRs"
python3 ./code_gen/make.py --opt o2 --ir --src $NEW_SRC -o $IR_ROOT
echo "\nCompile O3 IRs"
python3 ./code_gen/make.py --opt o3 --ir --src $NEW_SRC -o $IR_ROOT
echo "\nCompile Os IRs"
python3 ./code_gen/make.py --opt os --ir --src $NEW_SRC -o $IR_ROOT
