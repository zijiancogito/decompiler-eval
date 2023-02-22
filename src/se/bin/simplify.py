import claripy
import angr
import re

def get_symbol_from_bv(bv):
    pattern = re.compile(r'([a-zA-Z0-9\__64]+)\[[0-9]+:[0-9]+\]')
    match_obj = pattern.findall(bv)
    if len(match_obj) > 0:
        return match_obj[0]
    else:
        return None

def replace_multi_bit_with_symbol(bv):
    pattern = re.compile(r'\([^\(\)]+\)')
    # Find all pattern like "(0x0 .. p0_98_64[7:0])" and replace it with p0_98_64
    match_obj = pattern.findall(bv)
    new_bv = bv
    for obj in match_obj:
        symbol = get_symbol_from_bv(obj)
        new_bv = new_bv.replace(obj, symbol)
    return new_bv
        

def replace_remain_symbol(bv):
    # Find all pattern like "p0_98_64[31:0]"
    pattern = re.compile(r'([a-zA-Z0-9\__64]+)\[[0-9]+:[0-9]+\]')
    match_obj = pattern.findall(bv)
    new_bv = bv
    for obj in match_obj:
        new_bv = re.sub(pattern, obj, new_bv, 0)
    return new_bv


def simplify(bv):
    # Find all pattern like "(0x0 .. p0_98_64[7:0])" and replace it with p0_98_64
    new_bv = replace_multi_bit_with_symbol(bv)

    # further simplify
    # <BVxx 0x0 .. xxx[xx:0]>   to   xxx
    pattern = r'<BV[0-9]+ (0(x0)* .. )*([^\[]+)\[[0-9]+\:[0-9]+\]>'
    match_obj = re.match(pattern, new_bv)
    new_bv = match_obj.groups()[-1]

    print(new_bv)
    return new_bv.strip()
