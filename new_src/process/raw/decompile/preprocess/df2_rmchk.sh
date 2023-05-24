#!/bin/bash

DE_DIR=/home/eval/DF2/process/de
LOG_DIR=/home/eval/DF2/trash/de/chk
rm -r $LOG_DIR


python3 remove_chk.py -i $DE_DIR -l $LOG_DIR -d df2
