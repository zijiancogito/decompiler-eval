import sys
sys.path.append('../')
import os
import csv
from exp_tree.exp_tree import *
import json
from ctypes import *
from processData.extractFunc import *
from check_de import check

dlclose_func = CDLL(None).dlclose
dlclose_func.argtypes = (c_void_p,)
dlclose_func.restype = c_int

def log_err(err_path, err_msg):
    with open(err_path, 'a') as f:
        writer = csv.writer(f)
        r = [err_msg]
        writer.writerow(r)

def batch_de_execution_from_file(des_dir, save_to, mode):
    de_dirs = os.listdir(des_dir)
    for de_dir_name in de_dirs:
        de_dir = os.path.join(des_dir, de_dir_name)
        de_files = os.listdir(de_dir)
        for de_file_name in de_files:
            if '-' in de_file_name:
                continue
            de_file = os.path.join(de_dir, de_file_name)
            print(de_file)

            # run cpp
            dese = cdll.LoadLibrary("/home/eval/decompiler-eval/src/data_flow/libse.so")
            run_se = dese.process
            run_se.argtypes = [POINTER(c_char), c_int]
            run_se.restype = c_char_p
            STR = (c_char * (len(de_file) + 2))(*bytes(de_file,'utf-8'))
            cast(STR, POINTER(c_char))
            paths = run_se(STR, 0)
            dlclose_func(dese._handle)

            if paths is not None:
                paths = load_from_json(json.loads(paths.decode()), mode)
                save_path = os.path.join(save_to, de_dir_name)
                if not os.path.exists(save_path):
                    os.makedirs(save_path)
                funcname = os.path.splitext(de_file_name)[0]
                with open(os.path.join(save_path, funcname + '.json'), 'w') as f:
                    json.dump(paths, f)

def batch_de_execution_from_csv(csv_path, save_to, mode):
    with open(csv_path, 'r') as f:
        reader = csv.reader(f)
        rows = [row for row in reader]
    for row in rows:
        path = row[0] + '-decompile'
        if not os.path.isdir(path):
            log_err('/home/zrz/decompiler-eval/src/batch/err.csv', row[0])
            continue
        hex_ray_name = os.listdir(path)
        if len(hex_ray_name) == 0:
            log_err('/home/zrz/decompiler-eval/src/batch/err.csv', row[0])
            continue
        hex_ray_path = os.path.join(path, hex_ray_name[0])
        files = os.listdir(hex_ray_path)
        files_copy = files.copy()
        for f in files_copy:
            if f.count('-') != 6 or f.split('-')[-1] == 'others.txt':
                files.remove(f)
        if len(files) == 0:
            log_err('/home/zrz/decompiler-eval/src/batch/err_de.csv', row[0])
            continue
        for filename in files:
            de_file = os.path.join(hex_ray_path, filename)
            print(de_file)
            # try:
            # run cpp
            dese = cdll.LoadLibrary("/home/eval/decompiler-eval/src/data_flow/libse.so")
            run_se = dese.process
            run_se.argtypes = [POINTER(c_char), c_int]
            run_se.restype = c_char_p
            STR = (c_char * (len(de_file) + 1))(*bytes(de_file,'utf-8'))
            cast(STR, POINTER(c_char))
            paths = run_se(STR, 0)
            dlclose_func(dese._handle)

            if paths is not None:
                paths = load_from_json(json.loads(paths.decode()), mode)
                fns = os.path.splitext(filename)[0].split('-')
                funcname = fns[-1]
            
            # remove function name and decompiler name
            while len(fns) > 3:
                fns.pop()

            dir_name = '-'.join(fns)
            dir_path = os.path.join(save_to, dir_name)
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
            with open(os.path.join(dir_path, funcname + '.json'), 'w') as f:
                json.dump(paths, f)
            # except Exception as e:
            #     log_err('/home/zrz/decompiler-eval/src/batch/err_py.csv', de_file)
                    
def batch_de_execution_from_str(des_dir, save_to, mode):
    de_files = os.listdir(des_dir)
    for de_file in de_files:
        de_file_path = os.path.join(des_dir, de_file)
        if os.path.isdir(de_file_path):
            continue
        extract_funcs = ExtractFuncs()
        funcs, funcs_name = extract_funcs.getFuncs(de_file_path)
        print(de_file_path)
        for i in range(len(funcs)):
            func = funcs[i]
            func_name = funcs_name[i]
            print(func_name)
            # run cpp
            dese = cdll.LoadLibrary("/home/eval/decompiler-eval/src/data_flow/libse.so")
            run_se = dese.process
            run_se.argtypes = [POINTER(c_char), c_int]
            run_se.restype = c_char_p
            STR = (c_char * (len(func) + 1))(*bytes(func,'utf-8'))
            cast(STR, POINTER(c_char))
            paths = run_se(STR, 1)
            dlclose_func(dese._handle)
            
            if paths is not None:
                paths = load_from_json(json.loads(paths.decode()), mode)
                save_path = os.path.join(save_to, os.path.splitext(de_file)[0])
                if not os.path.exists(save_path):
                    os.makedirs(save_path)
                with open(os.path.join(save_path, func_name + '.json'), 'w') as f:
                    json.dump(paths, f)
'''
for compiler in ['clang', 'gcc']:
    for opti in ['o0', 'o1', 'o2', 'o3', 'os']:
        f_p = "/home/eval/DF/de/" + compiler + "/ida/" + opti
        s_p = "/home/eval/DF/se/" + compiler + "/ida/" + opti
        batch_de_execution_from_str(f_p, s_p, 0)
'''
batch_de_execution_from_str("/home/eval/DF/de/gcc/ida/os", "/home/eval/DF/se/gcc/ida/os", 0)
# batch_de_execution_from_str("./test", "./test", 1)
# de_file = "/home/eval/POJ/test/c/10-11-11/main.txt"
# de_file = "/home/eval/POJ/test/c/10-1944-1944/main.txt"
# dese = cdll.LoadLibrary("/home/eval/decompiler-eval/src/data_flow/libse.so")
# run_se = dese.process
# run_se.argtypes = [POINTER(c_char), c_int]
# run_se.restype = c_char_p
# STR = (c_char * (len(de_file) + 1))(*bytes(de_file,'utf-8'))
# cast(STR, POINTER(c_char))
# paths = run_se(STR, 0).decode()
# paths = load_from_json(json.loads(paths))
# with open('./out.json', 'w') as f:
#     json.dump(paths, f)
