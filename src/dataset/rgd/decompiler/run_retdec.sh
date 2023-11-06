#!/bin/bash

python3 decompile_linux.py --msg="Clang-O0-RetDec" --bin $RGD/raw/bin/clang/O0 --out $RGD/raw/dec/clang/O0_RetDec/ --log $RGD/log/dec-clang-o0-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O1-RetDec" --bin $RGD/raw/bin/clang/O1 --out $RGD/raw/dec/clang/O1_RetDec/ --log $RGD/log/dec-clang-o1-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O2-RetDec" --bin $RGD/raw/bin/clang/O2 --out $RGD/raw/dec/clang/O2_RetDec/ --log $RGD/log/dec-clang-o2-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O3-RetDec" --bin $RGD/raw/bin/clang/O3 --out $RGD/raw/dec/clang/O3_RetDec/ --log $RGD/log/dec-clang-o3-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-Os-RetDec" --bin $RGD/raw/bin/clang/Os --out $RGD/raw/dec/clang/Os_RetDec/ --log $RGD/log/dec-clang-os-retdec.log --decomp="RetDec"

python3 decompile_linux.py --msg="GCC-O0-RetDec" --bin $RGD/raw/bin/gcc/O0 --out $RGD/raw/dec/gcc/O0_RetDec/ --log $RGD/log/dec-gcc-o0-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O1-RetDec" --bin $RGD/raw/bin/gcc/O1 --out $RGD/raw/dec/gcc/O1_RetDec/ --log $RGD/log/dec-gcc-o1-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O2-RetDec" --bin $RGD/raw/bin/gcc/O2 --out $RGD/raw/dec/gcc/O2_RetDec/ --log $RGD/log/dec-gcc-o2-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O3-RetDec" --bin $RGD/raw/bin/gcc/O3 --out $RGD/raw/dec/gcc/O3_RetDec/ --log $RGD/log/dec-gcc-o3-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-Os-RetDec" --bin $RGD/raw/bin/gcc/Os --out $RGD/raw/dec/gcc/Os_RetDec/ --log $RGD/log/dec-gcc-os-retdec.log --decomp="RetDec"