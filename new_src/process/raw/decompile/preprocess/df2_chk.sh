#!/bin/bash

DE_DIR=/home/eval/DF2/process/de
LOG_DIR=/home/eval/DF2/trash/de/de_chk
rm -r $LOG_DIR


python3 remove_chk.py -d $DE_DIR -l $LOG_DIR -e df2
