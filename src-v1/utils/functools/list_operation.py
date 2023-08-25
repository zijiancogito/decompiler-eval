
def list_lshift(list_a):
    min_idx = list_a.index(min(list_a))
    for i in range(min_idx):
        a = list_a.pop(0)
        list_a.append(a)
        