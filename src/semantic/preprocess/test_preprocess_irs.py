import sys
import pytest
import os
import shutil

from preprocess_irs import delete, check

class Test_Process_irs():
    def setup_class(self):
        print("-------->setup_method")
        self.test_root = '../../../test/'
        self.passes = ['attr', 'comment', 'load']


    def teardown_class(self):
        print('-------->teardown_method')

    def test_b(self):
        raw_dec_dir = os.path.join(self.test_root, 'b/raw/ir')
        ir_dir = os.path.join(self.test_root, 'b/ir')
        if os.path.exists(ir_dir):
            shutil.rmtree(ir_dir)

        shutil.copytree(raw_dec_dir, ir_dir)

        for opt in ["O0", "O1", "O2", "O3", "Os"]:
            src_dir = os.path.join(ir_dir, opt)
            delete(src_dir, self.passes)
            cnt = check(src_dir)
            assert cnt == 0, f"Case b not pass. {cnt} files can not be parsed by llvmlite."

if __name__ == '__main__':
    pytest.main("-s test_preprocess_irs.py")