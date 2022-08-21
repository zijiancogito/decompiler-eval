## Package
gcc=12.1.0
python=3.9.2

## Usage
```python
from process_data import ProcessData

p = ProcessData()

# process_source首先编译source.c文件，然后对生成的binary文件执行process_binary
# 编译语句：gcc -lm -Ox -g -o path/to/binary path/to/source.c
p.process_source('path/to/source.c')

# process_binary直接对binary进行操作，爬取并处理反编译结果
p.process_binary('path/to/binary')
```

## Log
设有`log.txt`文件记录爬取问题，因为请求量较大，经常出现time out或connection refused，该文件记录失败项，方便之后再次爬取