#!/bin/bash

IR_DIR=/home/eval/data/DF2/se/ir
DE_DIR=/home/eval/data/DF2/se/de
LOG_DIR=/home/eval/data/DF2/analyze/acc

rm -r $LOG_DIR
mkdir -p $LOG_DIR

echo "Concolic accuracy"
python3 concolic_accuracy.py -D df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Concolic passrate"
python3 concolic_passrate.py -D df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Symbolic accuracy"
python3 symbolic_match.py -D df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR

echo "Symbolic distance"
python3 symbolic_distance.py -D df2 -i $IR_DIR -d $DE_DIR -l $LOG_DIR
