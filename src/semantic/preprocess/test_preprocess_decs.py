import sys
import pytest
from preprocess_decs import process, check

import shutil

class Test_Process_decs():
    def setup_class(self):
        print("-------->setup_method")
        self.test_root = '../../../test/'
        self.passes = ['chk', 'concat']
        self.func_filter = ["func0"]


    def teardown_class(self):
        print('-------->teardown_method')

    def test_b(self):
        raw_dec_dir = os.path.join(self.test_root, 'b/raw/dec')
        dec_dir = os.path.join(self.test_root, 'b/dec')
        if os.path.exists(dec_dir):
            shutil.rmtree(dec_dir)
        shutil.copy(raw_dec_dir, dec_dir)

        for opt in ["O0", "O1", "O2", "O3", "Os"]:
            for decompiler in ["Ghidra", "RetDec"]:
                src_dir = os.path.join(dec_dir, opt, decompiler)
                process(src_dir, self.passes, self.func_filter)
                con_cnt, chk_cnt = check(src_dir)
                assert con_cnt == 0, f"Case b not pass. Expected 0, get {con_cnt}."
                assert chk_cnt == 0, f"Case b not pass. Expected 0, get {chk_cnt}."

if __name__ == '__main__':
    pytest.main("-s test_preprocess_decs.py")     


