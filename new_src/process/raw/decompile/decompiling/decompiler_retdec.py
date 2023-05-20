import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

RETDEC_INSTALL = Path(os.getenv("RETDEC_INSTALL_PATH", "D:/Decompiler/RetDec/bin"))
RETDEC_DECOMPILER = RETDEC_INSTALL / 'retdec-decompiler.exe'
TEMPDIR = Path("D:/tmp/decompiling/tmp/retdec/")

def decompile(binfile):
    outfile = TEMPDIR / 'temp.c'
    decomp = subprocess.run([RETDEC_DECOMPILER, '--output', outfile, '--cleanup', '--silent', binfile], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    decompiler_outputs = ""
    if decomp.returncode != 0:
        decompiler_outputs = f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}"
        # print(f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}")

    with open(outfile, 'rb') as f:
        decompiler_outputs = f.read()
        # sys.stdout.buffer.write(f.read())
    return decompiler_outputs
        
if __name__ == '__main__':
    decompiler_outputs = decompile(sys.argv[1])
    print(decompiler_outputs)