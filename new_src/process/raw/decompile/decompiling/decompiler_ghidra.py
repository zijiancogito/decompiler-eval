import os
import shutil
import subprocess
import sys
import os
import tempfile
from pathlib import Path

GHIDRA_INSTALL = Path(os.getenv("GHIDRA_INSTALL_PATH", "D:/Decompiler/Ghidra"))
GHIDRA_HEADLESS = GHIDRA_INSTALL / 'support' / 'analyzeHeadless.bat'

GHIDRA_APP_PROPERTIES = GHIDRA_INSTALL / 'Ghidra' / 'application.properties'
TEMPDIR = Path("D:/tmp/decompiling/tmp/ghidra")

def decompile(binfile):
    project_dir = TEMPDIR / 'project'
    
    output_file = TEMPDIR / 'out'
    parent_dir = "tools/ghidra/"

    decompile_command = [
        f"{GHIDRA_HEADLESS}",
        project_dir,
        "temp",
        "-import",
        binfile,
        "-scriptPath",
        f"{parent_dir}",
        "-postScript",
        f"{parent_dir}/DecompilerExplorer.java",
        output_file
    ]
    decompiler_outputs = ""
    if not os.path.exists(output_file):
        decomp = subprocess.run(decompile_command, capture_output=True)
        if decomp.returncode != 0 or not os.path.exists(output_file):
            decompiler_outputs = f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}"
            # print(f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode()}")
            return decompiler_outputs

    with open(output_file, 'r') as f:
        decompiler_outputs = f.read()
    return decompiler_outputs
        
if __name__ == '__main__':
    decompiler_outputs = decompile(sys.argv[1], './tmp/ghidra/1')
    print(decompiler_outputs)