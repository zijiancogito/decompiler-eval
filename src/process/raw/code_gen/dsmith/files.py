import cfile as C
import utils
import func

import argparse

import random

def make_src_file(filename='out.c'):
    f = C.cfile(filename)
    f.code.append(C.sysinclude('stdio.h'))
    f.code.append(C.blank())
    
    for i in range(max(MAX_LOCALS, MAX_ARGS)):
        f.code.append(func.make_inst(i))
        f.code.append(C.blank())
        
    nfuncs = []
    for i in range(MAX_FUNC):
        funcname = f"func{i}"
        nargs = random.randint(0, MAX_ARGS)
        nfuncs.append((funcname, nargs))
        f.code.append(func.make_function(nargs, funcname))
        f.code.append(C.blank())
        
    f.code.append(func.make_main(nfuncs))
    f.code.append(C.blank())
    
    return str(f)
  
if __name__ == 'main':
    parser = argparse.ArgumentParser(prog='dsmith', description='random code generator')
    parser.add_argument('--max-funcs', default=1, type=int, 
                        help="limit the number of functions (besides main) to <num>")
    parser.add_argument('--max-args', default=3, type=int,
                        help="max count of arguments of function")
    parser.add_argument('--max-block-size', default=5, type=int,
                        help='limit the number of non-return statements in a block to <size> ')
    parser.add_argument('--max-block-depth', default=3, type=int,
                        help='limit depth of nested blocks to <num>')
    parser.add_argument('--max-expr-complexity', default=3, type=int,
                        help='limit expression complexities to <num>')
    parser.add_argument('--max-local-variables', default=3, type=int, 
                        help='limit the number of local variables in a function')
    parser.add_argument('--max-const-variables', default=3, type=int,
                        help='limit the number of constants in a function')
    parser.add_argument('--max-const-values', default=1000, type=int,
                        help='limit the max value of const')
    parser.add_argument('--divs', default=True, 
                        action=argparse.BooleanOptionalAction, 
                        help='enable divs')
    parser.add_argument('--logic', default=True,
                        action=argparse.BooleanOptionalAction,
                        help='enable logic operation')


    make_src_file()
