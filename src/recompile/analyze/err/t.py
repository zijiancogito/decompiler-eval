import os
import csv

def read(path):
    dir = os.path.dirname(path)
    opt = dir.split('/')[-1]
    compiler = dir.split('/')[-2]
    decompiler = dir.split('/')[-3]
    with open(path, 'r') as f:
        reader = csv.reader(f)
        rows = [r for r in reader]
    d = {}
    for row in rows:
        cnt = ''
        for element in row:
            cnt += element
        cnts = cnt.split('\t')
        msg = cnts[0]
        keys = [f"{decompiler}-{compiler}-{opt}-{f}" for f in cnts[1:]]
        files = set(keys)
        d[msg] = files
    return d
    

if __name__ == "__main__":
    # read('/home/eval/data/POJ/recompile/round-1/errs_without_tok_total.csv')
    ROOT = '/home/eval/data/POJ/recompile/round-1/err-type-file-list/'
    decoms = ['BinaryNinja', 'Hex-Rays', 'Ghidra', 'RetDec']
    coms = ['clang', 'gcc']
    opts = ['o0', 'o1', 'o2', 'o3', 'os']
    d = {'BinaryNinja': {}, 'Hex-rays': {}, 'Ghidra': {}, 'RetDec': {}}
    for decom in decoms:
        dd = {}
        for com in coms:
            for opt in opts:
                ddd = read(f'/home/eval/data/POJ/recompile/round-1/err-type-file-list/{decom}/{com}/{opt}/msgs-without-tok.csv')
                for k in ddd.keys():
                    if 'TOK (aka TOK) and TOK are' in k:
                        if 'TOK and TOK' not in dd:
                            dd['TOK and TOK'] = ddd[k]
                        else:
                            dd['TOK and TOK'].union(ddd[k])
                    elif 'TOK and TOK (aka TOK) are' in k:
                        if 'TOK and TOK' not in dd:
                            dd['TOK and TOK'] = ddd[k]
                        else:
                            dd['TOK and TOK'].union(ddd[k])
                    elif 'TOK and TOK are ' in k:
                        if 'TOK and TOK' not in dd:
                            dd['TOK and TOK'] = ddd[k]
                        else:
                            dd['TOK and TOK'].union(ddd[k])
                    elif 'TOK statement not' in k:
                        if 'TOK statement not' not in dd:
                            dd['TOK statement not'] = ddd[k]
                        else:
                            dd['TOK statement not'].union(ddd[k])
                    elif 'address of overloaded' in k:
                        if 'address of overloaded' not in dd:
                            dd['address of overloaded'] = ddd[k]
                        else:
                            dd['address of overloaded'].union(ddd[k])
                    elif 'argument type TOK is' in k:
                        if 'argument type TOK is' not in dd:
                            dd['argument type TOK is'] = ddd[k]
                        else:
                            dd['argument type TOK is'].union(ddd[k])
                    elif 'array initializer' in k:
                        if 'array initializer' not in dd:
                            dd['array initializer'] = ddd[k]
                        else:
                            dd['array initializer'].union(ddd[k])
                    elif 'array subscript' in k:
                        if 'array subscript' not in dd:
                            dd['array subscript'] = ddd[k]
                        else:
                            dd['array subscript'].union(ddd[k])
                    elif 'array type TOK (aka TOK)' in k:
                        if 'array type TOK' not in dd:
                            dd['array type TOK'] = ddd[k]
                        else:
                            dd['array type TOK'].union(ddd[k])
                    elif 'array type TOK is' in k:
                        if 'array type TOK' not in dd:
                            dd['array type TOK'] = ddd[k]
                        else:
                            dd['array type TOK'].union(ddd[k])
                    elif 'assigning to TOK' in k:
                        if 'assigning to TOK' not in dd:
                            dd['assigning to TOK'] = ddd[k]
                        else:
                            dd['assigning to TOK'].union(ddd[k])
                    elif 'called object' in k:
                        if 'called object' not in dd:
                            dd['called object'] = ddd[k]
                        else:
                            dd['called object'].union(ddd[k])
                    elif 'cannot assign' in k:
                        if 'cannot assign' not in dd:
                            dd['cannot assign'] = ddd[k]
                        else:
                            dd['cannot assign'].union(ddd[k])
                    elif 'conflicting types' in k:
                        if 'conflicting types' not in dd:
                            dd['conflicting types'] = ddd[k]
                        else:
                            dd['conflicting types'].union(ddd[k])
                    elif 'expected TOK' in k:
                        if 'expected TOK' not in dd:
                            dd['expected TOK'] = ddd[k]
                        else:
                            dd['expected TOK'].union(ddd[k])
                    elif 'expression cannot' in k:
                        if 'expression cannot' not in dd:
                            dd['expression cannot'] = ddd[k]
                        else:
                            dd['expression cannot'].union(ddd[k])
                    elif 'expression is' in k:
                        if 'expression is' not in dd:
                            dd['expression is'] = ddd[k]
                        else:
                            dd['expression is'].union(ddd[k])
                    elif 'parameter of TOK' in k:
                        if 'i-th' not in dd:
                            dd['i-th'] = ddd[k]
                        else:
                            dd['i-th'].union(ddd[k])
                    elif 'function cannot' in k:
                        if 'function cannot' not in dd:
                            dd['function cannot'] = ddd[k]
                        else:
                            dd['function cannot'].union(ddd[k])
                    elif 'incomplete definition' in k:
                        if 'incomplete definition' not in dd:
                            dd['incomplete definition'] = ddd[k]
                        else:
                            dd['incomplete definition'].union(ddd[k])
                    elif 'incomplete type' in k:
                        if 'incomplete type' not in dd:
                            dd['incomplete type'] = ddd[k]
                        else:
                            dd['incomplete type'].union(ddd[k])
                    elif 'indirection requires' in k:
                        if 'indirection requires' not in dd:
                            dd['indirection requires'] = ddd[k]
                        else:
                            dd['indirection requires'].union(ddd[k])
                    elif 'initializing TOK' in k:
                        if 'initializing TOK' not in dd:
                            dd['initializing TOK'] = ddd[k]
                        else:
                            dd['initializing TOK'].union(ddd[k])
                    elif 'integer literal' in k:
                        if 'integer literal' not in dd:
                            dd['integer literal'] = ddd[k]
                        else:
                            dd['integer literal'].union(ddd[k])
                    elif 'invalid argument' in k:
                        if 'invalid argument' not in dd:
                            dd['invalid argument'] = ddd[k]
                        else:
                            dd['invalid argument'].union(ddd[k])
                    elif 'invalid digit' in k:
                        if 'invalid digit' not in dd:
                            dd['invalid digit'] = ddd[k]
                        else:
                            dd['invalid digit'].union(ddd[k])
                    elif 'invalid operands' in k:
                        if 'invalid operands' not in dd:
                            dd['invalid operands'] = ddd[k]
                        else:
                            dd['invalid operands'].union(ddd[k])
                    elif 'invalid suffix' in k:
                        if 'invalid suffix' not in dd:
                            dd['invalid suffix'] = ddd[k]
                        else:
                            dd['invalid suffix'].union(ddd[k])
                    elif 'label at' in k:
                        if 'label at' not in dd:
                            dd['label at'] = ddd[k]
                        else:
                            dd['label at'].union(ddd[k])
                    elif 'member reference' in k:
                        if 'member reference' not in dd:
                            dd['member reference'] = ddd[k]
                        else:
                            dd['member reference'].union(ddd[k])
                    elif 'void' in k:
                        if 'non-void' not in dd:
                            dd['non-void'] = ddd[k]
                        else:
                            dd['non-void'].union(ddd[k])
                    elif 'operand of type TOK cannot' in k:
                        if 'operand of type TOK cannot' not in dd:
                            dd['operand of type TOK cannot'] = ddd[k]
                        else:
                            dd['operand of type TOK cannot'].union(ddd[k])
                    elif 'operand of type TOK where' in k:
                        if 'operand of type TOK where' not in dd:
                            dd['operand of type TOK where'] = ddd[k]
                        else:
                            dd['operand of type TOK where'].union(ddd[k])
                    elif 'passing TOK' in k:
                        if 'passing TOK' not in dd:
                            dd['passing TOK'] = ddd[k]
                        else:
                            dd['passing TOK'].union(ddd[k])
                    elif 'pointer cannot' in k:
                        if 'pointer cannot' not in dd:
                            dd['pointer cannot'] = ddd[k]
                        else:
                            dd['pointer cannot'].union(ddd[k])
                    elif 'read-only ' in k:
                        if 'read-only ' not in dd:
                            dd['read-only '] = ddd[k]
                        else:
                            dd['read-only '].union(ddd[k])
                    elif 'redefinition' in k:
                        if 'redefinition' not in dd:
                            dd['redefinition'] = ddd[k]
                        else:
                            dd['redefinition'].union(ddd[k])
                    elif 'reference to' in k:
                        if 'reference to' not in dd:
                            dd['reference to'] = ddd[k]
                        else:
                            dd['reference to'].union(ddd[k])
                    elif 'returning TOK' in k:
                        if 'returning TOK' not in dd:
                            dd['returning TOK'] = ddd[k]
                        else:
                            dd['returning TOK'].union(ddd[k])
                    elif 'statement requires' in k:
                        if 'statement requires' not in dd:
                            dd['statement requires'] = ddd[k]
                        else:
                            dd['statement requires'].union(ddd[k])
                    elif 'subscript of pointer' in k:
                        if 'subscript of pointer' not in dd:
                            dd['subscript of pointer'] = ddd[k]
                        else:
                            dd['subscript of pointer'].union(ddd[k])
                    elif 'subscripted value' in k:
                        if 'subscripted value' not in dd:
                            dd['subscripted value'] = ddd[k]
                        else:
                            dd['subscripted value'].union(ddd[k])
                    elif 'too few arguments' in k:
                        if 'too many/few' not in dd:
                            dd['too many/few'] = ddd[k]
                        else:
                            dd['too many/few'].union(ddd[k])
                    elif 'too many arguments' in k:
                        if 'too many/few' not in dd:
                            dd['too many/few'] = ddd[k]
                        else:
                            dd['too many/few'].union(ddd[k])
                    elif 'unexpected type' in k:
                        if 'unexpected type' not in dd:
                            dd['unexpected type'] = ddd[k]
                        else:
                            dd['unexpected type'].union(ddd[k])
                    elif 'unknown type name TOK' in k:
                        if 'unknown type name TOK' not in dd:
                            dd['unknown type name TOK'] = ddd[k]
                        else:
                            dd['unknown type name TOK'].union(ddd[k])
                    elif 'use of undeclared identifier' in k:
                        if 'use of undeclared identifier' not in dd:
                            dd['use of undeclared identifier'] = ddd[k]
                        else:
                            dd['use of undeclared identifier'].union(ddd[k])
                    elif 'use of undeclared label ' in k:
                        if 'use of undeclared label ' not in dd:
                            dd['use of undeclared label '] = ddd[k]
                        else:
                            dd['use of undeclared label '].union(ddd[k])
                    elif 'using declaration' in k:
                        if 'using declaration' not in dd:
                            dd['using declaration'] = ddd[k]
                        else:
                            dd['using declaration'].union(ddd[k])
                    elif 'variable has' in k:
                        if 'variable has' not in dd:
                            dd['variable has'] = ddd[k]
                        else:
                            dd['variable has'].union(ddd[k])

        rows = []
        for k in dd.keys():
            row = [k, len(dd[k])]
            rows.append(row)
        with open(os.path.join(ROOT, f'{decom}.csv'), 'w') as f:
            writer = csv.writer(f)
            writer.writerows(rows)