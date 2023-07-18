import requests
import logging
import random
import time
import sys
import os

ua_list = [
	'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Maxthon 2.0',
	'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11',
	'User-Agent:Opera/9.80 (Windows NT 6.1; U; en) Presto/2.8.131 Version/11.11',
	'Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1',
	'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)',
	'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50',
	'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0',
	'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1',
	'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1',
	'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1',
]


class Repair(object):
    def __init__(self) -> None:
        self.url = 'http://10.42.0.107:8000/ide/'
        self.code = ''
        
        s = requests.session()
        s.keep_alive = True

        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(level=logging.WARNING)
        handler = logging.FileHandler("log.txt")
        handler.setLevel(level=logging.WARNING)
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)
        

    def upload_source(self, source):
        headers = {'User-Agent': random.choice(ua_list)}#, 'Connection': 'close'}
        self.code = source
        files = {'file': open(self.code, 'rb')}
        res = requests.get(url=self.url, files=files, headers=headers)
        
        self.html = res.json

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
    

    def parse_html(self):
        print(self.html)
    
    def run(self, code):
        self.upload_source(code)
        self.parse_html()

if __name__ == '__main__':
    spider = Repair()
    src_file = '/home/eval/data/POJ/process/de/clang/o2/Ghidra/0.c'
    # with open('/home/eval/data/POJ/process/de/clang/o2/Ghidra/0.c', 'r', encoding='ISO-8859-1') as f:
        # code = f.read()
    

    spider.run(src_file)