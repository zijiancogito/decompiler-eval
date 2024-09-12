# decompiler-eval
Code for paper "Evaluating the Effectiveness of Decompilers" (will appare in ISSTA 2024).
The code is still under maintenance.

Code for human-study platform is here => https://github.com/zijiancogito/dec_competition
## INSTALL

```
apt-get update
apt-get install python3 python3-pip clang

pip install -r requirements.txt
```

## USAGE

### Dataset

1. Random generate data

```shell
cd src/dataset/rgd
export RGD="/root/data/dsmith"
python3 gen.py -n 2000 -c ./config -s ./dsmith/source.py -o $RGD/raw/src/
python3 make.py --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/ir/ --log $RGD/log/make.log ir
python3 make.py --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/bin/ --log $RGD/log/make.log bin --cc clang
python3 make.py --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/bin/ --log $RGD/log/make.log bin --cc gcc
```

```shell
export JAVA_HOME=/root/decompiler/jdk-17
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
cd decompiler
# Linux
python3 decompile_linux.py --msg="Clang-O0-Ghidra" --bin $RGD/raw/bin/clang/O0 --out $RGD/raw/dec/clang/O0_Ghidra/ --log $RGD/log/dec-clang-o0-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="Clang-O1-Ghidra" --bin $RGD/raw/bin/clang/O1 --out $RGD/raw/dec/clang/O1_Ghidra/ --log $RGD/log/dec-clang-o1-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="Clang-O2-Ghidra" --bin $RGD/raw/bin/clang/O2 --out $RGD/raw/dec/clang/O2_Ghidra/ --log $RGD/log/dec-clang-o2-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="Clang-O3-Ghidra" --bin $RGD/raw/bin/clang/O3 --out $RGD/raw/dec/clang/O3_Ghidra/ --log $RGD/log/dec-clang-o3-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="Clang-Os-Ghidra" --bin $RGD/raw/bin/clang/Os --out $RGD/raw/dec/clang/Os_Ghidra/ --log $RGD/log/dec-clang-os-ghidra.log --decomp="Ghidra"
```

```shell
python3 decompile_linux.py --msg="GCC-O0-Ghidra" --bin $RGD/raw/bin/gcc/O0 --out $RGD/raw/dec/gcc/O0_Ghidra/ --log $RGD/log/dec-gcc-o0-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="GCC-O1-Ghidra" --bin $RGD/raw/bin/gcc/O1 --out $RGD/raw/dec/gcc/O1_Ghidra/ --log $RGD/log/dec-gcc-o1-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="GCC-O2-Ghidra" --bin $RGD/raw/bin/gcc/O2 --out $RGD/raw/dec/gcc/O2_Ghidra/ --log $RGD/log/dec-gcc-o2-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="GCC-O3-Ghidra" --bin $RGD/raw/bin/gcc/O3 --out $RGD/raw/dec/gcc/O3_Ghidra/ --log $RGD/log/dec-gcc-o3-ghidra.log --decomp="Ghidra"
python3 decompile_linux.py --msg="GCC-Os-Ghidra" --bin $RGD/raw/bin/gcc/Os --out $RGD/raw/dec/gcc/Os_Ghidra/ --log $RGD/log/dec-gcc-os-ghidra.log --decomp="Ghidra"
```

```shell
python3 decompile_linux.py --msg="Clang-O0-RetDec" --bin $RGD/raw/bin/clang/O0 --out $RGD/raw/dec/clang/O0_RetDec/ --log $RGD/log/dec-clang-o0-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O1-RetDec" --bin $RGD/raw/bin/clang/O1 --out $RGD/raw/dec/clang/O1_RetDec/ --log $RGD/log/dec-clang-o1-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O2-RetDec" --bin $RGD/raw/bin/clang/O2 --out $RGD/raw/dec/clang/O2_RetDec/ --log $RGD/log/dec-clang-o2-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-O3-RetDec" --bin $RGD/raw/bin/clang/O3 --out $RGD/raw/dec/clang/O3_RetDec/ --log $RGD/log/dec-clang-o3-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="Clang-Os-RetDec" --bin $RGD/raw/bin/clang/Os --out $RGD/raw/dec/clang/Os_RetDec/ --log $RGD/log/dec-clang-os-retdec.log --decomp="RetDec"
```

```shell
python3 decompile_linux.py --msg="GCC-O0-RetDec" --bin $RGD/raw/bin/gcc/O0 --out $RGD/raw/dec/gcc/O0_RetDec/ --log $RGD/log/dec-gcc-o0-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O1-RetDec" --bin $RGD/raw/bin/gcc/O1 --out $RGD/raw/dec/gcc/O1_RetDec/ --log $RGD/log/dec-gcc-o1-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O2-RetDec" --bin $RGD/raw/bin/gcc/O2 --out $RGD/raw/dec/gcc/O2_RetDec/ --log $RGD/log/dec-gcc-o2-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-O3-RetDec" --bin $RGD/raw/bin/gcc/O3 --out $RGD/raw/dec/gcc/O3_RetDec/ --log $RGD/log/dec-gcc-o3-retdec.log --decomp="RetDec"
python3 decompile_linux.py --msg="GCC-Os-RetDec" --bin $RGD/raw/bin/gcc/Os --out $RGD/raw/dec/gcc/Os_RetDec/ --log $RGD/log/dec-gcc-os-retdec.log --decomp="RetDec"
```


2. Real World Dataset

```

```

### Preprocess

#### IR

```
cp -r $RGD/raw/ir $RGD/raw/ir_preprocess
```
