import requests
import logging
import random
import time
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

	def parse_html(self, save_to):
		binary_name = os.path.basename(self.binary_path)
		decomps_dir = os.path.join(save_to, binary_name)
		decomps_url = self.html['decompilations_url']
		try:
			decomps_html = self.get_html(decomps_url)
		except Exception as e:
			self.logger.waring(decomps_dir + ' get wrong\n' + 'url:' + decomps_url + '\n' + str(e) + '\n')
			return
		decomps_html = decomps_html.json()
		decomps_list = decomps_html['results']

		if not os.path.exists(decomps_dir):
			os.makedirs(decomps_dir, 0o775)

		for i in range(decomps_html['count']):
			decomp = decomps_list[i]
			if 'Hex-Rays' not in decomp['decompiler']['name']:
				continue
			# decomp_dir = binary_name + '-' + decomp['decompiler']['name'] + '-' + decomp['decompiler']['version']
			decomp_file = binary_name + '.txt'
			# decomp_dir = os.path.join(decomps_dir, decomp_dir)
			decomp_dir = decomps_dir
			decomp_path = os.path.join(decomp_dir, decomp_file)
			download_url = decomp['download_url']
			try:
				decomp_res = self.get_html(download_url)
			except Exception as e:
				self.logger.warning(decomp_dir + ' get wrong\n' + 'url:' + download_url + '\n' + str(e) + '\n')
				continue
			with open(decomp_path, 'w') as f:
				f.write(decomp_res.content.decode('utf-8'))
			

	def run(self, binary_path, save_to):
		self.upload_binary(binary_path)
		self.parse_html(save_to)

if __name__ == '__main__':
	start = time.time()
	spider = DecompilerSpider()
	spider.run('/home/kali/oliver/DataHandling/testdata/2132/2132-O3/2132-O3')
	end = time.time()
	print()
	print('Process time: %2.f seconds'%(end-start))

