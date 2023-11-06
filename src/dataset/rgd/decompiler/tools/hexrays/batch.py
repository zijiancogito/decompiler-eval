import os
import sys
import shutil
import argparse
import subprocess

HEX_NONE   = 0x000 # invalid
HEX_X86    = 0x001 # hexx86
HEX_X64    = 0x002 # hexx64
HEX_ARM    = 0x004 # hexarm
HEX_ARM64  = 0x008 # hexarm64
HEX_PPC    = 0x010 # powerpc
HEX_PPC64  = 0x020 # powerpc64
HEX_MIPS   = 0x040 # mips
HEX_MIPS64 = 0x080 # mips64

platforms_32 = [HEX_X86, HEX_ARM,   HEX_PPC,   HEX_MIPS  ]
platforms_64 = [HEX_X64, HEX_ARM64, HEX_PPC64, HEX_MIPS64]

def eprint(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

# delete all files starting with 'path' and having the 'exts' extensions
def delete_files(path, exts):
  for ext in exts:
    tmpfile = path + ext
    if os.path.exists(tmpfile):
      os.unlink(tmpfile)

def main():
  # parse command line arguments
  parser = argparse.ArgumentParser(description='Batch decompile a file')
  parser .add_argument('--idadir', '-d', type=str,
                       help='Directory with IDA Pro executable')
  parser.add_argument('--timeout', '-T', type=int, default=6000,
                      help='Timeout in seconds')
  parser.add_argument('--keep-idb', '-k', action='store_false',
                      help='Do not delete the database after decompilation')
  parser.add_argument('input_files', nargs='+', default=[],
                      help='Input files to decompile')
  
  args = parser.parse_args(sys.argv[1:])
  
  # determine IDA installation directory
  idadir = args.idadir
  
  bitness = 64
  is64 = bitness == 64
  idat = os.path.join(idadir, 'idat64.exe')
  for input in args.input_files:
    