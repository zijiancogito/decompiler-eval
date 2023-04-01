


root = '/home/eval/DF/se/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Boomerang', 'dewolf', 'Ghidra', 'ida', 'RecStudio', 'Reko', 'Relyze', 'RetDec', 'Snowman']
options = ['o0', 'o1', 'o2', 'o3', 'os']
match_algos = ['fullmatch', 'feature', 'concrete']


def analyze(compiler, decompiler):
    dir = os.path.join(root, compiler, decompiler)
    for opt in options:
        dec_dir = os.path.join(dir, opt)
        ir_dir = os.path.join(root, 'ir', opt)
        for algo in match_algos:
            if algo == 'fullmatch' or algo == 'feature':
                batch_compare(ir_dir, dec_dir, match_algo)
            elif algo == 'concrete':
                ce.batch_compare(ir_dir, dec_dir)

def analyze_all():
    for compiler in compilers:
        for decompiler in decompilers:
            analyze(compiler, decompiler)

if __name__ == '__main__':
    analyze_all()
