import re

def execution_fneg(instruction, tmp_dict):
    pattern = "([\S]+) = fneg .* ([\S]+)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp = match.group(2)
    source = tmp
    if tmp in tmp_dict:
        source = f"({tmp_dict[tmp]})"
    exp = f"-{source}"
    return result, exp

def execution_add(instruction, tmp_dict):
    pattern = '([\S]+) = add .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(3)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} + {tmp2}"
    return result, exp

def execution_fadd(instruction, tmp_dict):
    pattern = '([\S]+) = fadd .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = float(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = float(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} + {tmp2}"
    return result, exp
    
def execution_sub(instruction, tmp_dict):
    pattern = '([\S]+) = sub .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp1 == 0:
        exp = f"-{tmp2}"
    elif tmp2 == 0:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} - {tmp2}"
    return result, exp

def execution_fsub(instruction, tmp_dict):
    pattern = '([\S]+) = fsub .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = float(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = float(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp1 == 0.0:
        exp = f"-{tmp2}"
    elif tmp2 == 0.0:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} - {tmp2}"
    return result, exp

def execution_mul(instruction, tmp_dict):
    pattern = '([\S]+) = mul .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp1 == 1:
        exp = f"{tmp2}"
    elif tmp2 == 1:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} * {tmp2}"
    return result, exp

def execution_fmul(instruction, tmp_dict):
    pattern = '([\S]+) = fmul .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = float(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = float(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp1 == 1.0:
        exp = f"{tmp2}"
    elif tmp2 == 1.0:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} * {tmp2}"
    return result, exp

def execution_udiv(instruction, tmp_dict):
    pattern = '([\S]+) = udiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp2 == 1:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} / {tmp2}"
    return result, exp

def execution_sdiv(instruction, tmp_dict):
    pattern = '([\S]+) = sdiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp2 == 1:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} / {tmp2}"
    return result, exp

def execution_fdiv(instruction, tmp_dict):
    pattern = '([\S]+) = fdiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = float(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = float(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if tmp2 == 1.0:
        exp = f"{tmp1}"
    else:
        exp = f"{tmp1} / {tmp2}"
    return result, exp

def execution_urem(instruction, tmp_dict):
    pattern = '([\S]+) = urem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} % {tmp2}"
    return result, exp

def execution_srem(instruction, tmp_dict):
    pattern = '([\S]+) = srem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})"
        else:
            tmp1 = tmp1
    try:
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} % {tmp2}"
    return result, exp

def execution_frem(instruction, tmp_dict):
    pattern = '([\S]+) = frem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = float(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = float(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} % {tmp2}"
    return result, exp

def execution_shl(instruction, tmp_dict):
    pattern = '([\S]+) = shl .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if type(tmp1) == type(1) and type(tmp2) == type(2):
        exp = f"{tmp1 << tmp2}"
    else:
        exp = f"{tmp1} << {tmp2}"
    return result, exp

def execution_lshr(instruction, tmp_dict):
    pattern = '([\S]+) = lshr .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    exp = f"{tmp1} << {tmp2}"
    return result, exp

def execution_and(instruction, tmp_dict):
    pattern = '([\S]+) = and .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if type(tmp1) == type(1) and type(tmp2) == type(1):
        exp = f"{tmp1 & tmp2}"
    else:
        exp = f"{tmp1} & {tmp2}"
    return result, exp

def execution_or(instruction, tmp_dict):
    pattern = '([\S]+) = or .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if type(tmp1) == type(1) and type(tmp2) == type(1):
        exp = f"{tmp1 | tmp2}"
    else:
        exp = f"{tmp1} | {tmp2}"
    return result, exp

def execution_xor(instruction, tmp_dict):
    pattern = '([\S]+) = xor .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    try:
        tmp1 = int(tmp1)
    except:
        if tmp1 in tmp_dict:
            tmp1 = f"({tmp_dict[tmp1]})" 
        else: 
            tmp1 = tmp1 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"({tmp_dict[tmp2]})"
        else:
            tmp2 = tmp2
    if type(tmp1) == type(1) and type(tmp2) == type(1):
        exp = f"{tmp1 ^ tmp2}"
    else:
        exp = f"{tmp1} ^ {tmp2}"
    return result, exp

def execution_extractelement(instruction, tmp_dict):
    pattern = '([\S]+) = extractelement .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    if tmp1 in tmp_dict:
        tmp1 = f"({tmp_dict[tmp1]})" 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"{tmp_dict[tmp2]}"
        else:
            tmp2 = tmp2
    exp = f"{tmp1}[{tmp2}]"
    return result, exp

