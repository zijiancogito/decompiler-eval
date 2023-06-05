import os
import shutil
import subprocess

class Compile(object):
	def __init__(self):
		pass

	def compile(self, source, opti = 0, strip = False):
		opti = '-O' + str(opti)
		binary_dir = os.path.splitext(source)[0] + opti
		if not os.path.exists(binary_dir):
			os.makedirs(binary_dir, 0o755)
		binary = os.path.join(binary_dir, os.path.basename(binary_dir))
		cmd = 'gcc -lm ' + opti + ' -g -o ' + binary + ' ' + source
		with subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) as p:
			stdout, stderr = p.communicate()
			stderr = stderr.decode('ISO-8859-1')
			if ('error' in stderr):
				print('Error: ' + opti + ' ' + source)
				return None
			else:
				print('Complete: ' + opti + ' ' + source)

		if strip:
			self.strip(binary)

		return binary_dir

	def strip(self, binary):
		strip_bianry = binary+'-strip'
		shutil.copy(binary, strip_bianry)
		cmd = 'strip -s ' + strip_bianry
		subprocess.Popen(cmd, shell=True)


if __name__ == '__main__':
	c = Compile()
	for i in range(4):
		c.compile('1001/1001.c', i, True)

