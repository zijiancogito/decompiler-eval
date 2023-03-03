
def add(op1, op2):
    return int(op1) + int(op2)

def sub(op1, op2):
    return int(op1) - int(op2)

def mul(op1, op2):
    return int(op1) * int(op2)

def div(op1, op2):
    if int(op2) == 0:
        return None
    return int(int(op1) / int(op2))

def neg(op1):
    return -int(op)

def and2(op1, op2):
    return int(op1) & int(op2)

def or2(op1, op2):
    return int(op1) | int(op2)

def xor(op1, op2):
    return int(op1) ^ int(op2)
