import sys
import csv
from process_data import ProcessData

p = ProcessData()
path = sys.argv[1]
save_to = sys.argv[2]
p.process_binary(path, save_to)
'''
try:
    p.process_binary(path, save_to)
    with open('done.csv', 'a') as f:
        row = [path]
        write = csv.writer(f)
        write.writerow(row)
    
except Exception as e:
    with open('err.csv', 'a') as f:
        row = [path]
        write = csv.writer(f)
        write.writerow(row)
'''
