import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
import log
import os
import json

def func_match(ir_json_file, c_json_file, log_path):
    # print(c_json_file)
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
    # assert c_json, f"Load C JSON {c_json_file} error."
    if ir_json == None or c_json == None:
        return 1, None, None, None, None
    
    matched_paths = 0
    unmatched_paths = []
    bb_covered = set()
    all_bb_ir = set()
    for path in ir_json["paths"]:
        bbs = parse_path(path)
        all_bb_ir = all_bb_ir.union(bbs)
        if path in c_json["paths"]:
            matched_paths += 1
            bb_covered = bb_covered.union(bbs)
        else:
            unmatched_paths.append(path)
    
    uncover_bb = list(all_bb_ir - bb_covered)
    log.log_list2file(unmatched_paths + uncover_bb, log_path)
    all_bb_c = set()
    for path in c_json["paths"]:
        bbs = parse_path(path)
        all_bb_c = all_bb_c.union(bbs)
    
    if len(c_json["paths"]) == 0 or len(all_bb_c) == 0:
        print(c_json_file)
        return 1, None, None, None, None
    
    assert len(ir_json["paths"]) != 0, ir_json_file

    pcr = matched_paths / len(ir_json["paths"])
    pcp = matched_paths / len(c_json["paths"]) 
    bcr = len(bb_covered) / len(all_bb_ir)
    bcp = len(bb_covered) / len(all_bb_c)
    return 0, pcr, pcp, bcr, bcp

def parse_path(path):
    # print(path)
    # if path.strip() == '':
        # return set()
    tmp = path.split('-')
    bbs = []
    # for i in  tmp:
        # try:
            # bbs.append(int(i))
        # except:
            # continue
    bbs = [int(i) for i in tmp]
    return set(bbs)