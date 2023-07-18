from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By

firefox_options = webdriver.FirefoxOptions()
firefox_options.add_argument("--profile")
firefox_options.add_argument("/home/caoy/snap/firefox/common/.mozilla/firefox/usiijz40.default-release")
# firefox_options.set_capability("", "115")
# firefox_options.set_capability("driverVersion", '0.33.0')
driver = webdriver.Remote(
   command_executor='http://127.0.1.1:4444',
   options=firefox_options
)
driver.get('http://10.42.0.107:8000/ide/')


elem = driver.find_element(By.ID, "runcode")
# elem.clear()
elem.send_keys("runcode")
elem.send_keys(Keys.RETURN)
print(driver.page_source)
driver.close()