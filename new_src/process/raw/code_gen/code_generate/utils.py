import sys
sys.path.append('.')

import cfile as C
import random

from settings import *

def _rand():
  # print("Generate rand function...")
  body = C.block(innerIndent=3)
  body.append(C.statement(f"{C.variable('var0', 'int')} = {C.fcall('rand')}"))
  body.append(C.statement('return var0'))
  head = C.function('f_rand', 'int')
  func = C.sequence()
  func.append(head)
  func.append(body)
  # print(str(func))
  return func

def _scanf_no_pointer():
  # print("Generate scanf function...")
  body = C.block(innerIndent=3)
  body.append(C.statement(C.variable('var0', 'int')))
  body.append(C.statement(C.fcall('scanf').add_arg('\"%d\"').add_arg('&var0')))
  body.append(C.statement("return var0"))
  head = C.function('f_scanf_nop', 'int',)
  func = C.sequence()
  func.append(head)
  func.append(body)
  # print(str(func))
  return func

def _printf():
  # print("Generate printf function...")
  body = C.block(innerIndent=3)
  body.append(C.statement(C.fcall('printf').add_arg('\"%d\"').add_arg('p0')))
  head = C.function('f_printf', 'void',).add_param(C.variable('p0', 'int'))
  func = C.sequence()
  func.append(head)
  func.append(body)
  # print(str(func))
  return func

def _expression(all_vars: list, op_seq: list, target):
  end = False
  expr = random.choice(all_vars)
  pre = expr
  for it in range(8):
    opc = random.choice(op_seq)
    var = random.choice(all_vars)
    while pre == var:
      var = random.choice(all_vars)
    pre = var
    expr = f"{expr} {opc} {var}" if it == 0 else f"({expr}) {opc} {var}"
    end = random.choice([True, False])
    if end:
      break
  return expr


def _func(funcname):
  # print(f"Generate {funcname}...")
  para_count = random.randint(0, MAX_PARA)
  local_count = LOCAL_VARS 
  local_const = LOCAL_CONST
  body = C.block(innerIndent=3)
  for i in range(local_count):
    body.append(C.statement(f"{C.variable(f'var{i}', 'int')} = {C.fcall(random.choice(['f_scanf_nop']))}"))
  for i in range(local_const):
    tmp = random.randint(-10, 10)
    if tmp == 0:
        tmp = 1
    body.append(C.statement(f"{C.variable(f'var{i+local_count}', 'int')} = {tmp}"))

  all_vars = [f'var{i}' for i in range(local_const + local_count)] + [f'p{i}' for i in range(para_count)]
  op_seq = ['+', '-', '*', '/', '&', '|', '^']
  # print(all_vars)
  max_iter = MAX_DEEP
  targets = set()
  for i in range(MAX_STMT):
    trg = random.choice(all_vars)
    expr = _expression(all_vars, op_seq, trg)
    body.append(C.statement(f"{trg} = {expr}"))
    if random.choice([False, True]):
      body.append(C.statement(C.fcall('f_printf').add_arg(trg)))
    targets.add(trg)
  ret_var = random.choice(all_vars)
  ret_expr = _expression(all_vars+list(targets), op_seq, ret_var)
  body.append(C.statement(f"{ret_var} = {ret_expr}"))
  body.append(C.statement(f'return {ret_var}'))
  head = C.function(funcname, 'int')
  for i in range(para_count):
    head.add_param(C.variable(f'p{i}', 'int'))
  func = C.sequence()
  func.append(head)
  func.append(body)
  # print(hash(body))
  return func, para_count

def _main(count, fd):
  # print("Generate main function...")
  func = C.sequence()
  head = C.function('main', 'int',)
  body = C.block(innerIndent=3)
  for i in range(MAX_PARA):
    body.append(C.statement(f"{C.variable(f'var{i}', 'int')} = {C.fcall(random.choice(['f_scanf_nop']))}"))
  for i, pc in fd.items():
    body.append(C.statement(C.fcall('func%d'%i).add_arg(', '.join(['var%d'%p for p in range(pc)]))))
  body.append(C.statement('return 0'))
  func.append(head)
  func.append(body)
  return func

def _file(filename, stream):
  with open(filename, 'w') as f:
    f.write(stream)

def test():
  _printf()
  _rand()
  _scanf_no_pointer()
  _func("func")
  _main()

def main():
  test()

if __name__ == '__main__':
  main()
