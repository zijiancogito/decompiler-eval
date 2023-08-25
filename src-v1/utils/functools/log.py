
def log_list2file(log_list, log_file):
    with open(log_file, 'w') as f:
        for l  in log_list:
            f.write(f'{l}\n')
            
def log_dict2file(log_dict, log_file):
    with open(log_file, 'w') as f:
        keys = list(log_dict.keys())
        keys.sort()
        for k in keys:
            f.write(k)
            f.write('\t')
            if type(log_dict[k]) == type([]):
                f.write('\t'.join(log_dict[k]))
            else:
                f.write(str(log_dict[k]))
            f.write('\n')
