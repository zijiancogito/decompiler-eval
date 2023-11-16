import sys
import pytest
import os

from gen import generate
import shutil
import make

class Test_Generate():
    def setup_class(self):
        print("-------->setup_method")
        self.dsmith = './dsmith/source.py'
        self.config_file = './config'
        self.test_root = '../../../test/'
        if not os.path.exists(self.test_root):
            os.makedirs(self.test_root)
        else:
            shutil.rmtree(self.test_root)

        self.cflags = ['-fno-inline-functions',
              '-fno-default-inline',
              '-fno-inline-functions-called-once'
        ]
        self.cc = "clang"

    def teardown_class(self):
        print('-------->teardown_method')

    def test_a(self):
        number = 1
        save_to = os.path.join(self.test_root, 'a/', 'raw/', 'src')
        generate(self.dsmith, save_to, self.config_file, number)
        gen_files = os.listdir(save_to)
        chk = True
        for f in gen_files:
            cmd = f"{self.cc} {os.path.join(save_to, f)} -o /dev/null"
            res = os.system(cmd) >> 8
            if res != 0:
                chk = False
                break
        assert chk, f"Case a not pass. Invalid source code."

        for opt in ['O0', 'O1', 'O2', 'O3', 'Os']:
            config = {"cflags": self.cflags, "opt": opt}
            out_dir = os.path.join(self.test_root, 'a', 'raw', 'ir', opt)
            p_cnt = make.make_ir(config, save_to, out_dir)
            r_cnt = len(os.listdir(out_dir))
            assert p_cnt == r_cnt, f"Case a not pass. IR compilation error for {opt}."
        
        for opt in ['O0', 'O1', 'O2', 'O3', 'Os']:
            config = {"cflags": self.cflags, "opt": opt, "cc": self.cc}
            out_dir = os.path.join(self.test_root, 'a', 'raw', 'bin', opt)
            p_cnt = make.make_bin(config, save_to, out_dir)
            r_cnt = len(os.listdir(out_dir))
            assert p_cnt == r_cnt, f"Case a not pass. Binary compilation error for {opt}."

    def test_b(self):
        number = 10
        save_to = os.path.join(self.test_root, 'b/', 'raw/', 'src')
        generate(self.dsmith, save_to, self.config_file, number)
        gen_files = os.listdir(save_to)
        chk = True
        for f in gen_files:
            cmd = f"gcc {os.path.join(save_to, f)} -o /dev/null"
            res = os.system(cmd) >> 8
            if res != 0:
                chk = False
                break
        assert chk, f"Case b not pass. Invalid source code."

        for opt in ['O0', 'O1', 'O2', 'O3', 'Os']:
            config = {"cflags": self.cflags, "opt": opt}
            out_dir = os.path.join(self.test_root, 'b', 'raw', 'ir', opt)
            p_cnt = make.make_ir(config, save_to, out_dir)
            r_cnt = len(os.listdir(out_dir))
            assert p_cnt == r_cnt, f"Case b not pass. IR compilation error for {opt}."
        
        for opt in ['O0', 'O1', 'O2', 'O3', 'Os']:
            config = {"cflags": self.cflags, "opt": opt, "cc": self.cc}
            out_dir = os.path.join(self.test_root, 'b', 'raw', 'bin', opt)
            p_cnt = make.make_bin(config, save_to, out_dir)
            r_cnt = len(os.listdir(out_dir))
            assert p_cnt == r_cnt, f"Case b not pass. Binary compilation error for {opt}."

        


    
    
if __name__ == '__main__':
    pytest.main("-s test_gen.py") 

