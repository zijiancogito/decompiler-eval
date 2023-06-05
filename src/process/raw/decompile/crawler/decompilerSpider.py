import requests
import logging
import random
import time
import sys
import os
from ua_info import ua_list
#from fake_useragent import UserAgent

class DecompilerSpider(object):
	def __init__(self):
		# ua = UserAgent()
		self.url = 'http://dogbolt.org/api/binaries/'
		# self.headers = {'User-Agent': ua.chrome}
		self.binary_path = ''

		s = requests.session()
		s.keep_alive = False

		self.logger = logging.getLogger(__name__)
		self.logger.setLevel(level = logging.WARNING)
		handler = logging.FileHandler("log.txt")
		handler.setLevel(logging.WARNING)
		formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
		handler.setFormatter(formatter)
		self.logger.addHandler(handler)

	def upload_binary(self, binary_path):
		headers = {'User-Agent': random.choice(ua_list)}#, 'Connection': 'close'}
		self.binary_path = binary_path
		files = {'file': open(self.binary_path, 'rb')}
		res = requests.post(url=self.url, files=files, headers=headers)
		self.html = res.json()

	def get_html(self, url):
		for i in range(2):
			try:
				headers = {'User-Agent': random.choice(ua_list)}#, 'Connection': 'close'}
				res = requests.get(url=url, headers=headers, timeout=10)
			except Exception as e:
				if i >= 1:
					raise e
				else:
					time.sleep(0.5)
			else:
				time.sleep(0.3)
				break
		return res
	
	def lower_version(self, v1, v2):
		v1_list = v1.split('-')
		v2_list = v2.split('-')
		v1_list_copy = v1_list.copy()
		v2_list_copy = v2_list.copy()
		for v in v1_list_copy:
			tmp = v.split('.')
			v1_list += tmp
		for v in v1_list_copy:
			v1_list.remove(v)
		for v in v2_list_copy:
			tmp = v.split('.')
			v2_list += tmp
		for v in v2_list_copy:
			v2_list.remove(v)
		v1_len = len(v1_list)
		v2_len = len(v2_list)
		for i in range(v1_len):
			v1_list[i] = int(v1_list[i])
		for i in range(v2_len):
			v2_list[i] = int(v2_list[i])

		for i in range(min(v1_len, v2_len)):
			if v1_list[i] != v2_list[i]:
				return v1_list[i] < v2_list[i]

		if v1_len != v2_len:
			return v1_len < v2_len

		return False

	def parse_html(self, decomps_dir):
		binary_name = os.path.basename(self.binary_path)
		decomps_url = self.html['decompilations_url']
		try:
			decomps_html = self.get_html(decomps_url)
		except Exception as e:
			self.logger.warning(binary_name + ' get wrong\n' + 'url:' + decomps_url + '\n' + str(e) + '\n')
			return
		decomps_html = decomps_html.json()
		decomps_list = decomps_html['results']

		decomped_name = []
		decomped_version = {}
		for i in range(decomps_html['count']):
			decomp = decomps_list[i]
			if decomp['decompiler']['name'] not in ['angr', 'BinaryNinja', 'Ghidra', 'Hex-Rays', 'RetDec']:
				continue
			decomp_dir = os.path.join(decomps_dir, decomp['decompiler']['name'])
			if not os.path.exists(decomp_dir):
				os.makedirs(decomp_dir, 0o775)

			decomp_file = f'{binary_name}.txt'
			decomp_path = os.path.join(decomp_dir, decomp_file)
			if os.path.exists(decomp_path):
				if decomp['decompiler']['name'] in decomped_name:
					if self.lower_version(decomp['decompiler']['version'], decomped_version[decomp['decompiler']['name']]):
						continue
				else:
					continue
			decomped_name.append(decomp['decompiler']['name'])
			decomped_version[decomp['decompiler']['name']] = decomp['decompiler']['version']
			download_url = decomp['download_url']
			try:
				decomp_res = self.get_html(download_url)
			except Exception as e:
				self.logger.warning(f'{decomp_dir} get wrong\nurl: {download_url}\n{e}\n')
				continue
			with open(decomp_path, 'w') as f:
				f.write(decomp_res.content.decode('utf-8'))
			

	def run(self, binary_path, save_to):
		self.upload_binary(binary_path)
		self.parse_html(save_to)

if __name__ == '__main__':
	spider = DecompilerSpider()
	binary_path = sys.argv[1]
	save_to = sys.argv[2]
	spider.run(binary_path, save_to)
