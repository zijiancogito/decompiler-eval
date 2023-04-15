import sys

def compare_data(a, b):
    try:
        a = abs(int(a))
        b = abs(int(b))
        if a == b:
            return True
    except:
        if a == b:
            return True
    return False



