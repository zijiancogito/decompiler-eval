import sys
import os
import json

def func_match(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        try:
            ir_json = json.load(f)
        except:
            ir_json = None

    c_json = None
    with open(c_json_file, 'r') as f:
        try:
            c_json = json.load(f)
        except:
            c_json = None
    if ir_json == None or c_json == None:
        return None
    
    matched_paths = 0
    unmatched_paths = []
    for path in ir_json["paths"]:
        if path in c_json["paths"]:
            matched += 1
        else:
            