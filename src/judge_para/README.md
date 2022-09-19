## Usage
```python
from judge import Judge
j = Judge('path/to/api.json')
j.judge('path/to/json_file')
```

## Files
`api.json`: 将收集到的`functions`转化为`json`形式存储，格式如下：

```json
{
	"funcname": {
		"para_list":[
			{
				"type": "xxx",
				"name": "xxx"
			}
		],
		"ret": "xxx",
		"variadic": false
	}
}
```

`para_list`只存储固定参数，`variadic`指是否为可变参数函数

## Output
`csv`文件，格式如下：
| functions | miss | variadic | para_nums | para_seqs|
| ------ | ------ | ------ | ------ | -----|
| gets | false | false | true | true |
|  |  |  |  |  |

其中`miss`指被检测的函数未被收集
