import sys
sys.append('../exp_tree')
import os
import json
from exp_tree import *
from compare import *

def compare(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json, 'r') as f:
        ir_json = json.load(f)
    if ir_json == None:
        return None

    c_json = None
    with open(c_json, 'r') as f:
        c_json = json.load(f)
    if c_json = None:
        return None
    
    flags = [False]*len(c_json["expressions"])
    matched = []
    for ir_idx, ir_exp in enumerate(ir_json["expressions"]):
        ir_matched = []
        for c_idx, c_exp in enumerate(c_json["expressions"]):
            if flags[c_idx] == True:
                continue
            if compare_path(ir_exp["condition"], 
                            c_exp["condition"], 
                            ir_json["input_symbols"], 
                            c_json["input_symbols"]):

                for ir_v in ir_exp["variables"]:
                    ir_v_pos = ir_json["output_symbols"][ir_v]
                    c_v = None
                    for v in c_json["output_symbols"]:
                        if c_json["output_symbols"][v] == ir_v_pos:
                            c_v = v
                            break
                    if c_v != None and c_v in c_exp["variables"]:
                        ir_matched.append((v, compare_variable(ir_exp["variable"][ir_v], 
                                                               c_exp["variables"][c_v], 
                                                               ir_json["input_symbols"], 
                                                               c_json["input_symbols"])))
                    else:
                        ir_matched.append(
                break


