#!/bin/bash

OUTPUT=/home/eval/data/human/
rm -r $OUTPUT
mkdir -p $OUTPUT

DECOMPILERS="BinaryNinja Ghidra Hex-Rays RetDec"

python3 loaddata.py -o $OUTPUT -D $DECOMPILERS