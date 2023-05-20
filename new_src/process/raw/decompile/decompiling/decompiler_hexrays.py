import os
import shutil
import subprocess
import sys
from pathlib import Path

IDA_INSTALL = Path(os.getenv("IDA_INSTALL_PATH", "D:/Decompiler/IDA_Pro"))
IDA_IDAT = IDA_INSTALL / 'idat.exe'
IDA_BATCH_PY = './tools/hexrays/batch.py'
IDA_VERSION_PY = './tools/hexrats/version.py'

TEMPDIR = Path("D:/tmp/decompiling/tmp/ida")

def decompile(binfile):
    output = TEMPDIR / 'temp.c'

    decompiler_outputs = ""
    decomp = subprocess.run([sys.executable, str(IDA_BATCH_PY), "--idadir", str(IDA_INSTALL), binfile], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if decomp.returncode != 0 or not os.path.exists(output):
        decompiler_outputs = f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}"
        # print(f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}")
        return decompiler_outputs
        # sys.exit(1)

    with open(output, 'r') as f:
        decompiler_outputs = f.read()
        # sys.stdout.buffer.write(f.read())
    return decompiler_outputs

if __name__ == '__main__':
    decompiler_outputs = decompile(sys.argv[1])
    print(decompiler_outputs)
