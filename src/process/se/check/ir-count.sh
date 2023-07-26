
ROOT_DIR=/home/eval/data/DSMITH
IR_DIR=$ROOT_DIR/se/ir

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 count_pathes.py -d $IR_DIR -o ir -O $OPTIMIZATIONS -k 15

