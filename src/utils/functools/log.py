
def log_list2file(log_list, log_file):
    with open(log_file, 'a') as f:
        for l  in log_list:
            f.write(f'{l}\n')