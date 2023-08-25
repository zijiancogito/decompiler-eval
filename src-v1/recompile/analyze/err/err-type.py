import os
import re
import copy
import argparse

from tqdm import tqdm

import sys
sys.path.append('../../../utils/functools')
import log

 # elif re.fullmatch(r'([\S]*Var[0-9]+)|([\_]*local\_[\S]+)|(undefined[0-9]+)|(v[0-9]+)|(r[0-9]+)|(data\_[0-9]+)|(var\_[0-9]+)|(zmm[0-9]+)|([\_]*DAT\_[0-9]+)|([\S]*Stack\_[0-9]+)|(\_[a-z])|([\_]*completed\_[0-9]+)|(\_fini)|([\_]*end)|(\_s[\_t]+[0-9]+)|([\_]*start)|([a-z][0-9]*)|([\S]*Stack\_[a-z]+)|(ctr[0-9]+)|(count)|([a-zA-Z][xy]*)|(extraout\_[\S]+)|(in\_[\S]+)|(out\_[\S]+)|(stack0x[0-9a-e]+)|(chars_printed)|(len[0-9]*)|(mem[0-9]*)|(nmemb[0-9]*)|(putc\_rc)|(putchar\_rc)|(powl)|(result[0-9]*)|(str[0-9]*)|(stream[0-9]*)|(strcmp\_[\S]+)|(substr\_[\S]+)|(size)|(set\_mem[0-9]*)|([er][a-d]x[\S]*)|([er]di[\S]*)|(DiJiTian)|(NIXU)', token):

def token_type(token):
    if re.fullmatch(r'lab\_[\s\S]+|(\_\_saved\_rbp)|', token):
        return 'label'
    elif re.fullmatch(r'true|false|NULL', token):
        return 'constant'
    elif re.fullmatch(r'([\s\S]+\*[\s\S]*)', token):
        return 'pointer_type'
    elif re.fullmatch(r'void|([\_]*[u]*int[0-9]+\_t)|(unsigned long)|char|double|int|(unsigned int)|(long[\s]*[\S\s]*)|(long double)|bool|byte|(float[0-9]*[\_]*[t]*)|(uint64\_t)|(struct [\S\s]+)|(int[0-9]*[\_]*[t]* \([\S\s]*\))|(unsigned long[\S\s]*)|(uint[0-9]*)|(ulong[0-9]*)|(undefined)|(\_\_m128[id]*)', token):
        return 'data_type'
    elif re.fullmatch(r'(\_TBYTE)|(\_OWORD)|(BYTE)|(\_\_int128)|(int[0-9]*)|(size\_t)|([u]*int[0-9]*\_t \([\S\s]*\))', token):
        return 'data_type'
    elif re.fullmatch(r'[\S\s]+\[[0-9]+\]', token):
        return 'array_type'
    elif re.fullmatch(r'break', token):
        return 'break_stmt'
    elif re.fullmatch(r'for', token):
        return 'for_stmt'
    elif re.fullmatch(r'case', token):
        return 'case_stmt'
    elif re.fullmatch(r'[\)\(\;\[\]]|(\_1)|\:', token):
        return 'syntax_identifier'
    elif re.fullmatch(r'\<[\S\s]+\>', token):
        return 'function_type'
    # elif re.fullmatch(r'([\S]*Var[0-9]+)|([\_]*local\_[\S]+)|(undefined[0-9]+)|(v[0-9]+)|(r[0-9]+)|(data\_[0-9]+)|(var\_[0-9]+)|(zmm[0-9]+)|([\_]*DAT\_[0-9]+)|([\S]*Stack\_[0-9]+)|(\_[a-z])|([\_]*completed\_[0-9]+)|(\_fini)|([\_]*end)|(\_s[\_t]+[0-9]+)|([\_]*start)|([a-z][0-9]*)|([\S]*Stack\_[a-z]+)|(ctr[0-9]+)|(count)|([a-zA-Z][xy]*)|(extraout\_[\S]+)|(in\_[\S]+)|(out\_[\S]+)|(stack0x[0-9a-e]+)|(chars_printed)|(len[0-9]*)|(mem[0-9]*)|(nmemb[0-9]*)|(putc\_rc)|(putchar\_rc)|(powl)|(result[0-9]*)|(str[0-9]*)|(stream[0-9]*)|(strcmp\_[\S]+)|(substr\_[\S]+)|(size)|(set\_mem[0-9]*)|([er][a-d]x[\S]*)|([er]di[\S]*)|(DiJiTian)|(NIXU)|(dis)', token):
        # return 'function_or_variable_identifier'
    else:
        return 'function_or_variable_identifier'

