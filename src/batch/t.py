import re

a = "fgfvfg\nfifdv32443da1jka33vfk2jvfvdhj"

l = re.findall('v[0-9]+|a[0-9]+', a)
print(l)