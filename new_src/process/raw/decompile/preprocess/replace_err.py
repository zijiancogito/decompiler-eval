import os
import sys
import argparse


def err_type(path):
    content = ""
    with open(path) as f:
        content = f.read().strip()
        if content.split('\n') > 3:
            content = ""
    return content


             