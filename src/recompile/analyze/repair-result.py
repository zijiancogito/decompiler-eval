import os
import argparse

def check_fixed(fixed_dir):
    return len(os.listdir(fixed_dir))

def check_unfixed(unfixed_dir):
    return len(os.listdir(unfixed_dir))

def check_timeout(timeout_dir):
    return len(os.listdir(timeout_dir))

def check_all(fixed_dir, unfixed_dir, timeout_dir, compilers, decompilers, optimizations):
    for compiler in compilers:
        print(f"{'-'*30}{'{0:5}'.format(f'{compiler}')}{'-'*30}")
        print("{0:15}".format("Optimization"), end='\t')
        print("{0:18}".format("|BinaryNinja"), end='\t')
        print("{0:18}".format("|Ghidra"), end='\t')
        print("{0:18}".format("|Hex-Rays"), end='\t')
        print("{0:18}".format("|RetDec"))
        for opt_level in optimizations:
            print("{0:15}".format(opt_level), end='\t')
            for decompiler in decompilers:
                fixed_sub_dir = os.path.join(fixed_dir, compiler, opt_level, decompiler)
                fixed_cnt = check_fixed(fixed_sub_dir)

                unfixed_sub_dir = check_unfixed(unfixed_dir)
                unfixed_cnt = check_unfixed(unfixed_sub_dir)

                timeout_sub_dir = os.path.join(timeout_dir, compiler, opt_level, decompiler)
                timeout_cnt = check_timeout(timeout_sub_dir)
                print("{0:18}".format(f"{fixed_cnt}/{unfixed_cnt}/{timeout_cnt}"), end='\t')
            print()
        print()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='repair-result.py')
    parser.add_argument('-f', '--fixed-dir', type=str, help='')
    parser.add_argument('-u', '--unfixed-dir', type=str, help='')
    parser.add_argument('-t', '--timeout-dir', type=str, help='')
    parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()

    check_all(args.fixed_dir, 
              args.unfixed_dir, 
              args.timeout_dir, 
              args.compilers, 
              args.decompilers, 
              args.optimizations)
