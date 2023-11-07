import os
import shutil
import subprocess
import sys
from pathlib import Path
import tempfile


IDA_INSTALL = Path(os.getenv("IDA_INSTALL_PATH", "D:/Decompiler/IDA_Pro"))
IDA_IDAT = IDA_INSTALL / 'idat64.ext'

IDA_BATCH_PY = Path('./tools/hexrays/batch.py')
IDA_VERSION_PY = Path('./tools/hexrays/version.py')

def delete_files(path, exts):
    for ext in exts:
        tmpfile = path + ext
        if os.path.exists(tmpfile):
            os.unlink(tmpfile)

def decompile(infile, outfile):
    signal = 0
    decompiler_outputs = ""
    poj_dir = tempfile.TemporaryDirectory(dir='./temp')
    temp_outfile = poj_dir.name + 'temp.c'
    hexopt = f'-Ohexrays:-errs:{temp_outfile}:ALL'
    decomp = subprocess.run([sys.executable, str(IDA_BATCH_PY), "--idadir", str(IDA_INSTALL), hexopt, infile])
    if not Path(temp_outfile).exists():
        signal = 0
        decompiler_outputs = f"{decomp.stdout.decode()}\n{decomp.stderr.decode()}"
        delete_files(infile, [".i64"])
    else:
        signal = 1
        with open(temp_outfile, 'r') as f:
            decompiler_outputs = f.read()
        delete_files(infile, [".i64"])

    with open(outfile, 'w') as f:
        f.write(decompiler_outputs)
    
    return signal
            

if __name__ == '__main__':
    decompile('../../../../case/case.o', './test.c')