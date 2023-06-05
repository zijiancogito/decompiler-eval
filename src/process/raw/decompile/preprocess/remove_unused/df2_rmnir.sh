#!/bin/bash

DEC_DIR=/home/eval/data/DF2/process/de
IR_DIR=/home/eval/data/DF2/process/ir

python3 remove_not_in_ir.py -d $DEC_DIR -i $IR_DIR -D df2