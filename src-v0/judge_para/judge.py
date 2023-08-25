import json
import csv
import os

class Judge(object):

	ADDR_SIZE_64 = 64
	ADDR_SIZE_32 = 32
	TYPES_64 = {'int': 32, 'char': 8, 'size_t': 64, 'long int': 64, 'unsigned int': 32, 'double': 64, 'time_t': 64,  'div_t': 64, 'clock_t': 64}
	TYPES_32 = {'int': 32, 'char': 8, 'size_t': 32, 'long int': 32, 'unsigned int': 32, 'double': 64, 'time_t': 32,  'div_t': 32, 'clock_t': 32}

	def __init__(self, json_file):
		self.protos = self._setPrototype(json_file)
		self.record_file = "./result.csv"
		self.ADDR_SIZE = Judge.ADDR_SIZE_64
		self.TYPES = Judge.TYPES_64
		self.header = ['functions', 'variadic', 'miss', 'para_nums', 'para_seqs']
		self.datas = []

	def _setPrototype(self, json_file):
		protos = {}
		with open(json_file, 'r', encoding='utf-8') as f:
			protos = json.load(f)
		return protos

	def _resultRecord(self):
		with open(self.record_file, 'w', encoding='utf-8', newline='') as f:
			writer = csv.DictWriter(f, self.header)
			writer.writeheader()
			writer.writerows(self.datas)

	def _judge_nums(self, func_mge, pa_list, pa_list_dec):
		if func_mge['variadic'] == True:
			return len(pa_list) <= len(pa_list_dec)
		return len(pa_list) == len(pa_list_dec)

	def _judge_seqs(self, func_mge, pa_list, pa_list_dec):
		for i in range(len(pa_list)):
			t = pa_list[i]['type']
			if 'const' in t:
				t = t[6:]
			size = self.ADDR_SIZE if '*' in t else self.TYPES[t]
			if size != pa_list_dec[i]['type']:
				return False
		return True


	def judge(self, js):
		self.record_file = os.path.splitext(js)[0] + '.csv'
		target = {}
		with open(js, 'r', encoding='utf-8') as f:
			target = json.load(f)

		funcs = target['api']
		for func in funcs:
			# init each standard to false
			data = {}
			data['functions'] = func['funcname']
			for s in self.header[1:]:
				data[s] = False

			# determine if we collected the functions to check
			func_mge = self.protos.get(func['funcname'])
			if func_mge is None:
				data['miss'] = True
				self.datas.append(data)
				continue

			para_list = func_mge['para_list']
			para_list_dec = func['para_list']

			data['variadic'] = func_mge['variadic']

			# judge each standard
			data['para_nums'] = self._judge_nums(func_mge, para_list, para_list_dec)
			if data['para_nums']:
				data['para_seqs'] = self._judge_seqs(func_mge, para_list, para_list_dec)
	
			self.datas.append(data)

		self._resultRecord()
			
if __name__ == '__main__':
	j = Judge('api.json')
	j.judge('test.json')
