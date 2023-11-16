import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

RETDEC_INSTALL = Path(os.getenv("RETDEC_INSTALL_PATH", "/root/decompiler/retdec/bin"))
RETDEC_DECOMPILER = RETDEC_INSTALL / 'retdec-decompiler'

def main(infile, outfile):
    """
    return:
        1: Success
        0: Error
        -1: Timeout
    """
    signal = 0
    decompiler_outputs = ""
    with tempfile.TemporaryDirectory() as tempdir:
        temp_outfile= tempfile.NamedTemporaryFile(dir=tempdir, delete=True)
        try:
            decomp = subprocess.run([RETDEC_DECOMPILER,
                                    '--output',
                                    temp_outfile.name,
                                    '--cleanup',
                                    '--silent',
                                    infile],
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE,
                                    timeout=120)
            if not os.path.exists(temp_outfile.name):
                decompiler_outputs = f"{decomp.stdout.decode(encoding='gb2312')}\n{decomp.stderr.decode(encoding='gb2312')}"
            else:
                with open(temp_outfile.name, 'r') as f:
                    decompiler_outputs = f.read()
                signal = 1
        except:
            signal = -1
        with open(outfile, 'w') as f:
            f.write(decompiler_outputs)
        temp_outfile.close()
        
    return signal
