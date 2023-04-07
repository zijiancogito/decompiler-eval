import sys

import os
import numpy as np

import matplotlib.pyplot as plt


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

def scatter_hist(x, y, ax, ax_histx, ax_histy):
    # no labels
    ax_histx.tick_params(axis="x", labelbottom=False)
    ax_histy.tick_params(axis="y", labelleft=False)
    # the scatter plot:
    ax.scatter(x, y)
    # now determine nice limits by hand:
    ax_histx.hist(x)
    ax_histy.hist(y, orientation='horizontal')

def plot_with_hist(x, y, save_to):
    fig = plt.figure(figsize=(10, 10), dpi=100)
    gs = fig.add_gridspec(2, 2, width_ratios=(4, 1), height_ratios=(1, 4),
                            left=0.1, right=0.9, bottom=0.1, top=0.9,
                            wspace=0.05, hspace=0.05)
    ax = fig.add_subplot(gs[1, 0])
    ax_histx = fig.add_subplot(gs[0, 0], sharex=ax)
    ax_histy = fig.add_subplot(gs[1, 1], sharey=ax)
    scatter_hist(x, y, ax, ax_histx, ax_histy)

    plt.savefig(save_to)

def plot_with_color(x, y, save_to):
    fig, ax = plt.subplots()
    ax.scatter(x, y, c='tab:blue', label='vars accs', alpha=0.3, edgecolors='none')
    ax.legend()
    ax.grid(True)
    plt.savefig(save_to)

def plot_base(x, y, save_to):
    plt.figure(figsize=(10, 10), dpi=100)
    plt.scatter(x, y)
    
    plt.savefig(save_to)
