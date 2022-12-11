import angr
import claripy
import sys
sys.path.append('.')

from branch_type import Branch

class AST:
    def __init__(self, proj, func_addr, time_out=500):
        self.proj = proj
        self.func_addr = func_addr
        self.time_out = time_out

    def _init_args_registers(self, state):
        # symbolic args in registers
        # linux rdi, rsi, rdx, rcx, r8, r9
        # TODO: only init used registers
        # TODO: args in stack

        p0 = claripy.BVS('p0', 64)
        p1 = claripy.BVS('p1', 64)
        p2 = claripy.BVS('p2', 64)
        p3 = claripy.BVS('p3', 64)
        p4 = claripy.BVS('p4', 64)
        p5 = claripy.BVS('p5', 64)
    
        state.regs.rdi = p0
        state.regs.rsi = p1
        state.regs.rdx = p2
        state.regs.rcx = p3
        state.regs.r8 = p4
        state.regs.r9 = p5

    def extract_ast(self):
        assert (self.func_addr in self.proj.funcs)
    
        start_addr = self.func_addr
    
        add_options = set()
        # add your options here
        # add_options.add(angr.sim_options.CONSTRAINT_TRACKING_IN_SOLVER)

        remove_options = set()
        # remove options here

        entry_state = self.proj.factory.blank_state(
                addr=start_addr,
                add_options=add_options,
                remove_options=remove_options)
    
        # init registers with args
        self._init_args_registers(entry_state)
        
        for addr, length in self.proj.hook_points[self.func_addr]:
            @self.proj.hook(addr, length=length)
            def my_hook(state):
                ret = claripy.BVS(f"func_{hex(state.addr)}", 32)
                state.regs.eax = ret

        simgr = self.proj.factory.simulation_manager(entry_state)

        # simgr.explore(find=self.proj.exit_points[self.func_addr]) 
        
        state = entry_state

        print(f"Function {hex(self.func_addr)}")
        visited = {}
        
        tech = angr.exploration_techniques.loop_seer.LoopSeer(bound=1)
        simgr.use_technique(tech)
        # simgr.explore()
        
        while True:
            if len(simgr.active) < 1:
                break
           #  
            #  visited_all_succ_states = True
            # for s in simgr.active:
                # if s.addr not in visited:
                    # state = s
                    # visited[s.addr] = 1
                    # print(f"\t{len(simgr.active)} \
                            # \t{hex(state.addr)}")
                    # break
            for s in simgr.active:
                print(f"\t{hex(s.addr)}")
            simgr.step(num_inst=1)
            
        
    def _pretty_print_debug(self, state):
        print(f"POS:\t{hex(state.addr)}")
        print(f"EAX:\t{state.regs.eax}")
        print(f"RBP:\t{state.regs.rbp}")
        print(f"MEM(RBP-0x4):\t{state.mem[state.regs.rbp-0x4].uint32_t.resolved}")
        # print(f"MEM(RBP-0x24):\t{state.mem[state.regs.rbp-0x24].uint32_t.resolved}")
        # print(f"MEM(RBP-0x20):\t{state.mem[state.regs.rbp-0x20].uint32_t.resolved}")


