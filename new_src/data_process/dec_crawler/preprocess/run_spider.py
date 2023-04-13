import sys
from decompilerSpider import DecompilerSpider

d = DecompilerSpider()
binary_path = sys.argv[1]
save_to = sys.argv[2]
d.run(binary_path, save_to)

