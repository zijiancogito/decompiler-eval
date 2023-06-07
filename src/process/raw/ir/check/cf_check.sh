#!/bin/bash

RAW_IR_DIR=/home/eval/data/CF/raw/ir
IR_DIR=/home/eval/data/CF/process/ir
POISON_MOVE_DIR=/home/eval/data/CF/trash/ir/poison

rm -r $POISON_MOVE_DIR
mkdir -p $POISON_MOVE_DIR
rm -r $IR_DIR

cp -r $RAW_IR_DIR $IR_DIR

python3 check_attr.py -i $IR_DIR -d cf
echo "\n"

python3 check_poison.py -i $IR_DIR -o $POISON_MOVE_DIR -d cf
echo "\n"

echo "Checking results"

python3 check.py -i $IR_DIR -o ATTR POISON -d cf
