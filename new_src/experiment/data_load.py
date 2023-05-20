import csv

def read_from_concolic(path):
    csvs = {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            # print(line)
            csvs[line[0]] = (line[1], line[2])
    return csvs

def read_from_passrate(path):
    csvs= {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            # print(line)
            csvs[line[0]] = line[1]
    return csvs

def read_from_symbolic(path):
    csvs = {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            # print(line)
            csvs[line[0]] = (line[1], line[2])
    return csvs

def read_from_distance(path):
    csvs= {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            # print(line)
            csvs[line[0]] = (line[1], line[2])
    return csvs

def read_from_cycle(path):
    csvs = {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            csvs[line[0]] = (line[1], line[2])
    return csvs

def read_from_var(path):
    csvs = {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            if line[0] in csvs:
                csvs[line[0]] = (line[1], line[2])
    return csvs

def read_from_loc(path):
    csvs = {}
    with open(path, 'r') as f:
        csv_reader = csv.reader(f, delimiter='\t')
        for line in csv_reader:
            if line[0] in csvs:
                csvs[line[0]] = (line[1], line[2])
    return csvs

if __name__ == '__main__':
    read_from_concolic('/home/eval/DF2/analyze/acc/clang/o0/concolic-angr.csv')
    read_from_passrate('/home/eval/DF2/analyze/acc/clang/o0/passrate-angr.csv')
    read_from_symbolic('/home/eval/DF2/analyze/acc/clang/o0/symbolic-angr.csv')
    read_from_distance('/home/eval/DF2/analyze/acc/clang/o0/distance-angr.csv')