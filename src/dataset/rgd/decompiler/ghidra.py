import os
import shutil
import subprocess
import sys
import os
import tempfile
from pathlib import Path

GHIDRA_INSTALL = Path(os.getenv("GHIDRA_INSTALL_PATH", "/root/decompiler/ghidra_10.3.1_PUBLIC"))
GHIDRA_HEADLESS = GHIDRA_INSTALL / 'support' / 'analyzeHeadless'
GHIDRA_APP_PROPERTIES = GHIDRA_INSTALL / 'Ghidra' / 'application.properties'

def main(infile, outfile):
    signal = 0
    decompiler_outputs = ""
    with tempfile.TemporaryDirectory() as tempdir:
        project_dir = tempfile.TemporaryDirectory(dir=tempdir)
        temp_outfile = project_dir.name + "/out"
        parent_dir = Path.cwd()

        decompile_command = [
            GHIDRA_HEADLESS,
            project_dir.name,
            "temp",
            "-import",
            infile,
            "-scriptPath",
            "./tools/ghidra",
            "-postScript",
            "./tools/ghidra/DecompilerExplorer.java",
            temp_outfile
        ]
        
        decomp = subprocess.run(decompile_command, capture_output=True)
        if not os.path.exists(temp_outfile):
            decompiler_outputs = f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}"
            signal = 0
        else:
            with open(temp_outfile, 'r') as f:
                decompiler_outputs = f.read()
            signal = 1
    
    with open(outfile, 'w') as f:
        f.write(decompiler_outputs)
    return signal

if __name__ == '__main__':
    print(__file__)
    print(Path(__file__).resolve())
    print(Path.cwd())