import sys
sys.path.append('../se/ir')
sys.path.append('../se/utils')
sys.path.append('../')
# from load_ir import *
from df import *
import pdb

def log_err(save_to, fails):
    with open(save_to, 'w') as f:
        for fail in fails:
            f.write(fail.strip())
            f.write('\n')

def batch_ir_execution(ir_dir, save_to):
    ll_files = os.listdir(ir_dir)
    finished = os.listdir(save_to)
    failed = []
    for filename in ll_files:
        if filename.split('.')[0] in finished:
            continue
        ir_file = os.path.join(ir_dir, filename)
        # llvm_ir = read_ir(ir_file)
        # process_functions(llvm_ir, filename.split('.')[0], save_to)
        try:
            llvm_ir = read_ir(ir_file)
            process_functions(llvm_ir, filename.split('.')[0], save_to)
        except:
            failed.append(file_name)
    return failed

if __name__ == "__main__":
    # batch_ir_execution('/home/data/cy/eval/POJ/process/ir', '/home/data/cy/eval/POJ/process/se/ir')
    root = "/home/eval/DF/"
    print("Running o0")
    f_o0 = batch_ir_execution(os.path.join(root, 'ir', 'o0'), os.path.join(root, 'se/ir', 'o0'))
    log_err(os.path.join(root,'se', 'ir', 'fail', 'err_o0.csv'), f_o0)
    
    print("Running o1")
    f_o1 = batch_ir_execution(os.path.join(root, 'ir', 'o1'), os.path.join(root, 'se/ir', 'o1'))
    log_err(os.path.join(root,'se', 'ir', 'fail', 'err_o1.csv'), f_o1)

    print("Running o2")
    f_o2 = batch_ir_execution(os.path.join(root, 'ir', 'o2'), os.path.join(root, 'se/ir', 'o2'))
    log_err(os.path.join(root,'se', 'ir', 'fail', 'err_o2.csv'), f_o2)

    print("Running o3")
    f_o3 = batch_ir_execution(os.path.join(root, 'ir', 'o3'), os.path.join(root, 'se/ir', 'o3'))
    log_err(os.path.join(root,'se', 'ir', 'fail', 'err_o3.csv'), f_o3)

    print("Running os")
    f_os = batch_ir_execution(os.path.join(root, 'ir', 'os'), os.path.join(root, 'se/ir', 'os'))
    log_err(os.path.join(root,'se', 'ir', 'fail', 'err_os.csv'), f_os)

