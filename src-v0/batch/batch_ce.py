import sys
sys.path.append('../se/ce')
sys.path.append('../exp_tree')
import concrete_execution

def batch_ce(log):
    vars = {} 
    c_files = []
    ir_files = []
    fails = {}
    with open(log, 'r') as f:
        logs = f.readlines()[:-1]
        for line in logs:
            line = line.strip()
            tp = line.split('\t')[0]
            ir_file = line.split('\t')[1]
            c_file = line.split('\t')[2]
            var = line.split('\t')[3]
            if tp == "NotMatch":
                if ir_file in vars:
                    vars[ir_file].append(var)
                else:
                    vars[ir_file] = [var]
                if c_file not in c_files:
                    c_files.append(c_file)
                if ir_file not in ir_files:
                    ir_files.append(ir_file)

    all_vars = 0
    all_matched = 0
    for ir_file, c_file in zip(ir_files, c_files):
        var_list = vars[ir_file]
        matched, fail = concrete_execution.test(ir_file, c_file, var_list)
        if matched != None:
            all_matched += matched
        fails[ir_file] = fail
        all_vars += len(var_list)

    print(f"Match: {all_matched} / All: {all_vars}")
    return fails

if __name__ == '__main__':
    batch_ce(sys.argv[1])


