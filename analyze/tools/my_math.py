import sys

import os
import numpy as np


def average_x_y(x, y):
    avg = {}
    for xi, yi in zip(x, y):
        if xi in avg:
            avg[xi].append(yi)
        else:
            avg[xi] = [yi]
    for xi in avg:
        avg[xi] = np.mean(avg[xi])
    new_x = avg.keys()
    new_y = [avg[xi] for xi in new_x]
    return new_x, new_y
