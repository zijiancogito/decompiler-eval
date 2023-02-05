import json
j = """{"expressions": [{"condition": [{}], "variables": {"%37": {}}}, {"condition": [{}, {}, {}, {}], "variables": {"%37": {}}}, {"condition": [{}, {}, {}, {}], "variables": {"%37": {}}}, {"condition": [{}, {}], "variables": {"%37": {}}}], "input_symbols": null, "output_symbols": {"%37": "return0"}}"""
jj = json.loads(j)
print(json.dumps(jj, sort_keys=True, indent=4, separators=(',', ': ')))
