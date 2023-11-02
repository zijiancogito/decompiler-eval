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


def decompile(infile, outfile):
    signal = 0
    decompiler_outputs = ""
    with tempfile.TemporaryDirectory() as tempdir:
        temp_outfile = os.path.join(tempfile.gettempdir(), 'temp.c')
        hexopt = f'-Ohexrays:-errs:{temp_outfile}:ALL'
        decomp = subprocess.run([sys.executable, str(IDA_BATCH_PY), "--idadir", str(IDA_INSTALL), hexopt, infile])
        if decomp.returncode != 0 or not Path(temp_outfile).exists():
            signal = 0

        else:
            signal = 1