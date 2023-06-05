import os
import shutil
import subprocess
import sys
from pathlib import Path

IDA_INSTALL = Path(os.getenv("IDA_INSTALL_PATH", "D:/Decompiler/IDA_Pro"))
IDA_IDAT = IDA_INSTALL / 'idat64.exe'
CURRENT = Path('D:/tmp/decompiling/decompiling')
IDA_BATCH_PY = CURRENT / 'tools/hexrays/batch.py'
IDA_VERSION_PY = CURRENT / 'tools/hexrays/version.py'

TEMPDIR = Path("D:/tmp/decompiling/tmp/ida")

def decompile(binfile):
    if os.path.exists('temp.c'):
        os.unlink('temp.c')
    hexopt = '-Ohexrays:-errs:temp.c:ALL'
    # cmd = f"{IDA_IDAT} {hexopt} -c -A {binfile}"
    decomp = subprocess.run([IDA_IDAT, hexopt, '-c', '-A', binfile], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if not os.path.exists('temp.c'):
        decompiler_outputs = f"{decomp.stdout.decode()}\n{decomp.stderr.decode()}"
        return decompiler_outputs
    
    with open('temp.c', 'r') as f:
        decompiler_outputs = f.read()
    os.unlink('temp.c')
    return decompiler_outputs



if __name__ == '__main__':
    decompiler_outputs = decompile(sys.argv[1])
