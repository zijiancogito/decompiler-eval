import os
import pytest

from decompile_linux import decompile_all


class Test_Decompile_all():
    def setup_class(self):
        print("-------->setup_method")
        self.test_root = '../../../test/'
        self.decompilers = ['Ghidra', 'RetDec']


    def teardown_class(self):
        print('-------->teardown_method')

    def test_a(self):
        bin_root_dir = os.path.join(self.test_root, 'a', 'raw', 'bin')
        assert os.path.exists(bin_root_dir), f"Case a not pass. Binary files not found."
        out_root_dir = os.path.join(self.test_root, 'a', 'raw', 'dec')
        for opt in ["O0", "O1", "O2", "O3", "Os"]:
            for decompiler in self.decompilers:
                bin_dir = os.path.join(bin_root_dir, opt)
                out_dir = os.path.join(out_root_dir, opt, decompiler)
                cnt_0, cnt_1 = decompile_all(bin_dir, out_dir, decompiler)
                assert cnt_1 != 0, f"Case a not pass. Decompilation failed."

                r_cnt = len(os.listdir(out_dir))
                assert (cnt_0 + cnt_1) == r_cnt, f"Case a not pass. Expected {cnt_0 + cnt_1} files, get {r_cnt} files."

    def test_b(self):
        bin_root_dir = os.path.join(self.test_root, 'b', 'raw', 'bin')
        assert os.path.exists(bin_root_dir), f"Case b not pass. Binary files not found."
        out_root_dir = os.path.join(self.test_root, 'b', 'raw', 'dec')
        for opt in ["O0", "O1", "O2", "O3", "Os"]:
            for decompiler in self.decompilers:
                bin_dir = os.path.join(bin_root_dir, opt)
                out_dir = os.path.join(out_root_dir, opt, decompiler)
                cnt_0, cnt_1 = decompile_all(bin_dir, out_dir, decompiler)
                assert cnt_1 != 0, f"Case b not pass. Decompilation failed."

                r_cnt = len(os.listdir(out_dir))
                assert (cnt_0 + cnt_1) == r_cnt, f"Case b not pass. Expected {cnt_0 + cnt_1} files, get {r_cnt} files." 

        
    

if __name__ == '__main__':
    pytest.main("-s test_decompile.py") 