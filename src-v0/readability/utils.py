import sys
import os
import re

def get_functions_acc_for_a_bin(funcs, dec_se_dir, ir_se_dir):
    accs = {}

    for func in funcs:
        if not re.match('func[0-9]', func):
            continue
        
        dec_json = os.path.join(dec_se_dir, f"{func}.json")
        ir_json = os.path.join(ir_se_dir, f"{func}.json")
        if not os.path.exists(dec_json):
            continue
        if not os.path.exists(ir_json):
            continue

        sys.path.append('../../exp_tree')
        from compare import feature_acc
        dec_acc = feature_acc(ir_json, dec_json)
        accs[func] = dec_acc

    return accs

        
