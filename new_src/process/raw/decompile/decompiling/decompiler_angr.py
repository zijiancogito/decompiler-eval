import sys
import tempfile
from typing import List

import angr
from angr.analyses import CFGFast, Decompiler
from angr.knowledge_plugins import Function

import re
import warnings
warnings.filterwarnings('ignore')

def decompile(binfile, func_filter=r'func0'):
    p = angr.Project(binfile, auto_load_libs=False, load_debug_info=False)
    cfg: CFGFast = p.analyses.CFGFast(
        normalize=True,
        resolve_indirect_jumps=True,
        data_references=True,
    )
    p.analyses.CompleteCallingConventions(
        cfg=cfg.model, recover_variables=True, analyze_callsites=True
    )
    
    funcs_to_decompile: List[Function] = [
        func
        for func in cfg.functions.values()
        if not func.is_plt and not func.is_simprocedure and not func.alignment and re.match(func_filter, func.name)
    ]
    
    decompiler_funcs = {}
    for func in funcs_to_decompile:
        if not re.match(func_filter, func.name):
            continue
        try:
            decompiler: Decompiler = p.analyses.Decompiler(func, cfg=cfg.model)
            
            if decompiler.codegen is None:
                decompiler_funcs[func.name] = f"// No decompilation output for function {func.name}\n"
                # print(f"// No decompilation output for function {func.name}\n")
                continue
            decompiler_funcs[func.name] = decompiler.codegen.text
            # print(decompiler.codegen.text)
        except Exception as e:
            decompiler_funcs[func.name] = f"Exception thrown decompiling function {func.name}: {e}"
            # print(f"Exception thrown decompiling function {func.name}: {e}")
    
    decompiler_outputs = ""
    for func in decompiler_funcs:
        decompiler_outputs = decompiler_outputs + f"{decompiler_funcs[func]}\n\n"
            
    return decompiler_outputs
            


if __name__ == '__main__':
    outputs = decompile(sys.argv[1], r'func[0-9]+')
    print(outputs)