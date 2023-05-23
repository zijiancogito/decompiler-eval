#!/bin/bash
SRC_ROOT=/home/eval/data/CF/raw/src
BIN_ROOT=/home/eval/data/CF/raw/bin
rm -r $BIN_ROOT
mkdir -p $BIN_ROOT

echo "\n\n Compiling GCC BINs from O0 to Os"
echo "\nCompile gcc O0 Binaries"
python3 make.py --opt o0 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 make.py --opt o0 -c clang --src $SRC_ROOT -o $BIN_ROOT

