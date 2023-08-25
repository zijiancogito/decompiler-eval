import os
import re
import csv
import copy

files = os.listdir('./')
for fi in files:
    if os.path.splitext(fi)[1] != '.csv':
        continue
    with open(fi, 'r') as f:
        reader = csv.reader(f)
        rows = [r for r in reader]

    new_rows = copy.deepcopy(rows)
    for r in rows:
        row = r[0]
        # if "-fun" not in row:
        if not re.search('func[0-9]+', row):
            new_rows.remove(r)

    with open(fi, 'w') as f:
        f.seek(0)
        f.truncate()
        writer = csv.writer(f)
        writer.writerows(new_rows)
