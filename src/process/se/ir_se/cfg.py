import networkx as nx
from func_timeout import func_set_timeout

import sys
sys.path.append('/home/eval/decompiler-eval/src/utils/functools')
from list_operation import list_lshift

class CFG():
    def __init__(self):
        self.cfg = nx.DiGraph()
        self.entry = None
        self.exit = None
        self.paths = None
        
        self.norm_cfg = None

    def set_entry(self, entry):
        self.entry = entry

    def set_exit(self, exit):
        self.exit = exit

    def normalize_cfg(self):
        self.norm_cfg = nx.DiGraph(self.cfg)

        cycles = nx.simple_cycles(self.norm_cfg)
        cycles_stack = []
        for c in cycles:
            list_lshift(c)
            cycles_stack.append(c)
        while len(cycles_stack) != 0:
            c = cycles_stack.pop()
            if len(c) == 1:
                self.norm_cfg.remove_edge(c[0], c[0])
            else:
                start = c[0]
                end = c[-1]
                succ = c[1]
                self.norm_cfg.remove_edge(end, start)
                for s in self.norm_cfg.successors(start):
                    if s == start:
                        continue
                    self.norm_cfg.add_edge(end, s)

            cycles = nx.simple_cycles(self.norm_cfg)
            cycles_stack = []
            for tmp in cycles:
                list_lshift(tmp)
                cycles_stack.append(tmp)
    
    def get_all_path(self):
        paths = nx.all_simple_paths(self.norm_cfg, self.entry, self.exit)
        for p in paths:
            print(p)
        return paths

    def build_cfg(self, edges):
        for e in edges:
            self.cfg.add_edge(e[0], e[1])
            

if __name__ == '__main__':
    edges = [(0, 9), (9, 15), (15, 17), (17, 22), (15, 20), (20, 22), (22, 15), (22, 25), (25, 26)] 
    cfg = CFG()
    cfg.build_cfg(edges)
    cfg.set_entry(0)
    cfg.set_exit(26)
    cfg.normalize_cfg()
    cfg.get_all_path()

        