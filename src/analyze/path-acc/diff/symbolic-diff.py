from jycm.helper import make_ignore_order_func
from jycm.jycm import YouchamaJsonDiffer
from jycm.helper import dump_html_output, open_url
from jycm.jycm import YouchamaJsonDiffer
import math
from jycm.operator import BaseOperator


# class 

class ExpDiff:
    def __init__(self, left, right) -> None:
        self.ycm = YouchamaJsonDiffer(left, right, ignore_order_func=make_ignore_order_func([
            f"^children$",
        ]))
        
        pass

