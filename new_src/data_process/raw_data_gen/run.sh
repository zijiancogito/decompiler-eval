#!/bin/bash
ROOT=/home/eval/DF2

echo "Generate source codes" 
python3 data_gen.py -o $ROOT -f 1 -n 1000

echo ""
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

echo "\n\n Compiling GCC BINs from O0 to Os"
echo "\nCompile gcc O0 Binaries"
python3 make.py --opt o0 -c gcc --src $ROOT/src -o $ROOT

echo "\nCompile gcc O1 Binaries"
python3 make.py --opt o1 -c gcc --src $ROOT/src -o $ROOT

echo "\nCompile gcc O2 Binaries"
python3 make.py --opt o2 -c gcc --src $ROOT/src -o $ROOT

echo "\nCompile gcc O3 Binaries"
python3 make.py --opt o3 -c gcc --src $ROOT/src -o $ROOT

echo "\nCompile gcc Os Binaries"
python3 make.py --opt os -c gcc --src $ROOT/src -o $ROOT

echo "\n\n Compiling CLANG BINs from O0 to Os"
echo "\nCompile clang O0 Binaries"
python3 make.py --opt o0 -c clang --src $ROOT/src -o $ROOT

echo "\nCompile clang O1 Binaries"
python3 make.py --opt o1 -c clang --src $ROOT/src -o $ROOT

echo "\nCompile clang O2 Binaries"
python3 make.py --opt o2 -c clang --src $ROOT/src -o $ROOT

echo "\nCompile clang O3 Binaries"
python3 make.py --opt o3 -c clang --src $ROOT/src -o $ROOT

echo "\nCompile clang Os Binaries"
python3 make.py --opt os -c clang --src $ROOT/src -o $ROOT
