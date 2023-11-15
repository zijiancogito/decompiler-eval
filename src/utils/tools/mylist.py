
def list_lshift(lst):
    min_idx = lst.index(min(lst))
    for i in range(min_idx):
        a = lst.pop(0)
        lst.append(a)


