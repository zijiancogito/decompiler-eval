import csv
import os
from tree_sitter import Language, Parser, TreeCursor

C_LANGUAGE = Language('./build/tree-sitter.so', 'c')

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
    decoms = ['BinaryNinja', 'Hex-Rays', 'Ghidra', 'RetDec']
    coms = ['clang', 'gcc']
    opts = ['o0', 'o1', 'o2', 'o3', 'os']
    save_to = "/home/eval/data/DSMITH/analyze/no-return"
    if os.path.exists(save_to):
        os.system(f'rm -r {save_to}')
    os.makedirs(save_to)
    decom_map = {}
    for decom in decoms:
        com_map = {}
        for com in coms:
            opt_map = {}
            for opt in opts:
                num = 0
                for i in range(1000):
                    src = read_src(f'{ROOT}/{com}/{opt}/{decom}/{i}.c')
                    tree = parser.parse(src.encode('utf-8'))
                    root_node = tree.root_node
                    cursor = root_node.walk()
                    all_nodes = []
                    make_move(cursor, all_nodes, "return_statement")
                    if len(all_nodes) == 0:
                        num += 1
                        cnt = [f'{ROOT}/{com}/{opt}/{decom}/{i}.c']
                        if not os.path.exists(f'{save_to}/{decom}/{com}/{opt}'):
                            os.makedirs(f'{save_to}/{decom}/{com}/{opt}')
                        record(f'{save_to}/{decom}/{com}/{opt}/no-return.csv', cnt)
                opt_map[opt] = num
            com_map[com] = opt_map
        decom_map[decom] = com_map

    print(33*'-' + 'clang' + 33*'-')
    print("Optimization\t|BinaryNinja\t|Ghidra\t\t|Hex-Rays\t|RetDec")
    for opt in opts:
        print(f"{opt}\t\t{decom_map['BinaryNinja']['clang'][opt]}\t\t{decom_map['Ghidra']['clang'][opt]}\t\t{decom_map['Hex-Rays']['clang'][opt]}\t\t{decom_map['RetDec']['clang'][opt]}")

    print()
    print(33*'-' + ' gcc ' + 33*'-')
    print("Optimization\t|BinaryNinja\t|Ghidra\t\t|Hex-Rays\t|RetDec")
    for opt in opts:
        print(f"{opt}\t\t{decom_map['BinaryNinja']['gcc'][opt]}\t\t{decom_map['Ghidra']['gcc'][opt]}\t\t{decom_map['Hex-Rays']['gcc'][opt]}\t\t{decom_map['RetDec']['gcc'][opt]}")
