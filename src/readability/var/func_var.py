import sys
sys.path.append('./')
import os
from var import get_all_vars, preprocess_code


def func_var(func_code):
    code = preprocess_code(func_code.strip())
    vars = get_all_vars(code)
    var_count = len(set(vars))

    return var_count

