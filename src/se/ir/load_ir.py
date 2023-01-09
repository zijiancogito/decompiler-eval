import sys
sys.path.append('../utils')
sys.path.append('.')
import utils
from ctypes import CFUNCTYPE, c_double
import llvmlite.binding as llvm
import re

from execution import find_input_variables, find_output_variables
from execution import execution_block

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

class IRcfg:
    def __init__(self):
        self.entry = None
        self.exit = None
        self.cfg_forward = {}
        self.cfg_backward = {}
        self.paths = []
        self.idx2ver = {}
        self.ver2idx= {}
        self.vertices = 0

    def vertice_to_index(self, vertice):
        return self.ver2idx[vertice]

    def index_to_vertice(self, index):
        # return vertices
        return self.idx2ver(index)

    def set_entry(self, entry):
        self.entry = entry

    def set_exit(self, exit):
        self.exit = exit

    def add_vertice(self, vertice):
        if vertice not in self.ver2idx:
            self.idx2ver[self.vertices] = vertice
            self.ver2idx[vertice] = self.vertices
            self.vertices += 1

    def add_edge(self, current, successor):
        if current in self.cfg_forward:
            self.cfg_forward[current].append(successor)
        else:
            self.cfg_forward[current] = [successor]

        if successor in self.cfg_backward:
            self.cfg_backward[successor].append(current)
        else:
            self.cfg_backward[successor] = [current]

    def find_path_u2d(self, u, d, visited, path):
        if visited[u] == True:
            path.append(u)
            if u != d:
                for i in self.cfg_forward[u]:
                    if visited[i] == False:
                        self.find_path_u2d(i, d, visited, path)
            else:
                tmp = [i for i in path]
                self.paths.append(tmp)
        else:                
            visited[u] = True
            path.append(u)

            if u != d:
                for i in self.cfg_forward[u]:
                    self.find_path_u2d(i, d, visited, path)
            else:
                tmp = [i for i in path]
                self.paths.append(tmp)

        path.pop()
        visited[u] = False

    def find_all_path(self):
        visited = [False] * self.vertices
        path = []
        print(f"Entry: {self.entry}")
        print(f"Exit: {self.exit}")
        self.find_path_u2d(self.entry, self.exit, visited, path)


def read_ir(path):
    ir = None
    with open(path, 'r') as r:
        ir = r.read()
    return ir

def get_label_of_block(block):
    pattern = "[\s]+([0-9]+):[\S\s]+"
    match = re.match(pattern, str(block))
    if match:
        return int(match.group(1))
    else:
        return 0

def parse_jump_instruction(instruction):
    pattern = "label %([0-9]+)"
    find = re.findall(pattern, str(instruction))
    findi = []
    for i in find:
        findi.append(int(i))
    return findi

def build_cfg(function):
    print(function.name)
    cfg = IRcfg()
    last_block = None
    first_block = None
    # add vertices
    cnt = 0
    for block in function.blocks:
        label = get_label_of_block(block)
        if cnt == 0:
            first_block = label
        cfg.add_vertice(label)
        cnt += 1
        last_block = label

    cfg.set_entry(cfg.ver2idx[first_block])
    cfg.set_exit(cfg.ver2idx[last_block])
    
    # add edges
    for block in function.blocks:
        label = get_label_of_block(block)
        last_insn = None
        for insn in block.instructions:
            last_insn = insn
        if last_insn.opcode == 'br':
            jump_to = parse_jump_instruction(last_insn)
            for addr in jump_to:
                cfg.add_edge(cfg.ver2idx[label], cfg.ver2idx[addr])

    cfg.find_all_path()
    return cfg

def symbolic_execution(function):
    cfg = build_cfg(function)
    blks = function.blocks
    blks_dict = {}
    for blk in blks:
        label = get_label_of_block(blk)
        blks_dict[label] = blk
    
    input_symbols = find_input_variables(function)
    output_symbols = find_output_variables(function)
    print(input_symbols)
    print(output_symbols)

    tmp_dict = {}
    for path in cfg.paths:
        for ver in path:
            label =  cfg.idx2ver[ver]
            block = blks_dict[label]
            # TODO
            execution_block(block, tmp_dict)

def process_functions(llvm_ir):
    mod = llvm.parse_assembly(llvm_ir)
    mod.verify()

    for function in mod.functions:
        if function.name in utils.compiler_generated_funcs:
            continue
        if function.name in utils.syscall_funcs:
            continue
        symbolic_execution(function)

llvm_ir = read_ir("../616.ll")
process_functions(llvm_ir)
    
