#!/bin/bash

RAW_IR_DIR=/home/eval/data/DF2/raw/ir
IR_DIR=/home/eval/data/DF2/process/ir
IF_MOVE_DIR=/home/eval/data/DF2/trash/ir/ir_if
POISON_MOVE_DIR=/home/eval/data/DF2/trash/ir/poison
rm -r $POISON_MOVE_DIR
rm -r $IF_MOVE_DIR
rm -r $IR_DIR

cp -r $RAW_IR_DIR $IR_DIR

python3 check_attr.py -i $IR_DIR -d df2
echo "\n"
python3 check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR -d df2
echo "\n"
python3 check_if.py -i $IR_DIR -o $IF_MOVE_DIR 

echo "checking result"

python3 check.py -i $IR_DIR -o IF ATTR POISON -d df2
