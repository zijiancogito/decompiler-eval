
ROOT_DIR=/home/eval/data/DSMITH
DE_DIR=$ROOT_DIR/se/de1

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 count_pathes.py -d $DE_DIR -o de -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS -k 15

