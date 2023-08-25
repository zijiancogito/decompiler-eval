import sys

import os
import numpy as np
import matplotlib.pyplot as plt
from shapely.geometry import Point
from shapely.ops import cascaded_union
import brewer2mpl



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
    plt.cla()
    plt.close('all')

def plot_with_color(x, y, save_to):
    fig, ax = plt.subplots()
    ax.scatter(x, y, c='tab:blue', label='vars accs', alpha=0.3, edgecolors='none')
    ax.legend()
    ax.grid(True)
    plt.savefig(save_to)
    plt.cla()
    plt.close('all')

def plot_base(x, y, save_to):
    plt.figure(figsize=(10, 10), dpi=100)
    plt.scatter(x, y)
    
    plt.savefig(save_to)
    plt.cla()
    plt.close('all')

def plot_multi(pairs, save_to, colors, decompilers):
    plt.figure(figsize=(10, 10), dpi=100)
    idx = 0
    for xi, yi in pairs:
        plt.scatter(xi, yi, c=colors[idx], label=decompilers[idx], edgecolors='none', alpha=0.5, marker=',')
        idx += 1
    plt.legend()
    plt.grid(True)
    plt.savefig(save_to)
    plt.cla()
    plt.close('all')

def plot_stems(xs, ys, save_to, colors, decompilers):
    xs = np.array(xs)
    ys = np.array(ys)
    plt.figure(figsize=(20, 10), dpi=100)
    plt.xticks(np.arange(0, 1001, 200))
    plt.yticks(np.arange(0, 1, 0.5))

    labels = []
    y = ys.T
    for i in xs:
        idx = np.argmax(y[i])
        if decompilers[idx] in labels:
            label = ''
        else:
            label = decompilers[idx]
            labels.append(label)

        (markers, stemlines, baseline) = plt.stem(i, y[i, idx], label=label)
        plt.setp(stemlines, linestyle="-", linewidth=1, color=colors[idx], alpha=0.3)
        plt.setp(baseline, linestyle="-", color=colors[idx], alpha=0)
        plt.setp(markers, marker='*', color=colors[idx])

    plt.legend()
    plt.savefig(save_to)

def plot_multi_stems2(xs, ys, save_to, colors, decompilers):
    xs = np.array(xs)
    ys = np.array(ys)
    plt.figure(figsize=(20, 40), dpi=100)

    for i in range(ys.shape[0]):
        ax = plt.subplot(5, 1, i + 1)
        (markers, stemlines, baseline) = plt.stem(xs, ys[i], label=decompilers[i])
        plt.setp(stemlines, linestyle="-", linewidth=1, color=colors[i], alpha=0.3)
        plt.setp(baseline, linestyle="-", color=colors[i], alpha=0)
        plt.setp(markers, marker='*', color=colors[i])
        plt.xticks(np.arange(0, 1001, 200))
        plt.ylim((0, 1))
        plt.yticks(np.arange(0, 1.1, 0.5))
        ax.legend()

    # plt.legend(loc='best',)
    plt.savefig(save_to)

def plot_multi_stems(xs, ys, save_to, colors, decompilers):
    plt.figure(figsize=(20, 10), dpi=100)
    idx = 0
    # bmap = brewer2mpl.get_map('Paired', 'Qualitative', len(decompilers))
    # colors = bmap.mpl_colors
    for yi in ys:
        (markers, stemlines, baseline) = plt.stem(xs, yi, label=decompilers[idx], use_line_collection=True)
        alpha = np.mean(yi)
        plt.setp(stemlines, linestyle="-", linewidth=(1-alpha)*2, color=colors[idx], alpha=0)
        plt.setp(baseline, linestyle="-", color=colors[idx], alpha=0)
        plt.setp(markers, marker='*', color=colors[idx])
        idx += 1
    plt.legend()
    plt.yticks(np.arange(0, 1, 0.5)) 
    plt.savefig(save_to)
    plt.cla()
    plt.close('all')
    
def plot_multi_hist(xs, ys, save_to, colors, decompilers):
    img = np.zeros((5, 50), dtype=np.float32)

    counts = []
    step = 2
    for i in range(0, 100, step):
        ymin = float(i) / 100
        ymax = ymin + step / 100
        for dec, yi in enumerate(ys):
            nyi = np.array(yi)
            count = len(np.where((nyi >= ymin) & (nyi < ymax))[0])
            if count > 255:
                count = 255
            img[dec][int(i/step)] = count
    plt.figure(figsize=(50, 5))       
    plt.imshow(img, cmap='GnBu')
    plt.yticks([1, 2, 3, 4, 5], decompilers)
    plt.legend()
    plt.savefig(save_to)
    plt.cla()
    plt.close('all')

def plot_split(pairs, save_to, colors, decompilers):
    plt.figure(figsize=(10, 10), dpi=100)

    plt.legend()

    plt.cla()
    plt.close('all')

if __name__ == '__main__':
    x = [1,2,3]
    ys = [[1,2,3], [4,5,6], [7,8,9]]
    pairs = [(x, ys[0]), (x, ys[1]), (x, ys[2])]
    plot_multi(pairs, './test.png', ['red', 'green', 'blue'], ['angr', 'ida', 'ghidra'])