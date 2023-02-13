import sys
sys.path.append('../se/ir')
sys.path.append('../se/utils')
sys.path.append('../')
from load_ir import *

def batch_ir_execution(ir_dir, save_to):
    ll_files = os.listdir(ir_dir)
    for filename in ll_files:
        ir_file = os.path.join(ir_dir, filename)
        llvm_ir = read_ir(ir_file)
        process_functions(llvm_ir, filename.split('.')[0], save_to)

batch_ir_execution('/home/caoy/cy_proj/eval/data/POJ/ir', '/home/caoy/cy_proj/eval/data/POJ/se')

