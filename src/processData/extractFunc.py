import os

class ExtractFuncs(object):
	def __init__(self):
		pass

	def findFuncs(self, path):
		self.path = path
		self.funcs = []  # the number of rows of functions
		self.funcsname = []
		self.file = self._readfile(path)
		self._findCBs()
		funcs = self.funcs.copy()
		for func in funcs:
			sr = func[0]  # the number of row of {
			if self._preChar(sr) != ')':
				self.funcs.remove(func)
				continue
			lr, idx = self._findPare(sr)
			if lr != None:
				s = self.file[lr]
				s = s[:idx]
				s = s.split()
				self.funcsname.append(s[-1])
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

	def writeFuncs(self):
		# after findFuncs
		# self._getFuncName()
		funcsrows = []
		filename = os.path.splitext(self.path)[0]
		for i in range(len(self.funcs)):
			func = self.funcs[i]
			funcname = self.funcsname[i]
			funcsrows += [i for i in range(func[0], func[1]+1)]
			with open(filename+'-'+funcname+'.txt', 'w') as f:
				f.writelines([i + '\n' for i in self.file[func[0]:func[1]+1]])
		with open(filename+'-'+'others.txt', 'w') as f:
			for i in range(len(self.file)):
				if i in funcsrows:
					continue
				f.write(self.file[i] + '\n')


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
	e.findFuncs('/home/kali/oliver/DataHandling/testdata/2132/2132-O0/2132-O0-decompile/2132-O0-Hex-Rays-8.0.0.220729/2132-O0-Hex-Rays-8.0.0.220729.txt')
#	e.findFuncs('../ds2/coreutils/src/copy.c')
	e.writeFuncs()

