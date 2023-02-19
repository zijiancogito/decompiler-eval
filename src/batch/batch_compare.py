import sys
sys.path.append('../exp_tree')
import os
import json
from exp_tree import *
from compare import *

def compare_file(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    if ir_json == None:
        return None

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    
    flags = [False]*len(c_json["expressions"])
    matched = []
    for ir_idx, ir_exp in enumerate(ir_json["expressions"]):
        ir_matched = []
        for c_idx, c_exp in enumerate(c_json["expressions"]):
            if flags[c_idx] == True:
                continue
            if compare_path(ir_exp["condition"], 
                            c_exp["conditions"], 
                            ir_json["input_symbols"], 
                            c_json["input_symbols"]):
                print("path matched")
                flags[c_idx] = True
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
                        ir_matched.append((v, False))
                break
            else:
                print("path matches failed.")
        matched.append((ir_exp["path"], ir_matched))
    return matched

def batch_compare(ir_json_dir, c_json_dir):
    ir_dirs = os.listdir(ir_json_dir)
    res = 0
    cnt = 0
    for ir_dir in ir_dirs:
        ir_files = os.listdir(os.path.join(ir_json_dir, ir_dir))
        for ir_file in ir_files:
            ir_json_file = os.path.join(ir_json_dir, ir_dir, ir_file)
            c_json_file = os.path.join(c_json_dir, ir_dir, f"{ir_file.split('.')[0]}.json")
            print(ir_json_file)
            print(c_json_file)
        
        matched = compare_file(ir_json_file, c_json_file)
        for _, match in matched:
            for _, m_v in match:
                if m_v == True:
                    res = res + 1
                cnt = cnt + 1

    print(f"{res} / {cnt}")

batch_compare(sys.argv[1], sys.argv[2])
