#!/bin/bash

IR_DIR=/home/eval/data/DF2/se/ir
DE_DIR=/home/eval/data/DF2/se/de
IR_OUT=/home/eval/data/DF2/se/ir-symbols.log
DE_OUT=/home/eval/data/DF2/se/de-symbols.log


python3 count_symbols.py -D de -d $DE_DIR -o $DE_OUT

python3 count_symbols.py -D ir -d $IR_DIR -o $IR_OUT