import sys
import pytest
from sample_ds import sample_by_ir
import os

import shutil

class Test_Sample_by_ir():
    def setup_class(self):
        print("-------->setup_method")
        self.test_root = '../../../test/'
        self.decompilers = ['Ghidra', 'RetDec']
        self.opts = ['O0', 'O1', 'O2', 'O3', 'Os']

    def teardown_class(self):
        print('-------->teardown_method')

    def test_b(self):
        sample_dir = os.path.join(self.test_root, 'b/sample')
        if os.path.exists(sample_dir):
            shutil.rmtree(sample_dir)
        os.makedirs(sample_dir)

        raw_dec_dir = os.path.join(self.test_root, 'b/dec')
        raw_ir_dir = os.path.join(self.test_root, 'b/ir')
        k = 5

        for opt_level in self.opts:
            ir_dir = os.path.join(raw_ir_dir, opt_level)
            dec_dir = os.path.join(raw_dec_dir, opt_level)
            out_dir = os.path.join(sample_dir, opt_level)
            sample_by_ir(ir_dir, dec_dir, out_dir, k, self.decompilers)

            ir_cnt = len(os.listdir(os.path.join(out_dir, 'ir')))
            for decompiler in self.decompilers:
                cnt = len(os.listdir(os.path.join(out_dir, decompiler)))
            assert cnt == ir_cnt, f"Case b not pass. For {decompiler}, expect {ir_cnt} samples, get {cnt}."

if __name__ == '__main__':
    pytest.main("-s test_sample_ds.py")  