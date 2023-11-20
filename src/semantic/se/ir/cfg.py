import networkx as nx
from func_timeout import func_set_timeout

import sys
sys.path.append('../../../utils/tools/')
from mylist import list_lshift
from copy import deepcopy

class CFG():
    def __init__(self, edges):
        self.cfg = nx.DiGraph()
        for e in edges:
            self.cfg.add_edge(e[0], e[1])

        self.entry = None
        self.exit = None
        self.paths = None

        self.norm_cfg = nx.DiGraph(self.cfg)
        self.normalize()

    def set_entry(self, entry):
        self.entry = entry

    def set_exit(self, exit):
        self.exit = exit

    def normalize(self):
        cycles = nx.simple_cycles(self.norm_cfg)
        cycles_stack = []
        for c in cycles:
            print(c)
            list_lshift(c)
            print(c)
            cycles_stack.append(deepcopy(c))

        while len(cycles_stack) != 0:
            c = cycles_stack.pop()
            if len(c) == 1:
                self.norm_cfg.remove_edge(c[0], c[0])
            else:
                start = c[0]
                end = c[-1]
                self.norm_cfg.remove_edge(end, start)
                for s in self.norm_cfg.successors(start):
                    if s == start:
                        continue
                    self.norm_cfg.add_edge(end, s)

            cycles = nx.simple_cycles(self.norm_cfg)
            cycles_stack = []
            for tmp in cycles:
                list_lshift(tmp)
                cycles_stack.append(deepcopy(tmp))

    def get_all_path(self):
        if len(self.cfg.nodes) == 1:
            paths = []
            for node in self.cfg.nodes:
                paths.append([node])
            return paths
        paths = nx.all_simple_paths(self.norm_cfg, self.entry, self.exit)
        new_paths = []
        for p in paths:
            # TODO: 对路径里面，不在原始CFG图中的边，寻找一条在原始CFG上的两个节点的最简路径，加入进去，确保路径上的相邻两个节点在原始CFG中都是可达的
            if len(p) <= 1:
                new_paths.append(deepcopy(p))
                continue
            sub_path_dict = {}
            key_idx = 0
            p_graph = nx.DiGraph()
            for idx in range(len(p) - 1):
                u = p[idx]
                v = p[idx + 1]
                if not self.cfg.has_edge(u, v):
                    sub_paths = nx.all_simple_paths(self.cfg, u, v)
                    for sp in sub_paths:
                        key = f"sp{key_idx}"
                        p_graph.add_edge(u, key)
                        p_graph.add_edge(key, v)
                        sub_path_dict[key] = sp[1:-1]
                        key_idx += 1
                else:
                    p_graph.add_edge(u, v)
            graph_paths = nx.all_simple_paths(p_graph, self.entry, self.exit)
            for gp in graph_paths:
                if len(gp) <= 1:
                    new_paths.append(deepcopy(gp))
                    continue
                np =[]
                for v in gp:
                    if v in sub_path_dict:
                        np.extend(sub_path_dict[v])
                    else:
                        np.append(v)
                new_paths.append(deepcopy(np))
        # print()
        # for np in new_paths:
            # print(np)
        return new_paths


if __name__ == '__main__':
    edges = [(0, 9), (9, 15), (15, 17), (17, 9), (15, 20), (20, 22), (22, 20), (22, 25), (25, 26)] 
    cfg = CFG(edges)
    cfg.set_entry(0)
    cfg.set_exit(26)
    cfg.normalize()
    paths = cfg.get_all_path()
    print(paths)
