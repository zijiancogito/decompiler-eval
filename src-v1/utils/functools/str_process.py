import sys
import os
import re

def str_split(s, l):
    sub_seq = s.split(' ')
    new_s = []
    tmp = ''
    for s in sub_seq:
        tmp = tmp + s
        if len(tmp) > l:
            new_s.append(tmp)
            tmp = ''
    if tmp != '':
        new_s.append(tmp)
    return new_s