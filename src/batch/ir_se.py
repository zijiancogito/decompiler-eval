import sys
sys.path.append('../se/ir')
sys.path.append('../se/utils')
sys.path.append('../')
from load_ir import *
import pdb

def batch_ir_execution(ir_dir, save_to):
    ll_files = os.listdir(ir_dir)
    for filename in ll_files:
        print(filename)
        ir_file = os.path.join(ir_dir, filename)
        llvm_ir = read_ir(ir_file)
        process_functions(llvm_ir, filename.split('.')[0], save_to)

if __name__ == "__main__":
    batch_ir_execution('/home/data/cy/eval/POJ/process/ir', '/home/data/cy/eval/POJ/process/se/ir')

