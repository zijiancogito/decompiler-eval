import os
import argparse

compiler_generated_funcs = [
    '_init',
	'__cxa_finalize',
	'__stack_chk_fail',
	'__isoc99_scanf',
	'_start',
	'deregister_tm_clones',
	'register_tm_clones',
	'__do_global_dtors_aux',
	'_do_global_dtors_aux',
	'frame_dummy',
	'_fini',
	'__libc_start_main',
	'UnresolvableJumpTarget',
	'UnresolvableCallTarget',
	'__printf_chk',
	'__cxx_global_var_init-ir',
	'__cxx_global_var_init',
	'__cxa_atexit',
	'llvm.memset.p0i8.i64',
	'_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_',
	'(**init_proc())',
	'term_proc',
	'_libc_csu_init',
	'_libc_csu_fini',
	'_gmon_start__',
	'start',
    'sub_',
]

class ExtractFuncs(object):
    def __init__(self, file_path):
        self.file_path = file_path
        self.src = self._readfile()
        self.funcs = {}

    def extractFuncs(self, funcs):
        raise NotImplementedError

    def findFuncs(self):
        raise NotImplementedError



    def _readfile(self, path):
        content = None
        with open(self.file_path, 'r', encoding='ISO-8859-1') as f:
            content = f.readlines()
        return content