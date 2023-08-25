import csv
import os
from tree_sitter import Language, Parser, TreeCursor, Node

C_LANGUAGE = Language('./build/tree-sitter.so', 'c')

UNNECESSARY = [
    "(int)", "(int *)", "(uint)", "(uint *)", "(long)", "(long *)", "(ulong)", "(ulong *)", "(char)", "(char *)", "(double)", "(double *)", "(float)", "(float *)",
    "(__int8)", "(__int16)", "(__int32)", "(__int64)", "(__int128)", "(undefined4)", "(undefined8)", "(signed int)", "(signed int *)", "(signed long)", "(signed long *)",
    "(signed __int8)", "(signed __int16)", "(signed __int32)", "(signed __int64)", "(signed __int128)", "(unsigned int)", "(unsigned int *)", "(unsigned long)", "(unsigned long *)", "  [16]",
    "(unsigned __int8)", "(unsigned __int16)", "(unsigned __int32)", "(unsigned __int64)", "(unsigned __int128)", "(undefined  [8])", "(undefined  [16])", "(undefined  [32])", "(undefined  [64])",
    "(_QWORD)", "(_QWORD *)", "(_DWORD)", "(_DWORD *)", "(_WORD)", "(_WORD *)", "(_BYTE)", "(_BYTE *)", "(__m128)", "(word32)", "(word64)", "DWORD1", "DWORD2",
    "LOBYTE", "HIBYTE", "LOWORD", "HIWORD", "LODWORD", "HIDWORD", "LOQWORD", "HIQWORD",
    "& 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff", "& 0xffffffffffffffffffffffffffffffff", "& 0xffffffffffffffff", "& 0xffffffff",
    "__stdcall", "__fastcall", "__cdecl", "__thiscall", "__noreturn", "__spoils<rdx,rcx,r8,r9,r10,r11,xmm4,xmm5>",
]

def pre_process(func: str)-> str:
    for string in UNNECESSARY:
        func = func.replace(string, '')
    return func

def get_content(node: Node, source: str) -> str:
    start = node.start_byte
    end = node.end_byte
    return source[start: end]

def make_move(cursor: TreeCursor, all_nodes: list, node_filter: str):
    move_flag = 0
    while True:
        currentNode = cursor.node
        if move_flag == 0:
            if currentNode.type == node_filter or node_filter == '':
                all_nodes.append(currentNode)
            if cursor.goto_first_child():
                move_flag = 0
                continue
            elif cursor.goto_next_sibling():
                move_flag = 0
                continue
            elif cursor.goto_parent():
                move_flag = 1
                continue

        elif move_flag == 1:
            if cursor.goto_next_sibling():
                move_flag = 0
                continue
            elif cursor.goto_parent():
                move_flag = 1
                continue
        break

def read_src(src_path):
    ret = ''
    with open(src_path) as f:
        ret = f.read()
    return ret

def record(path, cnt):
    with open(path, 'a') as f:
        writer = csv.writer(f)
        writer.writerow(cnt)

if __name__ == "__main__":
    parser = Parser()
    parser.set_language(C_LANGUAGE)
    ROOT = '/home/eval/data/DSMITH/process/de1'
    SEROOT = '/home/eval/data/DSMITH/se-sample/de1'
    decoms = ['BinaryNinja', 'Hex-Rays', 'Ghidra', 'RetDec']
    coms = ['clang', 'gcc']
    opts = ['o0', 'o1', 'o2', 'o3', 'os']
    for decom in decoms:
        num = 0
        for com in coms:
            for opt in opts:
                for i in range(1000):
                    file_name = f'{ROOT}/{com}/{opt}/{decom}/{i}.c'
                    json_name = f'{SEROOT}/{com}/{opt}/{decom}/{i}.json'
                    if not os.path.exists(json_name): continue
                    src = read_src(file_name)
                    src = pre_process(src)
                    tree = parser.parse(src.encode('utf-8'))
                    root_node = tree.root_node
                    cursor = root_node.walk()
                    func_nodes = []
                    make_move(cursor, func_nodes, "call_expression")
                    for func_node in func_nodes:
                        func_name_node = func_node.child_by_field_name("function")
                        func_name = get_content(func_name_node, src)
                        if "f_rand_" in func_name:
                            args_node = func_node.child_by_field_name("arguments")
                            args_cnt = get_content(args_node, src)
                            if args_cnt != "()":
                                num += 1
                        elif "printf" in func_name:
                            args_node = func_node.child_by_field_name("arguments")
                            is_normal = False
                            for arg_node in args_node.children:
                                if arg_node.type == "string_literal":
                                    is_normal = True
                                    break
                            if not is_normal:
                                num += 1

        print(f'{decom}: {num}')