def execution_insertelement(instruction, tmp_dict):
    # TODO
    pattern = '([\S]+) = insertelement .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    if tmp1 in tmp_dict:
        tmp1 = f"({tmp_dict[tmp1]})" 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"{tmp_dict[tmp2]}"
        else:
            tmp2 = tmp2
    exp = f"{tmp1}[{tmp2}]"
    return result, exp

def execution_shufflevector(instruction, tmp_dict):
    # TODO
    pattern = '([\S]+) = insertelement .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    if tmp1 in tmp_dict:
        tmp1 = f"({tmp_dict[tmp1]})" 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"{tmp_dict[tmp2]}"
        else:
            tmp2 = tmp2
    exp = f"{tmp1}[{tmp2}]"

def execution_extractvalue(instruction, tmp_dict):
    # TODO
    pattern = '([\S]+) = extractvalue .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(2)
    if tmp1 in tmp_dict:
        tmp1 = f"({tmp_dict[tmp1]})" 
    try: 
        tmp2 = int(tmp2)
    except:
        if tmp2 in tmp_dict:
            tmp2 = f"{tmp_dict[tmp2]}"
        else:
            tmp2 = tmp2
    return

def execution_alloca(instruction, tmp_dict):
    pattern = "([\S]+) = alloca [^,\n]*(, [^,\ng]+ ([^,\s]+))*(, align ([^,\s]+))*(, addrspace([0-9]+))*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    num_elem = match.group(3)
    align = match.group(5)
    addrspace = match.group(7)

    return result

def execution_load(instruction, tmp_dict):
    pattern = "([\S]+) = load [^,\n]+, [^,\n]+ ([^,\s]+)(,.*)*"
    match = re.match(pattern, instruction)
    if not match:
        print(f"{instruction} not match")
        return None
    result = match.group(1)
    source = match.group(2)
    if source in tmp_dict:
        source = tmp_dict[source]
    exp = f"*({source})"
    if exp in tmp_dict:
        exp = tmp_dict[exp]
    return result, exp

def execution_store(instruction, tmp_dict):
    pattern = "store .* ([\S]+), [^,\n]+ ([^,\s]+)(,.*)*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    source = match.group(1)
    result = match.group(2)
    if source in tmp_dict:
        source = tmp_dict[source]
    result = f"*({result})"
    return result, source

def execution_cmpxchg(instruction, tmp_dict):
    pattern = "cmpxchg [^,\n]+ ([\S]+), [^,\n]+ ([\S]+), [^,\s]+ ([\S]+)( .*)*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    ptr = match.group(1)
    cmp = match.group(2)
    new = match.group(3)
    # TODO
    if ptr in tmp_dict:
        ptr = tmp_dict[ptr]
    result = f"*({ptr})"
    if result in tmp_dict:
        result = tmp_dict[result]
    if new in tmp_dict:
        new = tmp_dict[new]
    return result, new

def execution_getelementptr(instruction, tmp_dict):
    pattern = "([\S]+) = getelementptr .*, (([^,\n]+)|([0-9]+ x [^,\n]+)) ([^,\n]+)(, .*)*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    ptr = match.group(5)
    range_str = match.group(6)
    pattern_range = ', [^,\n] ([0-9]+)'
    findall = re.findall(pattern_range, range_str)
    indexes = []
    for find in findall:
        tmp = find[0]
        if find in tmp_dict:
            tmp = tmp_dict[find[0]] 
        indexes.append(f"[{tmp}]")
    if ptr in tmp_dict:
        ptr = tmp_dict[ptr]

    exp = f"{ptr}{''.join(indexes)}"
    return result, exp

def execution_call(instruction, tmp_dict):
    pattern = "(([\S]+) = (tail|nysttail|nottail)*)*[\s]*call .* (@[\S]+)\((.*)\)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(2)
    func_name = match.group(4)
    params_str = match.group(5)
    pattern_params = "([^,]+\([^\)]+\))|([^,]+)"
    params_find = re.findall(pattern_params, params_str)
    params = []
    for p in params_find:
        tmp = ""
        if len(p[0]) > 0:
            pat = "@[\S]+"
            pat_find = re.findall(pat, p[0])
            if len(pat_find) > 0:
                tmp = pat_find[0]
        elif len(p[1]) > 0:
            pat = "%[\S]+"
            pat_find = re.findall(pat, p[1])
            if len(pat_find) > 0:
                tmp = pat_find[0]
        else:
            continue
        if len(tmp) > 0:
            if tmp in tmp_dict:
                tmp = tmp_dict[tmp]
                params.append(tmp)
    exp = f"{func_name}({', '.join(params)})"
    return result, exp
    

