import html
import os
import sys
import re

import binaryninja
from binaryninja import lineardisassembly
from binaryninja.function import DisassemblySettings
from binaryninja.enums import DisassemblyOption, LinearDisassemblyLineType, InstructionTextTokenType

def decompile(binfile, func_filter=r'func0'):
    bv = binaryninja.open_view(binfile, update_analysis=True)
    if bv is None:
        raise Exception("Unable to open view for binary")
    
    settings = DisassemblySettings()
    settings.set_option(DisassemblyOption.ShowVariableTypesWhenAssigned)
    settings.set_option(DisassemblyOption.GroupLinearDisassemblyFunctions)
    settings.set_option(DisassemblyOption.WaitForIL)
    
    decompiler_funcs = {}
    for func in bv.functions:
        if not re.match(func_filter, func.name):
            continue
        decompiler_funcs[func.name] = ""
        obj = lineardisassembly.LinearViewObject.single_function_language_representation(func, settings)
        cursor = obj.cursor
        while True:
            for line in cursor.lines:
                if line.type in [
                    LinearDisassemblyLineType.FunctionHeaderStartLineType,
                    LinearDisassemblyLineType.FunctionHeaderEndLineType,
                    LinearDisassemblyLineType.AnalysisWarningLineType,
                ]:
                    continue
                for i in line.contents.tokens:
                    if i.type == InstructionTextTokenType.TagToken:
                        continue
                    decompiler_funcs[func.name] += f"{str(i)}"
                    # sys.stdout.write(str(i))
                decompiler_funcs[func.name] += "\n"
                # print("")

            if not cursor.next():
                break

    decompiler_outputs = ""
    for func in decompiler_funcs:
        decompiler_outputs = decompiler_outputs + f"{decompiler_funcs[func]}\n\n"
    return decompiler_outputs

if __name__ =='__main__':
    decompile(sys.argv[1])