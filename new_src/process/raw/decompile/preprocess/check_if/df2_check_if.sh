#!/bin/bash

DEC_DIR=/home/eval/data/DF2/process/de
MOVE_DIR=/home/eval/data/DF2/trash/de/de_if

rm -r $MOVE_DIR
mkdir -p $MOVE_DIR

python3 check_if.py -i $DEC_DIR -o $MOVE_DIR

# TODO check others
