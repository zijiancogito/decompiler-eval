

def feature_vs_concrete(dec_se, ir_se):
    sys.path.append('../exp_tree')
    from compare import tree_sta
    from concrete_execution import concrete_sta
    p1, r1 = tree_sta(ir_se, dec_se, 'feature')
    p2, r2 = concrete_sta(ir_se, dec_se)

    return p1, r1, p2, r2

def analyze(de_dir, ir_dir):
    de_sub_dirs = os.listdir(de_dir)
    p1s, r1s, p2s, r2s = [], [], [], []
    for sub_dir in de_sub_dirs:
        ir_sub_dir = os.path.join(ir_dir, sub_dir)
        if not os.path.exists(ir_sub_dir):
            continue
        de_sub_dir = os.path.join(de_dir, sub_dir)
        funcs = os.listdir(de_sub_dir)
        for func in funcs:
            bname = func.split('.')[0]
            if not re.match('func[0-9]', bname):
                continue
            ir_json = os.path.join(ir_sub_dir, func)
            if not os.path.exists(ir_json):
                continue
            de_json = os.path.join(de_sub_dir, func)
            p1, r1, p2, r2 = feature_vs_concrete(de_json, ir_json)
            p1s.append(p1)
            r1s.append(r1)
            p2s.append(p2)
            r2s.append(r2)

    return p1s, r1s, p2s, r2s

def relation(p1, r1, p2, r2, save_to):
    sys.path.append('../../analyze/tools')
    from my_math import average_x_y, plot_with_hist
    # Average
    x, y = average(p1, p2)
    plot_with_hist(x, y, os.path.join(save_to, 'avg_p_fea_dec.jpg'))

    x, y = average(r1, r2)
    plot_with_hist(x, y, os.path.join(save_to, 'avg_r_fea_dec.jpg'))

    # Sactter
    x, y = p1, p2
    plot_with_hist(x, y, os.path.join(save_to, 'p_fea_dec.jpg'))

    x, y = r1, r2
    plot_with_hist(x, y, os.path.join(save_to, 'r_fea_dec.jpg'))

dec_root = '/home/eval/DF/se'
ir_root = '/home/eval/DF/se/ir'
save_fig = '/home/eval/DF/se/acc/fea_ce/'
compilers = ['clang', 'gcc']
decompilers = ['angr', 'BinaryNinja', 'Ghidra', 'ida', 'RetDec']
options = ['o0', 'o1', 'o2', 'o3', 'os']

def analyze_all():
    save_to = save_fig
    if not os.path.exists(save_to):
        os.makedirs(save_to)

    for compiler in compilers:
        level_1 = os.path.join(save_to, compiler)
        if not os.path.exists(level_1):
            os.mkdir(level_1)
        for decompiler in decompilers:
            level_2 = os.path.join(level_1, decompiler)
            if not os.path.exists(level_2):
                os.mkdir(level_2)
            for opt_level in options:
                level_3 = os.path.join(level_2, opt_level)
                if not os.path.exists(level_3):
                    os.mkdir(level_3)

                de_dir = os.path.join(dec_root, compiler, decompiler, opt_level)
                ir_dir = os.path.join(ir_root, opt_level)
                p1, r1, p2, r2 = analyze(de_dir, ir_dir)
                realtion(p1, r1, p2, r2, level_3)


if __name__ == '__main__':
    analyze_all()
