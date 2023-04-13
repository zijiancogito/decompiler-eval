from random import choice
import utils
import random
import cfile as C
import argparse
import sys
import os
from multiprocessing import Pool

def compile_file(filename, opt_level):
  if not os.path.exists(os.path.join(filename, f'o{opt_level}')):
    os.mkdir(os.path.join(filename, f'o{opt_level}'))
  compiler_options = [#'-fno-ipa-pure-const',
                      '-fno-inline-functions']
  cmd = f"clang -O{opt_level} -w {' '.join(compiler_options)} {filename}/main.c"
  cmd_ir = f"{cmd} -emit-llvm -S -o {filename}/o{opt_level}/main_o{opt_level}.ll"
  cmd_bin = f"{cmd} -o {filename}/o{opt_level}/main_o{opt_level}.o"
  pipeline_ir = os.popen(cmd_ir)
  print(pipeline_ir.read())
  pipeline_bin = os.popen(cmd_bin)
  print(pipeline_bin.read())
  print(f"Compile {filename} with opt {opt_level} Finish.")

def opt_file(path, opt_level):
  cur_path = os.path.curdir
  print(f"Cur dir: {cur_path}")
  os.chdir(os.path.join(os.path.abspath(path), f'o{opt_level}'))
  cmd = f"opt -dot-cfg main_o{opt_level}.ll > /dev/null"
  pipeline = os.popen(cmd)
  print(pipeline.read())
  print("Dot CFG Finished.")
  os.chdir(cur_path)

def main_file(filename, count):
  f = C.cfile(filename)
  f.code.append(C.sysinclude('stdio.h'))
  f.code.append(C.blank())
  f.code.append(utils._printf())
  f.code.append(utils._scanf_no_pointer())
  # f.code.append(utils._rand())
  fd = {}
  for i in range(count):
    func, pc = utils._func(f"func{i}")
    f.code.append(func)
    fd[i] = pc
  f.code.append(utils._main(count, fd))
  utils._file(filename, str(f))

def gen_and_compile(ags):
  path = ags[0]
  choice = ags[1]
  if not os.path.exists(path):
    os.mkdir(path)
  gen = choice[0]
  cpl = choice[1]
  opt = choice[2]
  print(type(gen), gen)
  if gen==1:
    main_file(os.path.join(path, 'main.c'), 5)
  for level in range(4):
    if not os.path.exists(os.path.join(path, f'o{level}')):
      os.mkdir(os.path.join(path, f'o{level}'))
    if cpl==1:
      compile_file(path, level)
    if opt==1:
      opt_file(path, level)
  # for level in range(3):
  #   compile_file(os.path.join(path, 'main'), level)

def batch_gen_par(path, count, choice):
  path = os.path.abspath(path)
  if not os.path.exists(path):
    os.mkdir(path)
  subp_list = [(os.path.join(path, f'case{i}'), choice) for i in range(count)]
  with Pool(20) as p:
    p.map(gen_and_compile, subp_list)

def batch_gen(path, count):
  if not os.path.exists(path):
    os.mkdir(path)
  for i in range(count):
    case_dir = os.path.join(path, f'case{i}')
    if not os.path.exists(case_dir):
      os.mkdir(case_dir)
    # source code
    main_file(os.path.join(case_dir, f'case{i}.c'), 5)
    # compile
    for level in range(3):
      compile_file(case_dir, level)

def main():
  parser = argparse.ArgumentParser(description='Random Code Generator')
  subparsers = parser.add_subparsers(help='sub-command help')

  parser_1 = subparsers.add_parser('gen', help='generate random codes and get a c file.')
  parser_1.add_argument('-f', '--filename', help="Name of file.")
  parser_1.add_argument('-n', '--count', type=int, help="count of function in one file.")

  parser_2 = subparsers.add_parser('compile', help='Compile code.')
  parser_2.add_argument('-o', '--option', help='compiler optimize level')
  parser_2.add_argument('-f', '--filename', help='path to save')

  parser_3 = subparsers.add_parser('batch', help='generate code and get many c files.')
  parser_3.add_argument('-d', '--dir', help='path to generate')
  parser_3.add_argument('-n', '--count', type=int, help='count of files')

  parser_4 = subparsers.add_parser('batchp', help='multi processing generate code and get many c files.')
  parser_4.add_argument('-d', '--dir', help='path to generate')
  parser_4.add_argument('-n', '--count', type=int, help='count of files')
  parser_4.add_argument('-g', '--generate', type=int, help="option of gen")
  parser_4.add_argument('-c', '--compile', type=int, help="option of compile")
  parser_4.add_argument('-o', '--optimize', type=int, help="option of optimize")

  args = parser.parse_args()
  # print(args)
  subp = sys.argv[1]
  if subp == "gen":
    main_file(args.filename, args.count)
  elif subp == "compile":
    compile_file(args.filename, args.option)
  elif subp == "batch":
    batch_gen(args.dir, args.count)
  elif subp == 'batchp':
    choice = (args.generate, args.compile, args.optimize)
    batch_gen_par(args.dir, args.count, choice)
  else:
    print(args.help)

if __name__ == '__main__':
  main()
