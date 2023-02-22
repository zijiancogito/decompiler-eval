import sys
sys.path.append('../se/ir')
sys.path.append('../se/utils')
sys.path.append('../')
from load_ir import *
import pdb

def batch_ir_execution(ir_dir, save_to):
    ll_files = os.listdir(ir_dir)
    finished = os.listdir(save_to)
    for filename in ll_files:
        if filename.split('.')[0] in finished:
            continue
        print(filename)
        ir_file = os.path.join(ir_dir, filename)
        llvm_ir = read_ir(ir_file)
        process_functions(llvm_ir, filename.split('.')[0], save_to)

if __name__ == "__main__":
    # batch_ir_execution('/home/data/cy/eval/POJ/process/ir', '/home/data/cy/eval/POJ/process/se/ir')
    batch_ir_execution(sys.argv[1], sys.argv[2])

