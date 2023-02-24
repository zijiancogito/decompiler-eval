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
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."
    
    flags = [False]*len(c_json["expressions"])
    matched = []
    for ir_idx, ir_exp in enumerate(ir_json["expressions"]):
        ir_matched = []
        for c_idx, c_exp in enumerate(c_json["expressions"]):
            if flags[c_idx] == True:
                continue
            if compare_path(ir_exp["conditions"], c_exp["conditions"]):
                print("path matched")
                flags[c_idx] = True
                for ir_v in ir_exp["variables"]:
                    if ir_v != None and ir_v in c_exp["variables"]:
                        ir_matched.append((ir_v, compare_variable(ir_exp["variables"][ir_v], 
                                                               c_exp["variables"][ir_v])))
                    else:
                        ir_matched.append((ir_v, False))
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
