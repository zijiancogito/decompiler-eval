import sys
import json
from ctypes import *
from json_to_exptree import load_from_json


def process_function(de_file, save_to):
    """
    de_file: decompiling results of function
    save_to: json file
    """

    paths = symbolic_execution(de_file)
    if paths is not None:
        dump_to_file(save_to, paths)
        return None
    else:
        return de_file

def dump_to_file(save_to, paths):
    """
    save_to: json file
    """

    # js_dict = {"symbols": symbols}
    # exp_dict = {}
    # for exp in exps:
    #     exp_dict[exp] = exptree_to_json(exps[exp])

    # js_dict["expressions"] = exp_dict

    with open(save_to, 'w') as f:
        json.dump(paths, f)


def symbolic_execution(de_file):
    dese = cdll.LoadLibrary("./se/libse.so")
    run_se = dese.process
    run_se.argtypes = [POINTER(c_char), c_int]
    run_se.restype = c_char_p
    STR = (c_char * (len(de_file) + 2))(*bytes(de_file,'utf-8'))
    cast(STR, POINTER(c_char))
    paths = run_se(STR, 0)

    if paths is not None:
        paths = load_from_json(json.loads(paths.decode()))

    return paths
