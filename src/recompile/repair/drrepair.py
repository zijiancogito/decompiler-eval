from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

import os
import time
import re

class RepairDriver(object):
  def __init__(self) -> None:
    firefox_options = webdriver.FirefoxOptions()
    firefox_options.add_argument("--profile")
    firefox_options.add_argument(os.path.abspath("./usiijz40.default-release"))
    self.driver = webdriver.Remote(
      command_executor='http://127.0.1.1:4444',
      options=firefox_options
    )
    self.driver.get('http://10.42.0.107:8000/ide/')
    
  def select_case(self):
    case_elem = self.driver.find_element(By.ID, 'caseCheck')
    case_select = Select(case_elem)
    case_select.select_by_value('No case')

  def send_code(self, code):
    # editor_elem = self.driver.find_element(By.XPATH, '//*[@id="editor"]')
    editor_elem = self.driver.find_element(By.ID, 'editor')
    editor_elem.click()
    time.sleep(3)
    elem = self.driver.find_element(By.CLASS_NAME, "ace_text-input")
    # elem = self.driver.find_element(By.ID, 'custom-input')
    elem.clear()
    elem.send_keys(code)
    

  def clang_check(self):
    elem = self.driver.find_element(By.ID, "runcode")
    elem.click()

  def fix(self):
    elem = self.driver.find_element(By.ID, "fixcode")
    if elem.is_displayed():
      elem.click()


  def repair(self, code):
    self.select_case()
    time.sleep(1)

    self.send_code(code)

    self.clang_check()
    time.sleep(1)
    self.fix()
    
  def close(self):
    self.driver.close()
    # os.system('taskkill /f /im %s' % 'firefox')

  def flush(self):
    case_elem = self.driver.find_element(By.ID, 'caseCheck')
    case_select = Select(case_elem)
    case_select.select_by_value('case 1')

  def parse_page(self):
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
  
  def replace(self, repair_log, code):
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
    self.repair(code)
    fix_result, fix_log = self.parse_page()

    new_code = None
    if fix_result == 1:
      new_code = self.replace(fix_log, code)

    self.flush()
    return fix_result, new_code

def repair_all(dec_dir, new_dir, compilers, decompilers, optimizations):
  wd = RepairDriver()
  for compiler in compilers:
    for opt_level in optimizations:
      for decompiler in decompilers:
        dec_sub_dir = os.path.join(dec_dir, compiler, opt_level, decompiler)
        new_sub_dir = os.path.join(new_dir, compiler, opt_level, decompiler)
        if not os.path.exists(new_sub_dir):
          os.makedirs(new_sub_dir)
        dec_files = os.listdir(dec_sub_dir)
        for df in dec_files:
          dec_path = os.path.join(dec_sub_dir, df)
          fix_flag, new_code = None, None
          with open(dec_path, 'r', encoding='ISO-8859-1') as f:
            code = f.read()
            fix_flag, new_code = wd.run(code)
          if fix_flag == 1:
            new_code_path = os.path.join(new_sub_dir, df)
            save_fixed_code(new_code, new_code_path)
          wd.flush()
          
  wd.close()

def save_fixed_code(code, new_path):
  with open(new_path, 'w') as f:
    f.write(code)

if __name__ == '__main__':
  wd = RepairDriver()
  _, nc = wd.run("int main() \n{return 0\n}\n")
  print(nc)
  wd.close()