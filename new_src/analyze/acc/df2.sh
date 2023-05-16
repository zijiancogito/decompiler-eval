#!/bin/bash

IR_DIR=/home/eval/DF2/se/ir
DE_DIR=/home/eval/DF2/se/de
LOG_DIR=/home/eval/DF2/analyze/acc

rm -r $LOG_DIR
mkdir -p $LOG_DIR

echo "Concolic accuracy"
python3 accuracy.py -e df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Concolic passrate"
python3 passrate.py -e df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Symbolic accuracy"
python3 feature.py -e df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Symbolic distance"
python3 distance.py -e df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

