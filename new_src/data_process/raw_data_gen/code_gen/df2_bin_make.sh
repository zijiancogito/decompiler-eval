#!/bin/bash
SRC_ROOT=/home/eval/DF2/raw/src
BIN_ROOT=/home/eval/DF2/raw/bin

echo "\n\n Compiling GCC BINs from O0 to Os"
echo "\nCompile gcc O0 Binaries"
python3 make.py --opt o0 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile gcc O1 Binaries"
python3 make.py --opt o1 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile gcc O2 Binaries"
python3 make.py --opt o2 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile gcc O3 Binaries"
python3 make.py --opt o3 -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile gcc Os Binaries"
python3 make.py --opt os -c gcc --src $SRC_ROOT -o $BIN_ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 make.py --opt o0 -c clang --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile clang O1 Binaries"
python3 make.py --opt o1 -c clang --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile clang O2 Binaries"
python3 make.py --opt o2 -c clang --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile clang O3 Binaries"
python3 make.py --opt o3 -c clang --src $SRC_ROOT -o $BIN_ROOT

echo "\nCompile clang Os Binaries"
python3 make.py --opt os -c clang --src $SRC_ROOT -o $BIN_ROOT
