
RAW_DIR=/home/eval/data/DSMITH/raw
DEC_DIR=$RAW_DIR/de
IR_DIR=$RAW_DIR/ir

OPTIMIZATIONS="o0 o1 o2 o3 os"
COMPILERS="clang gcc"
DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 check_ir_select.py -i $IR_DIR -O $OPTIMIZATIONS -o remove

python3 check_ir_select.py -i $IR_DIR -O $OPTIMIZATIONS -o check

# python3 check_c_condexp.py -d $DEC_DIR -O $OPTIMIZATIONS -C $COMPILERS -D $DECOMPILERS