def err_msg_parser(err_msg: str):
    tokens = re.findall(r"\'([^\']+)\'", err_msg)
    msg_with_tok = err_msg
    msg_without_tok = err_msg
    token_types = {}
    for idx, tok in enumerate(tokens):
        rep = token_type(tok)
        if rep in token_types:
            token_types[rep].append(tok)
        else:
            token_types[rep] = [tok]
        msg_with_tok = msg_with_tok.replace(f"'{tok}'", f"{rep.upper()}_{idx}")
        msg_without_tok = msg_without_tok.replace(f"'{tok}'", 'TOK')

    return msg_with_tok, msg_without_tok, token_types

def check_file(path):
    msg_without_tok_dict = {}
    msg_with_tok_dict = {}
    token_types = {}
    with open(path, 'r') as f:
        msgs = f.readlines()
        for msg in msgs:
            msgs_with_tok, msgs_without_tok, tok_types = err_msg_parser(msg.strip())
            if msgs_with_tok in msg_with_tok_dict:
                msg_with_tok_dict[msgs_with_tok] += 1
            else:
                msg_with_tok_dict[msgs_with_tok] = 1
            if msgs_without_tok in msg_without_tok_dict:
                msg_without_tok_dict[msgs_without_tok] += 1
            else:
                msg_without_tok_dict[msgs_without_tok] = 1
            for t in tok_types:
                if t in token_types:
                    token_types[t].extend(copy.deepcopy(tok_types[t]))
                else:
                    token_types[t] = copy.deepcopy(tok_types[t])
    for t in token_types:
        token_types[t] = list(set(token_types[t]))
        
    return msg_without_tok_dict, msg_with_tok_dict, token_types

