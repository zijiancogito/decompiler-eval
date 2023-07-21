import os
import re


def err_msg_parser(err_msg):
    tokens = re.findall(r"\'[^\']*\'", err_msg)
    kl