#!/bin/bash
IR_ROOT = /home/eval/DF/ir
IR_SE_ROOT = /home/eval/DF/se/ir
python3 ir_delete_attr.py bat $IR_ROOT

python3 $IR_ROOT $IR_SE_ROOT

python3 check.py dfir

python3 batch_df.py 