def list_files_for_each_err_type(err_msg_for_each_dec_dir, 
                                 log_dir,
                                 compilers, 
                                 optimizations, 
                                 decompilers):
    for decompiler in decompilers:
        total_without_tok_dict = {}
        total_with_tok_dict = {}
        # total_log1_path = os.path.join(log_dir, f"msgs-without-tok-{decompiler}.csv")
        # total_log2_path = os.path.join(log_dir, f"msgs-with-tok-{decompiler}.csv")
        for compiler in compilers:
            for opt in optimizations:
                err_sub_dir = os.path.join(err_msg_for_each_dec_dir, decompiler, compiler, opt)
                log_sub_dir = os.path.join(log_dir, decompiler, compiler, opt)
                if not os.path.exists(log_sub_dir):
                    os.makedirs(log_sub_dir)
                dec_log_dirs = os.listdir(err_sub_dir)
                without_tok_dict = {}
                with_tok_dict = {}

                for dec_sub_dir in tqdm(dec_log_dirs, desc=f"{decompiler}-{compiler}-{opt}"):
                    dec_log_dir = os.path.join(err_sub_dir, dec_sub_dir)
                    err_without_tok_path = os.path.join(dec_log_dir, "msgs-without-tok.csv")
                    err_with_tok_path = os.path.join(dec_log_dir, 'msgs-with-tok.csv')
                    # token_types_path = os.path.join(dec_log_dir, "token-types.csv")

                    with open(err_without_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            if msg in without_tok_dict:
                                without_tok_dict[msg].append(dec_sub_dir)
                            else:
                                without_tok_dict[msg] = [dec_sub_dir]
                            if msg in total_without_tok_dict:
                                total_without_tok_dict[msg].append(dec_sub_dir)
                            else:
                                total_without_tok_dict[msg] = [dec_sub_dir]
                    with open(err_with_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            if msg in with_tok_dict:
                                with_tok_dict[msg] += 1
                            else:
                                with_tok_dict[msg] = 1
                            if msg in total_with_tok_dict:
                                total_with_tok_dict[msg] += 1
                            else:
                                total_with_tok_dict[msg] = 1
                log1_path = os.path.join(log_sub_dir, "msgs-without-tok.csv")
                log2_path = os.path.join(log_sub_dir, "msgs-with-tok.csv")
                log.log_dict2file(without_tok_dict, log1_path)
                log.log_dict2file(with_tok_dict, log2_path)
        # log.log_dict2file(total_without_tok_dict, total_log1_path)
        # log.log_dict2file(total_with_tok_dict, total_log2_path)

def count_files_for_each_err(err_msg_for_each_dec_dir, 
                             log_dir,
                             compilers, 
                             optimizations, 
                             decompilers):
    for decompiler in decompilers:
        total_without_tok_dict = {}
        total_with_tok_dict = {}
        total_log1_path = os.path.join(log_dir, f"msgs-without-tok-{decompiler}.csv")
        total_log2_path = os.path.join(log_dir, f"msgs-with-tok-{decompiler}.csv")
        for compiler in compilers:
            for opt in optimizations:
                err_sub_dir = os.path.join(err_msg_for_each_dec_dir, decompiler, compiler, opt)
                log_sub_dir = os.path.join(log_dir, decompiler, compiler, opt)
                if not os.path.exists(log_sub_dir):
                    os.makedirs(log_sub_dir)
                dec_log_dirs = os.listdir(err_sub_dir)
                without_tok_dict = {}
                with_tok_dict = {}

                for dec_sub_dir in tqdm(dec_log_dirs, desc=f"{decompiler}-{compiler}-{opt}"):
                    dec_log_dir = os.path.join(err_sub_dir, dec_sub_dir)
                    err_without_tok_path = os.path.join(dec_log_dir, "msgs-without-tok.csv")
                    err_with_tok_path = os.path.join(dec_log_dir, 'msgs-with-tok.csv')
                    # token_types_path = os.path.join(dec_log_dir, "token-types.csv")

                    with open(err_without_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            if msg in without_tok_dict:
                                without_tok_dict[msg] += 1
                            else:
                                without_tok_dict[msg] = 1
                            if msg in total_without_tok_dict:
                                total_without_tok_dict[msg] += 1
                            else:
                                total_without_tok_dict[msg] = 1
                    with open(err_with_tok_path, 'r') as f:
                        lines = f.readlines()
                        for l in lines:
                            msg = l.split('\t')[0]
                            if msg in with_tok_dict:
                                with_tok_dict[msg] += 1
                            else:
                                with_tok_dict[msg] = 1
                            if msg in total_with_tok_dict:
                                total_with_tok_dict[msg] += 1
                            else:
                                total_with_tok_dict[msg] = 1
                log1_path = os.path.join(log_sub_dir, "msgs-without-tok.csv")
                log2_path = os.path.join(log_sub_dir, "msgs-with-tok.csv")
                log.log_dict2file(without_tok_dict, log1_path)
                log.log_dict2file(with_tok_dict, log2_path)
        log.log_dict2file(total_without_tok_dict, total_log1_path)
        log.log_dict2file(total_with_tok_dict, total_log2_path)

def summarize_errs_for_decompiler(err_log_dir, msg_log_dir, decompilers):
    for decompiler in decompilers:
        path = os.path.join(err_log_dir, f"raw-compile-err-{decompiler}.csv")
        msgs_without_tok, msgs_with_tok, token_types = check_file(path)

        sub_dir = os.path.join(msg_log_dir, decompiler)
        if not os.path.exists(sub_dir):
            os.makedirs(sub_dir)
        
        msgs_without_tok_path = os.path.join(sub_dir, f"msgs-without-tok.csv")
        msgs_with_tok_path = os.path.join(sub_dir, f"msgs-with-tok.csv")
        token_types_path = os.path.join(sub_dir, f"token-types.csv")
        
        log.log_dict2file(msgs_without_tok, msgs_without_tok_path)
        log.log_dict2file(msgs_with_tok, msgs_with_tok_path)
        log.log_dict2file(token_types, token_types_path)

def get_err_type(err_msg: str):
    tokens = re.findall(r"\'([^\']+)\'", err_msg)
    msg_without_tok = err_msg
    for tok in tokens:
        msg_without_tok = msg_without_tok.replace(f"'{tok}'", 'TOK')

    return msg_without_tok

def class_errs(path):
    errs_dict = {}
    with open(path, 'r') as f:
        msgs = f.readlines()
        for msg in tqdm(msgs):
            err_type = get_err_type(msg.strip())
            if err_type in errs_dict:
                errs_dict[err_type].append(msg)
            else:
                errs_dict[err_type] = [msg]
        
    # for k in errs_dict:
        # errs_dict[k] = list(set(errs_dict[k]))
    return errs_dict

def class_errs_for_decompiler(raw_msg_dir, save_dir, decompilers):
    for decompiler in decompilers:
        path = os.path.join(raw_msg_dir, f"raw-compile-err-{decompiler}.csv")
        errs_dict = class_errs(path)
        save_sub_dir = os.path.join(save_dir, decompiler)
        if not os.path.exists(save_sub_dir):
            os.makedirs(save_sub_dir)

        err_tps = list(errs_dict.keys())
        err_tps.sort()

        list_path = os.path.join(save_sub_dir, "errs-list.log")
        with open(list_path, 'w') as lf:
            lf.writelines([f"{l}\n" for l in err_tps])

        for idx, err_tp in enumerate(err_tps):
            raw_err_path = os.path.join(save_sub_dir, f"err-{idx}.log")
            with open(raw_err_path, 'w') as f:
                for l in list(set(errs_dict[err_tp])):
                    f.write(l)
                    f.write('\n')
        
def summarize_errs_for_each_src(err_log_dir, msg_log_dir, compilers, optimizations, decompilers):
    for decompiler in decompilers:
        for compiler in compilers:
            for opt in optimizations:
                err_sub_dir = os.path.join(err_log_dir, decompiler, compiler, opt)
                
                log_sub_dir = os.path.join(msg_log_dir, decompiler, compiler, opt)
                if not os.path.exists(log_sub_dir):
                    os.makedirs(log_sub_dir)
                
                dec_log_files = os.listdir(err_sub_dir)
                for dec_log in tqdm(dec_log_files, desc=f"{decompiler}-{compiler}-{opt}"):
                    err_path = os.path.join(err_sub_dir, dec_log)
                    msgs_without_tok, msgs_with_tok, token_types = check_file(err_path)
                    
                    dec_sub_dir = os.path.join(log_sub_dir, dec_log.split('.')[0])
                    if not os.path.exists(dec_sub_dir):
                        os.makedirs(dec_sub_dir)
                    log_1_path = os.path.join(dec_sub_dir, "msgs-without-tok.csv")
                    log_2_path = os.path.join(dec_sub_dir, "msgs-with-tok.csv")
                    log_3_path = os.path.join(dec_sub_dir, "token-types.csv")
                    log.log_dict2file(msgs_without_tok, log_1_path)
                    log.log_dict2file(msgs_with_tok, log_2_path)
                    log.log_dict2file(token_types, log_3_path)

def summarize_all_errs(file_cnt_dir, log_dir, decompilers):
    errs_without_tok = {}
    errs_with_tok = {}
    for decompiler in decompilers:
        log1_path = os.path.join(file_cnt_dir, f"msgs-without-tok-{decompiler}.csv")
        log2_path = os.path.join(file_cnt_dir, f"msgs-with-tok-{decompiler}.csv")
        with open(log1_path, 'r') as f:
            lines = f.readlines()
            for l in lines:
                msg = l.split('\t')[0]
                if msg in errs_without_tok:
                    errs_without_tok[msg].append(decompiler)
                else:
                    errs_without_tok[msg] = [decompiler]
        with open(log2_path, 'r') as f:
            lines = f.readlines()
            for l in lines:
                msg = l.split('\t')[0]
                if msg in errs_with_tok:
                    errs_with_tok[msg].append(decompiler)
                else:
                    errs_with_tok[msg] = [decompiler]
    log_without_tok_path = os.path.join(log_dir, "errs_without_tok_total.csv")
    log_with_tok_path = os.path.join(log_dir, "errs_with_tok_total.csv")
    log.log_dict2file(errs_without_tok, log_without_tok_path)
    log.log_dict2file(errs_with_tok, log_with_tok_path)
            


def test():
    root_dir = '/home/eval/data/POJ/recompile/round-1/raw-compilation-msg'

    path = os.path.join(root_dir, f"raw-compile-err-BinaryNinja.csv")
    check_file(path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='err-type.py')

    parser.add_argument('-e', '--err-msg-dir', type=str, help='dir of DEC')
    parser.add_argument('-s', '--msg-save-dir', type=str, help='log dir')
    parser.add_argument('-o', '--option', choices=['all', 'file', 'debug', 'count', 'summarize', 'reverse', 'class'], help='')
    parser.add_argument('-D', '--decompilers', nargs='+', help='log dir')
    parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
    parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

    args = parser.parse_args()
    
    if args.option == 'all':
        summarize_errs_for_decompiler(args.err_msg_dir, args.msg_save_dir, args.decompilers)
    elif args.option == 'debug':
        test()
    elif args.option == 'file':
        summarize_errs_for_each_src(args.err_msg_dir, args.msg_save_dir, args.compilers, args.optimizations, args.decompilers)
    elif args.option == 'count':
        count_files_for_each_err(args.err_msg_dir, args.msg_save_dir, args.compilers, args.optimizations, args.decompilers)
    elif args.option == 'summarize':
        summarize_all_errs(args.err_msg_dir, args.msg_save_dir, args.decompilers)
    elif args.option == 'reverse':
        list_files_for_each_err_type(args.err_msg_dir, args.msg_save_dir, args.compilers, args.optimizations, args.decompilers)
    elif args.option == 'class':
        class_errs_for_decompiler(args.err_msg_dir, args.msg_save_dir, args.decompilers)