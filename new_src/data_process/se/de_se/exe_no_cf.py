import sys
sys.append('../../../utils/exp_tree')
from exp_tree import exptree_to_json   # packages you need



def process_function(c_file, save_to):
    """
    c_file: decompiling results of function
    save_to: json file
    """

    # TODO: execution
    """
    code = read_cfile(c_file)
    exps, symbols = symbolic_execution(code)
    """

    #TODO: dump to json file
    dump_to_file(save_to, exps, symbols)

def dump_to_file(save_to, exps, symbols):
    """
    save_to: json file
    exps, symbols: expressions and symbols
    """

    js_dict = {"symbols": symbols}
    exp_dict = {}
    for exp in exps:
        exp_dict[exp] = exptree_to_json(exps[exp])

    js_dict["expressions"] = exp_dict

    # TODO  write js_dict to file save_to


def symbolic_execution(function):
    
    # your code 
    return
