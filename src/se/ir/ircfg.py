import networkx as nx

class IRCFG():
    def __init__(self):
        self.cfg = nx.DiGraph()
        self.entry = None
        self.exit = None
        self.paths = None

        self.edge_cfg = nx.DiGraph()
        self.edge_cfg_entry = []
        self.edge_cfg_exit = []
        self.paths = []

    def set_entry(self, entry):
        self.entry = entry

    def set_exit(self, exit):
        self.exit = exit

    def build_edge_cfg(self):
        if len(self.cfg.nodes) == 1:
            for node in self.cfg.nodes:
                self.edge_cfg.add_node(f"{node}-{node}")
            for node in self.edge_cfg.nodes:
                self.edge_cfg_entry.append(node)
                self.edge_cfg_exit.append(node)
            return
        for node in self.cfg.nodes:
            for succ in self.cfg.successors(node):
                self.edge_cfg.add_node(f"{node}-{succ}")
        for edge1 in self.edge_cfg.nodes:
            edge1_s = int(edge1.split('-')[0])
            edge1_e = int(edge1.split('-')[1])
            for edge2 in self.edge_cfg.nodes:
                edge2_s = int(edge2.split('-')[0])
                edge2_e = int(edge2.split('-')[1])
                if edge1_s == edge2_e:
                    self.edge_cfg.add_edge(edge2, edge1)
                if edge1_e == edge2_s:
                    self.edge_cfg.add_edge(edge1, edge2)
        for edge in self.edge_cfg.nodes:
            s = int(edge.split('-')[0])
            e = int(edge.split('-')[1])
            if s == self.entry:
                self.edge_cfg_entry.append(edge)
            if e == self.exit:
                self.edge_cfg_exit.append(edge)
                
        return
