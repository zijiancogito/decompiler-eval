#!/bin/bash

IR_DIR=/home/eval/DF2/ir
IF_MOVE_DIR=/home/eval/DF2/trash/ir/ir_if
POISON_MOVE_DIR=/home/eval/DF2/trash/ir/ir_poison
rm -r $POISON_MOVE_DIR
rm -r $IF_MOVE_DIR

python3 check_attr.py -i $IR_DIR
echo "\n"
python3 check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR 
echo "\n"
python3 check_if.py -i $IR_DIR -o $IF_MOVE_DIR 

echo "checking result"

python3 check.py -i $IR_DIR -o IF ATTR POISON
