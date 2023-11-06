#!/bin/bash

export JAVA_HOME=/root/decompiler/jdk-17
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

python3 decompile_linux.py --msg="Clang-O0-Ghidra" --bin $RGD/raw/bin/clang/O0 --out $RGD/raw/dec/clang/O0_Ghidra/ --log $RGD/log/dec-clang-o0-ghidra.log --decomp="Ghidra" &
sleep 10
python3 decompile_linux.py --msg="Clang-O1-Ghidra" --bin $RGD/raw/bin/clang/O1 --out $RGD/raw/dec/clang/O1_Ghidra/ --log $RGD/log/dec-clang-o1-ghidra.log --decomp="Ghidra" &
sleep 10
python3 decompile_linux.py --msg="Clang-O2-Ghidra" --bin $RGD/raw/bin/clang/O2 --out $RGD/raw/dec/clang/O2_Ghidra/ --log $RGD/log/dec-clang-o2-ghidra.log --decomp="Ghidra" &
sleep 10
python3 decompile_linux.py --msg="Clang-O3-Ghidra" --bin $RGD/raw/bin/clang/O3 --out $RGD/raw/dec/clang/O3_Ghidra/ --log $RGD/log/dec-clang-o3-ghidra.log --decomp="Ghidra" &
sleep 10
python3 decompile_linux.py --msg="Clang-Os-Ghidra" --bin $RGD/raw/bin/clang/Os --out $RGD/raw/dec/clang/Os_Ghidra/ --log $RGD/log/dec-clang-os-ghidra.log --decomp="Ghidra" &
sleep 10