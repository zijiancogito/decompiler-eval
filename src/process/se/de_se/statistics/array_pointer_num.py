import csv
import os
from tree_sitter import Language, Parser, TreeCursor, Node

C_LANGUAGE = Language('./build/tree-sitter.so', 'c')

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
        pointer_num = 0
        for com in coms:
            for opt in opts:
                for i in range(1000):
                    file_name = f'{ROOT}/{com}/{opt}/{decom}/{i}.c'
                    json_name = f'{SEROOT}/{com}/{opt}/{decom}/{i}.json'
                    if not os.path.exists(json_name): continue
                    src = read_src(file_name)
                    tree = parser.parse(src.encode('utf-8'))
                    root_node = tree.root_node
                    cursor = root_node.walk()
                    all_dec_nodes = []
                    need_dec_nodes = []
                    make_move(cursor, all_dec_nodes, "declaration")
                    for id_node in all_dec_nodes:
                        type_node = id_node.child_by_field_name("type")
                        type_cnt = get_content(type_node, src)
                        if type_cnt in ["void", "undefined"]:
                            need_dec_nodes.append(id_node)
                            continue
                        cursor = id_node.walk()
                        arr_or_pointers = []
                        make_move(cursor, arr_or_pointers, "array_declarator")
                        make_move(cursor, arr_or_pointers, "pointer_declarator")
                        if len(arr_or_pointers) > 0:
                            need_dec_nodes.append(id_node)
                    
                    num += len(need_dec_nodes)

        print(f'{decom}: {num}')
