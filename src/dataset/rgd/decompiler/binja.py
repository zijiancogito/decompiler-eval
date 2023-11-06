import sys
import binaryninja
from binaryninja import lineardisassembly
from binaryninja.function import DisassemblySettings
from binaryninja.enums import DisassemblyOption, LinearDisassemblyLineType, InstructionTextTokenType

def main(infile, outfile):
    signal = 0
    decompiler_outputs = ""
    decompiler_funcs = {}
    with binaryninja.open_view(infile, update_analysis=True) as bv:
        if bv is None:
            raise Exception("Unable to open view for binary")
        settings = DisassemblySettings()
        settings.set_option(DisassemblyOption.ShowVariableTypesWhenAssigned)
        settings.set_option(DisassemblyOption.GroupLinearDisassemblyFunctions)
        settings.set_option(DisassemblyOption.WaitForIL)
        
        for func in bv.functions:
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
    
    if len(list(decompiler_funcs.keys())) == 0:
        signal = 0
    else:
        for func in decompiler_funcs:
            decompiler_outputs = decompiler_outputs + f"{decompiler_funcs[func]}\n\n"
        signal = 1
    with open(outfile, 'w') as f:
        f.write(decompiler_outputs)

    return signal