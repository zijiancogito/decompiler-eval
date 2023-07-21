from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

from tqdm import tqdm
import func_timeout
import os
import time
import re
import argparse
import shutil

import sys
sys.path.append('../../utils/functools/')
import str_process

class RepairDriver(object):
  def __init__(self, port) -> None:
    # self.kill_firefox()

    firefox_options = webdriver.FirefoxOptions()
    # firefox_options.add_argument("--profile")
    # firefox_options.add_argument(os.path.abspath(profile))
    firefox_options.add_argument("--headless")
    firefox_options.add_argument("--ignore-ssl-errors=yes")
    firefox_options.add_argument("--ignore-certificate-errors")

    # self.driver = webdriver.Firefox(firefox_options)
    remote_uri = f"http://127.0.1.1:{port}/wd/hub"
    self.driver = webdriver.Remote(
      command_executor=remote_uri,
      options=firefox_options
    )
    self.driver.get('http://10.42.0.107:8000/ide/')

    self.fixed_msg = 'Fix successfully!'
    self.unfixed_msg = 'Fix unsuccessfully!'
    self.timeout_msg = 'Bad Request(403). Please try again!'
    
    
  def kill_firefox(self):
    cmd = "pkill -9 firefox"
    os.system(cmd)
    
  def select_case(self):
    case_elem = self.driver.find_element(By.ID, 'caseCheck')
    case_select = Select(case_elem)
    case_select.select_by_value('No case')

  def send_code(self, code):
    # select "No case" and clean the editor
    case_elem = self.driver.find_element(By.ID, 'caseCheck')
    case_select = Select(case_elem)
    case_select.select_by_value('No case')
    time.sleep(1)

    # find and click code editor
    editor_elem = self.driver.find_element(By.ID, 'editor')
    editor_elem.click()
    # wiat for response
    time.sleep(1)

    # input code in the editor
    elem = self.driver.find_element(By.CLASS_NAME, "ace_text-input")
    elem.clear()
    codes = code.split('\n')
    for l in codes:
      if l.strip() == '':
        continue
      if len(l.strip()) > 80:
        sub_l = str_process.str_split(l.strip(), 80)
        for sl in sub_l:
          elem.send_keys(sl.strip())
          elem.send_keys('\n')
      else:
        elem.send_keys(l.strip())
        elem.send_keys('\n')
    time.sleep(1)


  def clang_check(self):
    elem = self.driver.find_element(By.ID, "runcode")
    elem.click()
    time.sleep(3)

  def fix(self):
    elem = self.driver.find_element(By.ID, "fixcode")
    if elem.is_displayed():
      elem.click()


  def repair(self, code):
    # input code
    self.send_code(code)

    # compile code
    self.clang_check()

    # fix code
    self.fix()
    # check fixed results
    start = time.time()
    fixed = 0
    while True:
      if self.fixed_msg in self.driver.page_source:
        fixed = 1
        break
      elif self.unfixed_msg in self.driver.page_source:
        fixed = 2
        break
      elif self.timeout_msg in self.driver.page_source:
        fixed = 0
        break
      end = time.time()
      if end - start > 60:
        break
      time.sleep(3)
    return fixed

    
  def close(self):
    self.driver.close()
    # os.system('taskkill /f /im %s' % 'firefox')

  def flush_page(self):
    case_elem = self.driver.find_element(By.ID, 'caseCheck')
    case_select = Select(case_elem)
    case_select.select_by_value('case 1')
    time.sleep(2)

  def get_fix_log(self):
    page = self.driver.page_source
    
    pattern = "Fix successfully"
    repaired = 0
    repair_log = None
    if pattern in page:
      repaired = 1
      output_elem = self.driver.find_element(By.XPATH, '//*[@class="output-text outputo"]')
      repair_log = output_elem.text
      # print(output_html)
    return repaired, repair_log
  
  def fix_code(self, repair_log, code):
    pattern = r'erronous lines:\n([\s\S]+)\n\nsuggested fix:\n([\s\S]+)'
    finds = re.finditer(pattern, repair_log)
    rep_dict = {}
    code_list = code.split('\n')    
    for f in finds:
      err_lines = f.group(1).split('\n')
      sug_lines = f.group(2)
      err_pat = f'([0-9]+) [^\n]+'
      for idx, line in enumerate(err_lines):
        mat = re.match(err_pat, line)
        if mat:
          line_num = mat.group(1)
          if idx == 0:
            code_list[int(line_num) - 1] = sug_lines
          else:
            code_list[int(line_num) - 1] = ''
    new_code_list = []
    for l in code_list:
      if l != '':
        new_code_list.append(l)
    return '\n'.join(new_code_list)
  
  def run(self, code):
    fixed = self.repair(code)
    if fixed == 0 or fixed == 2:
      self.flush_page()
      return fixed, None
    fix_result, fix_log = self.get_fix_log()

    new_code = None
    if fix_result == 1:
      new_code = self.fix_code(fix_log, code)

    self.flush_page()
    return fix_result, new_code

