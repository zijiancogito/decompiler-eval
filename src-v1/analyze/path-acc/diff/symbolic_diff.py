from jycm.helper import make_ignore_order_func
from jycm.jycm import YouchamaJsonDiffer
from jycm.helper import dump_html_output, open_url
from jycm.jycm import YouchamaJsonDiffer
import math
from jycm.operator import BaseOperator, IgnoreOperator
import os
import json
import re

# class 

class ExpDiff:
    def __init__(self, left, right) -> None:
        self.left = left
        self.right = right
        self.ignore_order_func=make_ignore_order_func([
            f"children",
        ])
        self.ignore_operator=[
            IgnoreOperator("tag")
        ]
        self.ycm = YouchamaJsonDiffer(left, right, ignore_order_func=self.ignore_order_func,
        custom_operators=self.ignore_operator)

        self.diff = self.ycm.get_diff()

        
    # def diff(self):
        # return self.ycm.get_diff()
    
    def dump_html(self, output_dir):
        url = dump_html_output(self.left, self.right, self.diff, output_dir)
        # open_url(url)
    
    @property
    def count_diff(self):
        cnt = 0
        for key in self.diff:
            if key == "ignore" or key == "just4vis:pairs":
                continue
            cnt += len(self.diff[key])
        return cnt
    
    def distance(self):
        dist = 0
        for key in self.diff:
            if key == "ignore" or key == "just4vis:pairs":
                continue
            for diff_i in self.diff[key]:
                obj_left = diff_i["left"]
                obj_right = diff_i["right"]
                if obj_left == "__NON_EXIST__":
                    dist += distance_one(obj_right)
                elif obj_right == "__NON_EXIST__":
                    dist += distance_one(obj_left)
                else:
                    dist += distance_two(obj_left, obj_right)
        return dist

def distance_one(obj):
    obj_s = json.dumps(obj)
    dis = len(re.findall('data', obj_s))
    return dis

def distance_two(obj_1, obj_2):
    return 1

def test():
    c_jsf = "c.json"
    ir_jsf = "ir.json"
    os.system("rm -r /home/eval/data/DSMITH/symbolic-diff")

    with open(c_jsf, 'r') as f:
        c_json = json.load(f)
    with open(ir_jsf, 'r') as f:
        ir_json = json.load(f)
    for path in c_json["paths"]:
        if path in ir_json["paths"]:
            exp_ir = ir_json["paths"][path]
            exp_c = c_json["paths"][path]
            dif = ExpDiff(exp_ir, exp_c)
            dif.dump_html("/home/eval/data/DSMITH/symbolic-diff")
            print(dif.distance())
            break
        


if __name__ == '__main__':
    test()
    

