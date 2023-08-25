
ROOT=/home/eval/data/DSMITH
OLD_DIR=$ROOT/process/de
NEW_DIR_1=$ROOT/process/de1
RAW_DIR=$ROOT/raw/de

DECOMPILERS="RetDec"
COMPILERS="clang gcc"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 check_global.py -i $OLD_DIR -o $NEW_DIR_1 -r $RAW_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS


NEW_DIR_2=$ROOT/process/de2

python3 check_global.py -i $OLD_DIR -o $NEW_DIR_2 -r $RAW_DIR -O $OPTIMIZATIONS -D $DECOMPILERS -C $COMPILERS
