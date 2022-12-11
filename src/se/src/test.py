import sys
sys.path.append('.')
import load
import angr
import claripy

# test load() in load.py
print("Test load() in load.py")
proj = load.load('../random1')

add_options = set()
add_options.add(angr.sim_options.CONSTRAINT_TRACKING_IN_SOLVER)
remove_options = set()

# main_input_x = claripy.BVS('main_x', 64)
# main_input_y = claripy.BVS('main_y', 64)
# 
# sum_args_x = claripy.BVS('sum_x', 64)
# sum_args_y = claripy.BVS('sum_y', 64)


func_addr = proj.analysis_funcs[0]

start_addr = func_addr + (0x11c6-0x1189)
print(hex(start_addr))
entry_state = proj.factory.blank_state(
                  addr=start_addr, 
                  add_options=add_options,
                  remove_options=remove_options)

padding_size = 16
entry_state.stack_push(entry_state.regs.rbp)
entry_state.regs.rbp = entry_state.regs.rsp

entry_state.regs.rsp -= padding_size


main_input_x = claripy.BVS("l_2", 32)
main_input_y = claripy.BVS("l_3", 32)


entry_state.mem[entry_state.regs.rsp].int32_t = main_input_x
entry_state.mem[entry_state.regs.rsp+0x4].int32_t = main_input_y
#entry_state.stack_push(main_input_x)
#entry_state.stack_push(main_input_y)

# main_input_y = 10 - main_input_x 


simgr = proj.factory.simulation_manager(
                  entry_state)

def is_successful(state):
    stdout_output = state.posix.dumps(1)
    return b'Success' in stdout_output

def should_abort(state):
    stdout_output = state.posix.dumps(1)
    return b'Fail' in stdout_output
    
# simgr.explore(find=is_successful, avoid=should_abort)

# if simgr.found:
 #    solution_state = simgr.found[0]
  #   sol0 = solution_state.solver.eval(main_input_x)
   #  sol1 = solution_state.solver.eval(main_input_y)

    # print(sol0, sol1)


import pdb
state = entry_state
while True:
    succ = state.step()
    state = succ.successors[0]
    print(state.regs.edx)
    pdb.set_trace()

