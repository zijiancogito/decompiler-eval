import angr, monkeyhex
import claripy

proj = angr.Project("test", auto_load_libs=False)
proj.cfg = proj.analyses.CFGFast(normalize=True)
proj.funcs = proj.cfg.kb.functions

# map from addr to block
proj.block_map = {}
for func in proj.funcs.values():
    for blk in func.blocks:
        proj.block_map[blk.addr] = blk

# init function arg register
proj.func_calling_regs = []

proj.analysis_funcs = [
        f_addr for f_addr in proj.funcs
        if 'sub' not in proj.funcs[f_addr].name
        and '$' not in proj.funcs[f_addr].name
]


add_options = set()
# Set track=True for making claripy Solvers; enable use of unsat_core
add_options.add(angr.sim_options.CONSTRAINT_TRACKING_IN_SOLVER)
remove_options = set()

# init entry state
# entry_addr =  # addr of your function
# prologue_end_addr = # addr of function end
# entry_state = proj.factory.blank_state(addr=func_addr,
#                                       add_options=add_options,
#                                       remove_options=remove_options)
entry_state = proj.factory.entry_state(add_options=add_options, remove_options=remove_options)
entry_state.solver._solver.timeout = 500



simgr = proj.factory.simgr(entry_state)
print("Begin to execute")
while True:
    state = simgr.active[0]
    print(state.inspect.expr)
    print(simgr.active)
    simgr.step(num_inst=1)
    if not simgr.active:
        break
solver = None
if simgr.unconstrained:
    solver = simgr.unconstrained[0].solver
elif simgr.deadended:
    solver = simgr.deadended[0].solver
assert (solver is not None)
print(solver)
