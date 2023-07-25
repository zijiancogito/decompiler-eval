import cfile as C
import argparse
import random

from function import Function
from statement import Statement

def make_src_file(max_funcs,
                  max_args,
                  min_args,
                  max_block_size,
                  min_block_size,
                  max_block_depth,
                  max_branch,
                  max_expr_complexity,
                  min_expr_complexity,
                  max_local_variables,
                  min_local_variables,
                  max_const_variables,
                  min_const_variables,
                  max_const_values,
                  has_divs,
                  has_logic,
                  filename='out.c'):
    f = C.cfile(filename)
    f.code.append(C.sysinclude('stdlib.h'))
    f.code.append(C.sysinclude('stdio.h'))
    f.code.append(C.blank())
    
    func_generator = Function(max_args, 
                              min_args,
                              max_local_variables,
                              min_local_variables,
                              max_const_variables,
                              min_const_variables,
                              max_expr_complexity,
                              min_expr_complexity,
                              max_block_size,
                              min_block_size,
                              max_block_depth,
                              max_branch,
                              max_funcs)
    stmt_generator = Statement(has_logic, has_divs, max_const_values)
    
    for i in range(max(max_local_variables, max_args)):
        f.code.append(func_generator.input_inst_declare(i))
    f.code.append(C.blank())
        
    nfuncs = []
    for i in range(max_funcs):
        funcname = f"func{i}"
        nargs = random.randint(0, max_args)
        nfuncs.append((funcname, nargs))
        f.code.append(func_generator.make_function(nargs, funcname, stmt_generator))
        f.code.append(C.blank())
        
    f.code.append(func_generator.make_main(nfuncs, stmt_generator))
    f.code.append(C.blank())


    for i in range(max(max_local_variables, max_args)):
        f.code.append(func_generator.input_inst(i)[1])
        f.code.append(C.blank())
    
    return str(f)
  
def output_to_file(filename, code):
    with open(filename, 'w') as f:
        f.write(code)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='dsmith', description='random code generator')
    parser.add_argument('--max-funcs', default=1, type=int, 
                        help="limit the number of functions (besides main) to <num>")

    parser.add_argument('--max-args', default=3, type=int,
                        help="max count of arguments of function")
    parser.add_argument('--min-args', default=2, type=int,
                        help="min count of arguments of function")

    parser.add_argument('--max-block-size', default=5, type=int,
                        help='limit the number of non-return statements in a block to <size> ')
    parser.add_argument('--min-block-size', default=3, type=int,
                        help='limit the number of non-return statements in a block to <size> ')

    parser.add_argument('--max-block-depth', default=3, type=int,
                        help='limit depth of nested blocks to <num>')
    parser.add_argument('--max-branches', default=10, type=int,
                        help='limit numbers of blocks to <num>')

    parser.add_argument('--max-expr-complexity', default=3, type=int,
                        help='limit expression complexities to <num>')
    parser.add_argument('--min-expr-complexity', default=1, type=int,
                        help='limit expression complexities to <num>')

    parser.add_argument('--max-local-variables', default=5, type=int, 
                        help='limit the number of local variables in a function')
    parser.add_argument('--min-local-variables', default=3, type=int, 
                        help='limit the number of local variables in a function')

    parser.add_argument('--max-const-variables', default=5, type=int,
                        help='limit the number of constants in a function')
    parser.add_argument('--min-const-variables', default=3, type=int,
                        help='limit the number of constants in a function')

    parser.add_argument('--max-const-values', default=1000, type=int,
                        help='limit the max value of const')
    parser.add_argument('--divs', default=True,
                        action='store_true', 
                        help='enable/disable divs')
    parser.add_argument('--no-divs', dest='divs', action='store_false')
    parser.add_argument('--logic', default=True,
                        action='store_true',
                        help='enable/disable logic operation')
    parser.add_argument('--no-logic', dest='logic', action='store_false')
    
    parser.add_argument('-o', '--out', type=str, help="specify the output file name.")
    parser.add_argument('-d', '--debug', choices=['True', 'False'], default=False)

    args = parser.parse_args()

    output_file = "out.c"
    if args.out != None:
        output_file = args.out
    func = make_src_file(args.max_funcs,
                         args.max_args,
                         args.min_args,
                         args.max_block_size,
                         args.min_block_size,
                         args.max_block_depth,
                         args.max_branches,
                         args.max_expr_complexity,
                         args.min_expr_complexity,
                         args.max_local_variables,
                         args.min_local_variables,
                         args.max_const_variables,
                         args.min_const_variables,
                         args.max_const_values,
                         args.divs,
                         args.logic,
                         output_file)
    output_to_file(output_file, func)
    if args.debug == 'True':
        print(func)