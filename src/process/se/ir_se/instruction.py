
import re
import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/exp_tree/')
from exp_tree import ExpTree

def execution_instruction(instruction, tmp_dict):
    opcode = instruction.opcode
    if opcode == "ret":
        pass
    if opcode == "br":
        pass
    if opcode == "switch":
        pass
    if opcode == "indirectbr":
        pass
    if opcode == "invoke":
        pass
    if opcode == "callbr":
        result, exp = execution_callbr(str(instruction).strip(), tmp_dict)
        tmp_dict[result] = exp
    if opcode == "resume":
        pass
    if opcode == "catchswitch":
        pass
    if opcode == "catchret":
        pass
        # TODO
    if opcode == "unreachable":
        pass
    if opcode == "fneg":
        res = execution_fneg(str(instruction).strip(), tmp_dict) 
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "add":
        res = execution_add(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fadd":
        res = execution_fadd(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "sub":
        res = execution_sub(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fsub":
        res = execution_fsub(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "mul":
        res = execution_mul(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fmul":
        res = execution_fmul(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "udiv":
        res = execution_udiv(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "sdiv":
        res = execution_sdiv(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fdiv":
        res = execution_fdiv(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "urem":
        res = execution_urem(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "srem":
        res = execution_srem(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "frem":
        res = execution_frem(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "shl":
        res = execution_shl(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "lshr":
        res = execution_lshr(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "ashr":
        res = execution_ashr(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "and":
        res = execution_and(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "or":
        res = execution_or(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "xor":
        res = execution_xor(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "extractelement":
        res = execution_extractelement(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "insertelement":
        # TODO
        pass
    if opcode == "shufflevector":
        pass
    if opcode == "extractvalue":
        pass
    if opcode == "insertvalue":
        pass
    if opcode == "alloca":
        # TODO
        pass
    if opcode == "load":
        res = execution_load(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "store":
        res = execution_store(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fence":
        pass
    if opcode == "cmpxchg":
        pass
    if opcode == "atomicrmw":
        # TODO
        pass
    if opcode == "getelementptr":
        res = execution_getelementptr(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "trunc":
        res = execution_trunc(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "zext":
        res = execution_zext(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "sext":
        res = execution_sext(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fptrunc":
        res = execution_fptrunc(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fpext":
        res = execution_fpext(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fptoui":
        res = execution_fptoui(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fptosi":
        res = execution_fptosi(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "uitofp":
        res = execution_uitofp(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "sitofp":
        res = execution_sitofp(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "ptrtoint":
        res = execution_ptrtoint(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "inttoptr":
        res = execution_inttoptr(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "bitcast":
        res = execution_bitcast(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "addrspacecast":
        res = execution_addrspacecast(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "icmp":
        res = execution_icmp(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "fcmp":
        res = execution_fcmp(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "select":
        pass
        # res = execution_select(str(instruction).strip(), tmp_dict)
        # if res != None:
            # tmp_dict[res[0]] = res[1]
    if opcode == "freeze":
        pass
    if opcode == "call":
        res = execution_call(str(instruction).strip(), tmp_dict)
        if res != None:
            tmp_dict[res[0]] = res[1]
    if opcode == "va_arg":
        pass
    if opcode == "landingpad":
        pass
    if opcode == "catchpad":
        pass
    if opcode == "cleanuppad":
        pass



def execution_callbr(instruction, tmp_dict):
    pattern_non_void = "(.*) = callbr .*"
    pattern_void = "callbr .*"
    pattern_label = "label ([\S]+)"
    pattern_param = ".* (%[0-9]+)"

    if re.match(pattern_void, instruction):
        return None
    match = re.match(pattern_non_void, instruction)
    if not match:
        return None
    result = match.group(1)
    find_label = re.find(pattern_label, instruction)
    label = find_label[0][0]
    find_param = re.findall(pattern_param, instruction)
    
    exp = ExpTree('callbr', label)
    for p in find_param:
        if re.match(pattern_label, p):
            continue
        if p in tmp_dict:
            exp.add_child(tmp_dict[p])
        else:
            childp = ExpTree('parameter', p)
            exp.add_child(childp)
    return result, exp


def execution_fneg(instruction, tmp_dict):
    pattern = "([\S]+) = fneg .* ([\S]+)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)

    exp = ExpTree('fneg', '-')
    if op in tmp_dict:
        exp.add_child(tmp_dict[op])
    else:
        child = ExpTree('operator', op)
        exp.add_child(child)
    return result, exp

def execution_add(instruction, tmp_dict):
    pattern = '([\S]+) = add .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    try:
        op1 = int(op1)
        if op1 < 0:
            exp = ExpTree('sub', '-')
            if op2 in tmp_dict:
                exp.add_child(tmp_dict[op2])
            else:
                child1 = ExpTree('operator1', op2)
                exp.add_child(child1)
            child2 = ExpTree('operator2', -op1)
            exp.add_child(child2)
            return result, exp
    except:
        try:
            op2 = int(op2)
            if op2 < 0:
                exp = ExpTree('sub', '-')
                if op1 in tmp_dict:
                    exp.add_child(tmp_dict[op1])
                else:
                    child1 = ExpTree('operator1', op1)
                    exp.add_child(child1)
                child2 = ExpTree('operator2', -op2)
                exp.add_child(child2)
                return result, exp
        except:
            pass

    exp = ExpTree('add', '+')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_fadd(instruction, tmp_dict):
    pattern = '([\S]+) = fadd .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)
    try:
        op1 = float(op1)
        if op1 < 0:
            exp = ExpTree('fsub', '-')
            if op2 in tmp_dict:
                exp.add_child(tmp_dict[op2])
            else:
                child1 = ExpTree('operator1', op2)
                exp.add_child(child1)
            child2 = ExpTree('operator2', -op1)
            exp.add_child(child2)
            return result, exp
    except:
        try:
            op2 = float(op2)
            if op2 < 0:
                exp = ExpTree('fsub', '-')
                if op1 in tmp_dict:
                    exp.add_child(tmp_dict[op1])
                else:
                    child1 = ExpTree('operator1', op1)
                    exp.add_child(child1)
                child2 = ExpTree('operator2', -op2)
                return result, exp
        except:
            pass

    exp = ExpTree('fadd', '+')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp
    
def execution_sub(instruction, tmp_dict):
    pattern = '([\S]+) = sub .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('sub', '-')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2  = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_fsub(instruction, tmp_dict):
    pattern = '([\S]+) = fsub .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('fsub', '-')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_mul(instruction, tmp_dict):
    pattern = '([\S]+) = mul .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('mul', '*')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_fmul(instruction, tmp_dict):
    pattern = '([\S]+) = fmul .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('fmul', '*')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_udiv(instruction, tmp_dict):
    pattern = '([\S]+) = udiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('udiv', '/')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_sdiv(instruction, tmp_dict):
    pattern = '([\S]+) = sdiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('sdiv', '/')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_fdiv(instruction, tmp_dict):
    pattern = '([\S]+) = fdiv .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('fdiv', '/')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_urem(instruction, tmp_dict):
    pattern = '([\S]+) = urem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('urem', '%')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_srem(instruction, tmp_dict):
    pattern = '([\S]+) = srem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('srem', '%')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_frem(instruction, tmp_dict):
    pattern = '([\S]+) = frem .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('frem', '%')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_shl(instruction, tmp_dict):
    pattern = '([\S]+) = shl .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('shl', '<<')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_lshr(instruction, tmp_dict):
    pattern = '([\S]+) = lshr .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('lshr', '>>')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_ashr(instruction, tmp_dict):
    pattern = '([\S]+) = ashr .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('ashr', '>>')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_and(instruction, tmp_dict):
    pattern = '([\S]+) = and .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('and', '*')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_or(instruction, tmp_dict):
    pattern = '([\S]+) = or .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('or', '|')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_xor(instruction, tmp_dict):
    pattern = '([\S]+) = xor .* ([\S]+), ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('xor', '^')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        exp.add_child(child2)
    return result, exp

def execution_extractelement(instruction, tmp_dict):
    pattern = '([\S]+) = extractelement .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op1 = match.group(2)
    op2 = match.group(3)

    exp = ExpTree('extractelement', '*')
    add = ExpTree('address', '+')
    if op1 in tmp_dict:
        base = tmp_dict[op1]
    else:
        base = ExpTree('pointer', op1)
    if op2 in tmp_dict:
        index = tmp_dict[op2]
    else:
        if op2 == '0':
            index = int(op2)
        else:
            index = ExpTree('index', op2)
    if index == 0:
        exp.add_child(add)
    else:
        add.add_child(base)
        add.add_child(index)
        exp.add_child(add)
    return result, exp

def execution_insertelement(instruction, tmp_dict):
    # TODO
    pattern = '([\S]+) = insertelement .* ([\S]+), .* ([\S]+)'
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    tmp1 = match.group(2)
    tmp2 = match.group(3)

    exp = ExpTree('insertelement', '[]')
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        op1_tree = ExpTree('pointer', op1)
        exp.add_child(op1_tree)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        op2_tree = ExpTree('index', op2)
        exp.add_child(op2_tree)
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
    # TODO
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
    #print(instruction)
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    source = match.group(2)
     
    exp = None
    if source in tmp_dict:
        #exp.add_child(tmp_dict[source])
        exp = tmp_dict[source]
    else:
        #child = ExpTree('pointer', source)
        exp = ExpTree('pointer', source)
        #exp.add_child(child)
    #exp.show()
    return result, exp

def execution_store(instruction, tmp_dict):
    pattern = "store [^,]* ([\S]+), [^,\n]+ ([^,\s]+)(,.*)*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    source = match.group(1)
    result = match.group(2)
    
    exp = None
    if source in tmp_dict:
        exp = tmp_dict[source]
    else:
        exp = ExpTree('store', source)
    return result, exp

def execution_cmpxchg(instruction, tmp_dict):
    pattern = "cmpxchg [^,\n]+ ([\S]+), [^,\n]+ ([\S]+), [^,\s]+ ([\S]+)( .*)*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    ptr = match.group(1)
    cmp = match.group(2)
    new = match.group(3)
    # TODO
    exp = ExpTree()
    if ptr in tmp_dict:
        ptr = tmp_dict[ptr]
    result = f"*({ptr})"
    if result in tmp_dict:
        result = tmp_dict[result]
    if new in tmp_dict:
        new = tmp_dict[new]
    return result, new

def execution_getelementptr(instruction, tmp_dict):
    pattern = "([\S]+) = getelementptr (inbounds )*[^,]+, (.*)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    operands = match.group(3)
    pattern_op = "[^,\n]+ ([^,\s]+)"
    findall = re.findall(pattern_op, operands)

    exp = ExpTree('getelementptr', '&')
    add = ExpTree('address', '+')
    base = findall[0]
    base_tree = None
    if base in tmp_dict:
        base_tree = tmp_dict[base]
    else:
        base_tree = ExpTree('base', base)

    index_trees = []
    for index in findall[1:]:
        if index == '0':
            continue
        if index in tmp_dict:
            index_trees.append(tmp_dict[index])
        else:
            index_tree = ExpTree('index', index)
            index_trees.append(index_tree)

    if len(index_trees) == 0:
        exp.add_child(base_tree)
    else:
        add.add_child(base_tree)
        for index in index_trees:
            add.add_child(index)
        exp.add_child(add)

    return result, exp

def execution_call(instruction, tmp_dict):
    # pattern = "(([\S]+) = (tail|nysttail|nottail)*)*[\s]*call .* (@[\S]+)\((.*)\)"
    pattern = "(([\S]+) = (tail|nysttail|nottail)*)*[\s]*call .* @([\S]+).*\((.*)\)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(2)
    func_name = match.group(4)
    if func_name.startswith('llvm'):
        return None
    params_str = match.group(5)
    pattern_params = "([^,]+\([^\)]+\))|([^,]+)"
    params_find = re.findall(pattern_params, params_str)
    
    exp = ExpTree('call', func_name)
    cnt = 0
    for p in params_find:
        tmp = ""
        if len(p[0]) > 0:
            pat = "@([\S]+)"
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
            cnt += 1
            if tmp in tmp_dict:
                exp.add_child(tmp_dict[tmp])
            else:
                childp = ExpTree(f'parameter{cnt}', tmp)
                exp.add_child(childp)
    return result, exp
    
def execution_icmp(instruction, tmp_dict):
    pattern = "([\S]+) = icmp ([\S]+) [^,\n]+ ([\S]+), ([\S]+)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    cond = match.group(2)
    op1 = match.group(3)
    op2 = match.group(4)
    if cond == "eq":
        cond = "=="
    elif cond == "ne":
        cond = "!="
    elif cond == "ugt" or cond == "sgt":
        cond = ">"
    elif cond == "uge" or cond == "sge":
        cond = ">="
    elif cond == "ult" or cond == "slt":
        cond = "<"
    elif cond == "ule" or cond == "sle":
        cond = "<="
    else:
        return None

    exp = ExpTree('icmp', cond)
    if op1 in tmp_dict:
        exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator', op1)
        exp.add_child(child1)
    if op2 in tmp_dict:
        exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator', op2)
        exp.add_child(child2)
    return result, exp

def execution_fcmp(instruction, tmp_dict):
    pattern = "([\S]+) = fcmp ([\S]+ )*([\S]+) [^,\n]+ ([\S]+), ([\S]+)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    cond = match.group(3)
    op1 = match.group(4)
    op2 = match.group(5)
    if cond == "false":
        cond = "false"
    elif cond == "oeq":
        cond = "=="
    elif cond == "ogt":
        cond = ">"
    elif cond == "oge":
        cond = ">="
    elif cond == "olt":
        cond = "<"
    elif cond == "ole":
        cond = "<="
    elif cond == "ueq":
        cond = "=="
    elif cond == "ugt":
        cond = ">"
    elif cond == "uge":
        cond = ">="
    elif cond == "ult":
        cond = "<"
    elif cond == "ule":
        cond = "<="
    elif cond == "une":
        cond = "!="
    elif cond == "true":
        cond = "true"
    else:
        return None

    exp = ExpTree('fcmp', cond)
    if cond != 'false' and cond != 'true':
        if op1 in tmp_dict:
            exp.add_child(tmp_dict[op1])
        else:
            child1 = ExpTree('operator1', op1)
            exp.add_child(child1)
        if op2 in tmp_dict:
            exp.add_child(tmp_dict[op2])
        else:
            child2 = ExpTree('operator2', op2)
            exp.add_child(child2)
    return result, exp

def execution_phi(instruction, tmp_dict, pre_block):
    pattern = "([\S]+) = phi (nnan|ninf|nsz|arcp|contract|afn|reassoc|fast)*[\s]*[\S]+ (.*)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    nodes = match.group(3)
    node_pattern = "\[ ([\S]+), %([\S]+) \]"
    find = re.findall(node_pattern, nodes)
    exp = None
    tmp = None
    for f in find:
        var = f[0]
        label = f[1].strip('%')
        if int(label) == int(pre_block):
            tmp = var
            break
    
    if tmp in tmp_dict:
        exp = tmp_dict[tmp]
    else:
        try:
            tmp = int(tmp)
            exp = ExpTree('value', tmp)
        except:
            return None
    return result, exp

def execution_select(instruction, tmp_dict):
    pattern = "([\S]+) = select (nnan|ninf|nsz|arcp|contract|afn|reassoc|fast)*[^,]* ([\S]+), [^,]* ([\S]+), [^,]* ([\S]+)"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    cond = match.group(2)
    op1 = match.group(3)
    op2 = match.group(4)
    exp = ExpTree('select', '?')
    if cond in tmp_dict:
        exp.add_child(tmp_dict[cond])
    else:
        cond_exp = ExpTree('cond', cond)
        exp.add_child(cond_exp)
    val_exp = ExpTree('value', ':')
    if op1 in tmp_dict:
        val_exp.add_child(tmp_dict[op1])
    else:
        child1 = ExpTree('operator1', op1)
        val_exp.add_child(child1)
    if op2 in tmp_dict:
        val_exp.add_child(tmp_dict[op2])
    else:
        child2 = ExpTree('operator2', op2)
        val_exp.add_child(child2)
    exp.add_child(val_exp)
    return result, exp

def execution_sext(instruction, tmp_dict):
    pattern = "([\S]+) = sext .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('sext', op)

    return result, exp

def execution_zext(instruction, tmp_dict):
    pattern = "([\S]+) = zext .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('zext', op)

    return result, exp

def execution_fpext(instruction, tmp_dict):
    pattern = "([\S]+) = fpext .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('fpext', op)

    return result, exp

def execution_fptoui(instruction, tmp_dict):
    pattern = "([\S]+) = fptoui .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('fptoui', op)

    return result, exp

def execution_fptosi(instruction, tmp_dict):
    pattern = "([\S]+) = fptosi .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('fptosi', op)

    return result, exp

def execution_uitofp(instruction, tmp_dict):
    pattern = "([\S]+) = uitofp .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('uitofp', op)

    return result, exp

def execution_sitofp(instruction, tmp_dict):
    pattern = "([\S]+) = sitofp .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('sitofp', op)

    return result, exp

def execution_ptrtoint(instruction, tmp_dict):
    pattern = "([\S]+) = ptrtoint .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('ptrtoint', op)

    return result, exp

def execution_inttoptr(instruction, tmp_dict):
    pattern = "([\S]+) = inttoptr .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('inttoptr', op)

    return result, exp

def execution_bitcast(instruction, tmp_dict):
    pattern = "([\S]+) = bitcast .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('bitcast', op)

    return result, exp

def execution_addrspacecast(instruction, tmp_dict):
    pattern = "([\S]+) = addrspacecast .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('addrspacecast', op)

    return result, exp

def execution_fptrunc(instruction, tmp_dict):
    pattern = "([\S]+) = fptrunc .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('fptrunc', op)

    return result, exp

def execution_trunc(instruction, tmp_dict):
    pattern = "([\S]+) = trunc .* ([\S]+) to .*"
    match = re.match(pattern, instruction)
    if not match:
        return None
    result = match.group(1)
    op = match.group(2)
    exp = None
    if op in tmp_dict:
        exp = tmp_dict[op]
    else:
        exp = ExpTree('trunc', op)

    return result, exp


