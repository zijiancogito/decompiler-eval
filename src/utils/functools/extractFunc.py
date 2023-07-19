import os

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
	def __init__(self):
		pass

	def findFuncs(self, path):
		self.path = path
		self.funcs = []  # the number of rows of functions
		self.funcsname = []
		self.struct = []
		self.file = self._readfile(path)
		self._findCBs()
		funcs = self.funcs.copy()
		for func in funcs:
			sr = func[0]  # the number of row of "{"
			if self._preChar(sr) == ')':
				# function
				lr, idx = self._findPare(sr)
				if lr == None:
					self.funcs.remove(func)
					continue
				s = self.file[lr]
				s = s[:idx]
				s = s.split()
				func_name = s[-1]
				while func_name[0] == '*':
					func_name = func_name[1:]
				if func_name in compiler_generated_funcs:
					self.funcs.remove(func)
					continue

				self.funcsname.append(func_name)
				if len(s) == 1:
					lr -= 1
				'''
				for i in range(len(s)):
					c = s[i]
					if '(' in c:
						if (c.find('(') == 0 and i < 2) or (c.find('(') != 0 and i < 1):
							lr -= 1
						break
				'''
				if self.funcs.count(func):
					self.funcs[self.funcs.index(func)][0] = lr
			else:
				# self.struct: quadruple [start row, start col, end row, end col]
				self.funcs.remove(func)
				r1 = sr
				r2 = func[1]
				c1 = c2 = None
				over = False
				wrong = False
				for i in range(func[1], len(self.file)):
					r = self.file[i].strip()
					for j in range(len(r)):
						c = r[j]
						if c == ';':
							r2 = i
							c2 = j
							over = True
							break
						if not (c.isdigit() or c.isalpha() or c.isspace() or c == '_' or c == '}'):
							wrong = True
							over = True
							break
					if over:
						break
				if wrong:
					continue
				for i in range(sr, -1, -1):
					r = self.file[i].strip()
					tmp = r.split()
					if "struct" in r:
						r1 = i
						if "typedef" in r:
							c1 = r.find("typedef")	
						else:
							c1 = r.find("struct")
				if c1 is not None and c2 is not None:
					self.struct.append([r1, c1, r2, c2])

	def getFuncs(self, path):
		self.findFuncs(path)
		funcs = []
		for funcrow in self.funcs:
			func = ""
			for i in self.file[funcrow[0]: funcrow[1] + 1]:
				func += i + '\n'
			funcs.append(func)

		return funcs, self.funcsname
	
	def getStructs(self, path):
		self.findFuncs(path)
		structs = []
		for structrow in self.struct:
			struct = ""
			struct += self.file[structrow[0]][structrow[1]:] + '\n'
			for i in self.file[structrow[0] + 1: structrow[2]]:
				struct += i + '\n'
			struct += self.file[structrow[2]][:structrow[3] + 1] + '\n'
			structs.append(struct)

		return structs

	def writeFuncs(self):
		# after findFuncs
		# self._getFuncName()
		funcsrows = []
		filepath = os.path.dirname(self.path)
		for i in range(len(self.funcs)):
			func = self.funcs[i]
			funcname = self.funcsname[i]
			funcsrows += [i for i in range(func[0], func[1]+1)]
			with open(os.path.join(filepath, funcname+'.txt'), 'w') as f:
				f.writelines([i + '\n' for i in self.file[func[0]:func[1]+1]])
		'''
		with open(os.path.join(filepath, 'others.txt'), 'w') as f:
			for i in range(len(self.file)):
				if i in funcsrows:
					continue
				f.write(self.file[i] + '\n')
		'''

	def _readfile(self, path):
		with open(path, 'r', encoding='ISO-8859-1') as f:
			file = f.read().splitlines()
		return file
	
	def _findCBs(self):  # CB: curly braces
		stack = []
		is_comment = False
		for i in range(len(self.file)):
			r = self.file[i].strip()
			if r[0:2] == "//":
				continue
			if r[0:2] == "/*":
				is_comment = True
			if is_comment and "*/" in r:
				is_comment = False
				continue
			if is_comment:
				continue
			for s in r:
				if s == '{':
					stack.append(i)
				elif s == '}':
					if len(stack) > 1:
						stack.pop()
					elif len(stack) == 1:
						self.funcs.append([stack[0], i])
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
		for func in self.funcs:
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
	e = ExtractFuncs()
	# e.getFuncs('/home/kali/oliver/DataHandling/testdata/2132/2132-O0/2132-O0-decompile/2132-O0-Hex-Rays-8.0.0.220729/2132-O0-Hex-Rays-8.0.0.220729.txt')
	res = e.getStructs('./t.c')
	print(res[0])