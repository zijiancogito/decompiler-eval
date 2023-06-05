#!/bin/bash

ROOT=/home/eval/data/DF2/raw
rm -r $ROOT
mkdir -p $ROOT

echo "Generate source code."
python3 ./code_gen/source_gen.py -d df2 -o $ROOT f 1 -n 1000

#---------------------------------------------------------------------------

SRC_ROOT=/home/eval/data/DF2/raw/src
BIN_ROOT=/home/eval/data/DF2/raw/bin
rm -r $BIN_ROOT
mkdir -p $BIN_ROOT

echo "\n\n Compiling GCC BINs from O0 to Os"
echo "\nCompile gcc O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c gcc --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile gcc O1 Binaries"
python3 ./code_gen/make.py --opt o1 -c gcc --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile gcc O2 Binaries"
python3 ./code_gen/make.py --opt o2 -c gcc --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile gcc O3 Binaries"
python3 ./code_gen/make.py --opt o3 -c gcc --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile gcc Os Binaries"
python3 ./code_gen/make.py --opt os -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 ./code_gen/make.py --opt o0 -c clang --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile clang O1 Binaries"
python3 ./code_gen/make.py --opt o1 -c clang --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile clang O2 Binaries"
python3 ./code_gen/make.py --opt o2 -c clang --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile clang O3 Binaries"
python3 ./code_gen/make.py --opt o3 -c clang --src $SRC_ROOT -o $BIN_ROOT
echo "\nCompile clang Os Binaries"
python3 ./code_gen/make.py --opt os -c clang --src $SRC_ROOT -o $BIN_ROOT

#---------------------------------------------------------------------------

IR_ROOT=/home/eval/data/DF2/raw/ir

echo "Compiling IRs from O0 to Os"
echo "Compile O0 IRs"
python3 ./code_gen/make.py --opt o0 --ir --src $SRC_ROOT -o $IR_ROOT
echo "\nCompile O1 IRs"
python3 ./code_gen/make.py --opt o1 --ir --src $SRC_ROOT -o $IR_ROOT
echo "\nCompile O2 IRs"
python3 ./code_gen/make.py --opt o2 --ir --src $SRC_ROOT -o $IR_ROOT
echo "\nCompile O3 IRs"
python3 ./code_gen/make.py --opt o3 --ir --src $SRC_ROOT -o $IR_ROOT
echo "\nCompile Os IRs"
python3 ./code_gen/make.py --opt os --ir --src $SRC_ROOT -o $IR_ROOT


#---------------------------------------------------------------------------

IR_DIR=/home/eval/data/DF2/process/ir
IF_MOVE_DIR=/home/eval/data/DF2/trash/ir/ir_if
POISON_MOVE_DIR=/home/eval/data/DF2/trash/ir/poison
rm -r $POISON_MOVE_DIR
rm -r $IF_MOVE_DIR
rm -r $IR_DIR

cp -r $IR_ROOT $IR_DIR

echo "Checking IRs."
python3 ./ir/check/check_attr.py -i $IR_DIR -d df2
echo "\n"
python3 ./ir/check/check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR -d df2
echo "\n"
python3 ./ir/check/check_if.py -i $IR_DIR -o $IF_MOVE_DIR 

echo "checking result"
python3 ./ir/check/check.py -i $IR_DIR -o IF ATTR POISON -d df2
