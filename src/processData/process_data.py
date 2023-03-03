import os
import logging
from compiler import Compile
from decompilerSpider import DecompilerSpider
from extractFunc import ExtractFuncs

class ProcessData(object):
	def __init__(self):
		self.c = Compile()
		self.d = DecompilerSpider()
		self.e = ExtractFuncs()

	def process_source(self, source):
		self.e.findFuncs(source)
		self.e.writeFuncs()
		for i in range(4):
			binary_dir = self.c.compile(source, i, True)
			if binary_dir is None:
				continue
			binary = os.path.join(binary_dir, os.path.basename(binary_dir))
			strip_binary = binary + '-strip'
			for b in [binary, strip_binary]:
				self.process_binary(b)

	def process_binary(self, binary, save_to):
		self.d.run(binary, save_to)
		# binary_name = os.path.basename(binary)
		# decomps_dir = os.path.join(save_to, binary_name)
		# decomp_list = os.listdir(decomps_dir)
		# for decomp_file_name in decomp_list:
		# 	decomp_file = os.path.join(decomps_dir, decomp_file_name)
		# 	if os.path.isfile(decomp_file):
		# 		self.e.findFuncs(decomp_file)
		# 		self.e.writeFuncs()

		print('Done: decompile', binary)


if __name__ == '__main__':
	p = ProcessData()
	sources_dir = '/home/kali/oliver/DataHandling/testdata'
	sources_list = os.listdir(sources_dir)
	for source_dir in sources_list:
		source_path = os.path.join(sources_dir, source_dir)
		if not os.path.isdir(source_path):
			continue
		source = os.path.join(source_path, source_dir + '.c')
		p.process_source(source)