def repair_all(dec_dir, fixed_dir, unfixed_dir, timeout_dir, compilers, decompilers, optimizations, port):
  wd = RepairDriver(port)
  for compiler in compilers:
    for opt_level in optimizations:
      for decompiler in decompilers:
        dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
        fixed_sub_dir = os.path.join(fixed_dir, compiler, opt_level, decompiler)
        unfixed_sub_dir = os.path.join(unfixed_dir, compiler, opt_level, decompiler)
        if not os.path.exists(fixed_sub_dir):
          os.makedirs(fixed_sub_dir)
        if not os.path.exists(unfixed_sub_dir):
          os.makedirs(unfixed_sub_dir)
        timeout_sub_dir = os.path.join(timeout_dir, compiler, opt_level)
        if not os.path.exists(timeout_sub_dir):
          os.makedirs(timeout_sub_dir)

        dec_files = os.listdir(dec_sub_dir)
        fixed_cnt, unfixed_cnt, timeout_cnt = 0, 0, 0
        for df in tqdm(dec_files, desc=f"{compiler}-{opt_level}-{decompiler}"): # tqdm(dec_files):
          dec_path = os.path.join(dec_sub_dir, df)
          fix_flag, new_code = None, None
          with open(dec_path, 'r', encoding='ISO-8859-1') as f:
            code = f.read()
            code = re.sub('\t', '', code)
            fix_flag, new_code = wd.run(code)
          if fix_flag == 1:
            new_code_path = os.path.join(unfixed_sub_dir, df)
            save_fixed_code(new_code, new_code_path)
            fixed_cnt += 1
          elif fix_flag == 2:
            shutil.copy(dec_path, unfixed_sub_dir)
            unfixed_cnt += 1
          elif fix_flag == 0:
            shutil.copy(dec_path, timeout_sub_dir)
            timeout_cnt += 1

        print(f"{compiler}-{opt_level}-{decompiler}:\t\t{fixed_cnt}/{unfixed_cnt}/{timeout_cnt}/{len(dec_files)}")
          
  wd.close()

def save_fixed_code(code, new_path):
  with open(new_path, 'w') as f:
    f.write(code)

if __name__ == '__main__':
  parser = argparse.ArgumentParser(prog='clang-check.py')
  parser.add_argument('-d', '--dec', type=str, help='dir of DEC')
  parser.add_argument('-f', '--fixed-dec', type=str, help='dir of DEC')
  parser.add_argument('-u', '--unfixed-dec', type=str, help='log dir')
  parser.add_argument('-t', '--timeout-dec', type=str, help='log dir')

  # parser.add_argument('-p', '--profile', type=str, help="Profiles of firefox")
  parser.add_argument('-p', '--port', type=int, help="port of webservice")
  
  parser.add_argument('-D', '--decompilers', nargs='+', help='Decompilers')
  parser.add_argument('-C', '--compilers', nargs='+', help='Compilers')
  parser.add_argument('-O', '--optimizations', nargs='+', help='Optimizations')

  args = parser.parse_args()

  repair_all(args.dec, 
             args.fixed_dec, 
             args.unfixed_dec, 
             args.timeout_dec,
             args.compilers, 
             args.decompilers, 
             args.optimizations,
             args.port)
