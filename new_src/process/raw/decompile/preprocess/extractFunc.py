import os
import csv
import copy
import argparse

compiler_generated_funcs = [
	'_init',
	'__cxa_finalize',
	'__stack_chk_fail',
	'__isoc99_scanf',
	'_start',
	'deregister_tm_clones',
	'register_tm_clones',
	'__do_global_dtors_aux',
	'_do_global_dtors_aux',
	'frame_dummy',
	'_fini',
	'__libc_start_main',
	'UnresolvableJumpTarget',
	'UnresolvableCallTarget',
	'__printf_chk',
	'__cxx_global_var_init-ir',
	'__cxx_global_var_init',
	'__cxa_atexit',
	'llvm.memset.p0i8.i64',
	'_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_',
	'(**init_proc())',
	'term_proc',
	'_libc_csu_init',
	'_libc_csu_fini',
	'_gmon_start__',
	'start',
	'sub_1020',
]

class ExtractFuncs(object):
	def __init__(self, file_path):
		self.file_path = file_path
		self.file = self._readfile(file_path)
		self.funcs = {}  # {func_name: func} the content of all functions
		self.required_funcs = {}  # {func_name: func} the content of required functions
		self.funcsrows = []  # the number of rows of functions
		self.funcsname = []

	def findFuncs(self):
		self._findCBs()
		funcsrows = self.funcsrows.copy()
		for funcrow in funcsrows:
			sr = funcrow[0]  # the number of row of {
			if self._preChar(sr) != ')':
				self.funcsrows.remove(funcrow)
				continue
			lr, idx = self._findPare(sr)
			if lr != None:
				s = self.file[lr]
				s = s[:idx]
				s = s.split()
				func_name = s[-1]
				while func_name[0] == '*':
					func_name = func_name[1:]

				self.funcsname.append(func_name)
				if len(s) == 1:
					lr -= 1
				
				if self.funcsrows.count(funcrow):
					self.funcsrows[self.funcsrows.index(funcrow)][0] = lr

	def getFuncs(self):
		self.findFuncs()
		for i in range(len(self.funcsrows)):
			funcrow = self.funcsrows[i]
			func_name = self.funcsname[i]
			func = ""
			for i in self.file[funcrow[0]: funcrow[1] + 1]:
				func += i + '\n'
			self.funcs[func_name] = func

		return self.funcs

	def extractFuncs(self, funcs_name):
		self.getFuncs()
		if len(funcs_name) == 0:
			self.required_funcs = copy.deepcopy(self.funcs)
			return True
		
		check = True
		for func_name in funcs_name:
			if func_name in self.funcsname:
				self.required_funcs[func_name] = self.funcs[func_name]
			else:
				check = False

		return check

	def writeFuncs(self, save_to):
		if not os.path.exists(save_to):
			os.makedirs(save_to)
		for func in self.required_funcs.values():
			file_name = os.path.basename(self.file_path)
			with open(os.path.join(save_to, file_name), 'a') as f:
				f.write(f'{func}\n\n')


	def _readfile(self, path):
		with open(path, 'r', encoding='ISO-8859-1') as f:
			file = f.read().splitlines()
		return file
	
	def _findCBs(self):  # CB: curly braces
		stack = []
		for i in range(len(self.file)):
			r = self.file[i]
			for s in r:
				if s == '{':
					stack.append(i)
				elif s == '}':
					if len(stack) > 1:
						stack.pop()
					elif len(stack) == 1:
						self.funcsrows.append([stack[0], i])
						stack.pop()
						break

	def _findPare(self, sr):
		stack = []
		for i in range(sr, -1, -1):
			r = self.file[i]
			for j in range(len(r) - 1, -1, -1):
				s = r[j]
				if s == ')':
					stack.append(i)
				elif s == '(':
					if len(stack) > 1:
						stack.pop()
					elif len(stack) == 1:
						return (i, j)
		return (None, None)

	def _preChar(self, row):
		r = self.file[row]
		idx = r.find('{')
		for i in range(idx - 1, -1, -1):
			if not r[i].isspace():
				return r[i]

		for i in range(row - 1, -1, -1):
			r = self.file[i]
			for j in range(len(r) - 1, -1, -1):
				if not r[j].isspace():
					return r[j]
		return None

	'''
	def _getFuncName(self):
		for func in self.funcsrows:
			for i in range(func[0], func[1]):
				r = self.file[i]
				if '(' in r:
					r = r.split('(')
					fn = r[0]
					fn = fn.split()
					self.funcsname.append(fn[-1])
					break
	'''

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('-s', '--source', required=True, help="path to file to be processed")
	parser.add_argument('-o', '--save-to', required=True, help='path to save results')
	parser.add_argument('-e', '--err', required=True, help='path to save errors')
	parser.add_argument('-f', '--funcs-name', default='', nargs='+', help='name to functions to be extracted')

	args= parser.parse_args()

	e = ExtractFuncs(args.source)
	if not e.extractFuncs(args.funcs_name):
		err_path = os.path.dirname(args.err)
		if not os.path.exists(err_path):
			os.makedirs(err_path)
		with open(args.err, 'a') as f:
			writer = csv.writer(f)
			f.write(f"{args.source}\n")
	e.writeFuncs(args.save_to)

