#!/bin/bash

ROOT=/home/eval/data/CF/raw

rm -r $ROOT
mkdir -p $ROOT

echo "Generate source code for CF"
python3 ./code_gen/source_gen.py -d cf -o $ROOT -n 1000 -c ./code_gen/csmith/config

SRC_ROOT=/home/eval/data/CF/raw/src
BIN_ROOT=/home/eval/data/CF/raw/bin
rm -r $BIN_ROOT
mkdir -p $BIN_ROOT

echo "\n\n Compiling GCC BINs from O0 to Os"
echo "\nCompile gcc O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c clang --src $SRC_ROOT -o $BIN_ROOT

IR_ROOT=/home/eval/data/CF/raw/ir

echo "Compile O0 IRs"
python3 ./code_gen/make.py --opt o0 --ir --src $SRC_ROOT -o $IR_ROOT

mkdir -p /home/eval/data/CF/process

IR_DIR=/home/eval/data/CF/process/ir
POISON_MOVE_DIR=/home/eval/data/CF/trash/ir/poison

rm -r $POISON_MOVE_DIR
rm -r $IR_DIR
cp -r $IR_ROOT $IR_DIR

python3 ./ir/check/check_attr.py -i $IR_DIR -d cf
echo "\n"
python3 ./ir/check/check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR -d cf
echo "\n"

echo "Checking results"
python3 ./ir/check/check.py -i $IR_DIR -o ATTR POISON -d cf