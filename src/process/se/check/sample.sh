
ROOT_DIR=/home/eval/data/DSMITH
IR_DIR=$ROOT_DIR/se/ir
DE_DIR=$ROOT_DIR/se/de1

IR_DST=$ROOT_DIR/se-sample/ir
DE_DST=$ROOT_DIR/se-sample/de1

rm -r $IR_DST $DE_DST
mkdir -p $IR_DST $DE_DST

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 sample.py -i $IR_DIR -d $DE_DIR -id $IR_DST -dd $DE_DST -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS -k 15 -n 250
