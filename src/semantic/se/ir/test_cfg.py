import sys
sys.path.append('.')
import pytest

from cfg import CFG

class Test_CFG():

    def setup_class(self):
        print("-------->setup_method")

    def teardown_class(self):
        print('-------->teardown_method')

    def test_a(self):
        edges = [(0, 9), (9, 15), (15, 17), (17, 9), (15, 20), (20, 22), (22, 20), (22, 25), (25, 26)] 

        cfg = CFG(edges)
        cfg.set_entry(0)
        cfg.set_exit(26)
        cfg.normalize()
        expected_norm_edges = set([(0, 9), (9, 15), (15, 17), (15, 20), (17, 20), (20, 22), (22, 25), (25, 26)])

        print(set(list(cfg.norm_cfg.edges)))
        assert expected_norm_edges == set(list(cfg.norm_cfg.edges)), f"CFG normalize() not pass: Expect {expected_norm_edges}, get {list(cfg.norm_cfg.edges)}."
        paths = cfg.get_all_path()
        paths = set(['-'.join(list(map(str, i))) for i in paths])
        print(paths)
        expected_paths = set(["0-9-15-20-22-25-26", f"0-9-15-17-9-15-20-22-25-26"])

        assert paths == expected_paths, f"CFG get_all_path() not pass: Expect {expected_paths}, get {paths}."

    def test_b(self):
        edges = [(0, 1), (1, 2), (1, 3), (2, 4), (3, 4)] 
        cfg = CFG(edges)
        cfg.set_entry(0)
        cfg.set_exit(4)
        cfg.normalize()
        expected_norm_edges = set([(0, 1), (1, 2), (1, 3), (2, 4), (3, 4)])

        print(set(list(cfg.norm_cfg.edges)))
        assert expected_norm_edges == set(list(cfg.norm_cfg.edges)), f"CFG normalize() not pass: Expect {expected_norm_edges}, get {list(cfg.norm_cfg.edges)}."
        paths = cfg.get_all_path()
        paths = set(['-'.join(list(map(str, i))) for i in paths])
        print(paths)
        expected_paths = set(["0-1-2-4", f"0-1-3-4"])

        assert paths == expected_paths, f"CFG get_all_path() not pass: Expect {expected_paths}, get {paths}."
        
    def test_c(self):
        edges = [(0, 1), (1, 2), (2, 3), (3, 2), (2, 4), (4, 5), (5, 2), (2, 6), (4, 7), (6, 7)] 
        cfg = CFG(edges)
        cfg.set_entry(0)
        cfg.set_exit(7)
        cfg.normalize()
        expected_norm_edges = set([(0, 1), (2, 4), (1, 2), (3, 4), (5, 7), (2, 3), (6, 7), (4, 5), (2, 6), (5, 6), (3, 6), (4, 7)])
        print(set(list(cfg.norm_cfg.edges)))
        assert expected_norm_edges == set(list(cfg.norm_cfg.edges)), f"CFG normalize() not pass: Expect {expected_norm_edges}, get {list(cfg.norm_cfg.edges)}."

        paths = cfg.get_all_path()
        paths = set(['-'.join(list(map(str, i))) for i in paths])
        print(paths)
        expected_paths = set(['0-1-2-4-5-2-4-7', '0-1-2-3-2-4-5-2-6-7', '0-1-2-4-5-2-6-7', '0-1-2-4-7', '0-1-2-3-2-6-7', '0-1-2-6-7', '0-1-2-3-2-4-5-2-4-7', '0-1-2-3-2-4-7'])
        assert paths == expected_paths, f"CFG get_all_path() not pass: Expect {expected_paths}, get {paths}."

if __name__ == '__main__':
    pytest.main("-s test_cfg.py") 