import os
import argparse

def add_all(root_dir, compilers, optimizations):
    for compiler in compilers:
        for opt in optimizations:
            sub_dir = os.path.join(root_dir, compiler, opt)
            ghidra = os.path.join(sub_dir, "Ghidra", "out.h")
            ida = os.path.join(sub_dir, "Hex-Rays", "defs.h")
            with open(ghidra, 'w') as f:
                f.write("#include <stdio.h>\n#include <stdlib.h>")
            with open(ida, 'w') as f:
                f.write("#include <stdio.h>\n#include <stdlib.h>")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='add_headers.py')
    parser.add_argument('-d', '--dec', type=str, help='execution results of DEC')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')
    
    args = parser.parse_args()

    add_all(args.dec, args.compilers, args.optimizations)