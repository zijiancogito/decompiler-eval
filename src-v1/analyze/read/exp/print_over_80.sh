echo "Expression length"

DE_DIR=/home/eval/data/POJ/process/de

COMPILERS="clang gcc"
DECOMPILERS="Hex-Rays"
OPTIMIZATIONS="o0 o1 o2 o3 os"

python3 exp_len.py -d $DE_DIR -o print -C $COMPILERS -D $DECOMPILERS -O $OPTIMIZATIONS