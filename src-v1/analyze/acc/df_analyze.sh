#!/bin/bash

IR_DIR=/home/eval/data/DF2/se/ir
DE_DIR_1=/home/eval/data/DF2/se/de1
LOG_DIR_1=/home/eval/data/DF2/analyze/acc1
DE_DIR_2=/home/eval/data/DF2/se/de2
LOG_DIR_2=/home/eval/data/DF2/analyze/acc2

rm -r $LOG_DIR_1
mkdir -p $LOG_DIR_1
rm -r $LOG_DIR_2
mkdir -p $LOG_DIR_2

echo "DE1: Concolic accuracy"
python3 concolic_accuracy.py -D df2 -i $IR_DIR -d $DE_DIR_1 -l $LOG_DIR_1

echo "DE1: Concolic passrate"
python3 concolic_passrate.py -D df2 -i $IR_DIR -d $DE_DIR_1 -l $LOG_DIR_1

echo "DE1: Symbolic accuracy"
python3 symbolic_match.py -D df2 -i $IR_DIR -d $DE_DIR_1 -l $LOG_DIR_1

echo "DE1: Symbolic distance"
python3 symbolic_distance.py -D df2 -i $IR_DIR -d $DE_DIR_1 -l $LOG_DIR_1

echo "DE2: Concolic accuracy"
python3 concolic_accuracy.py -D df2 -i $IR_DIR -d $DE_DIR_2 -l $LOG_DIR_2

echo "DE2: Concolic passrate"
python3 concolic_passrate.py -D df2 -i $IR_DIR -d $DE_DIR_2 -l $LOG_DIR_2

echo "DE2: Symbolic accuracy"
python3 symbolic_match.py -D df2 -i $IR_DIR -d $DE_DIR_2 -l $LOG_DIR_2

echo "DE2: Symbolic distance"
python3 symbolic_distance.py -D df2 -i $IR_DIR -d $DE_DIR_2 -l $LOG_DIR_2


