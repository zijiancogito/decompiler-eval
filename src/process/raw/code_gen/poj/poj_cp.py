import shutil
import csv

with open('/home/eval/trash/POJ/ds1/record.csv', 'r') as f:
    reader = csv.reader(f)
    rows = [r for r in reader]

for i in range(len(rows)):
    src = rows[i][0]
    des = f'/home/eval/data/POJ/raw/src/{i}.c'
    shutil.copy(src, des)
    with open('record.csv', 'a') as f:
        writer = csv.writer(f)
        writer.writerow([i, src[25:]])
