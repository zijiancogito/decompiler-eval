import os
import sys

import llvmlite.binding as llvm

import re
import json
from func_timeout import func_set_timeout

from instruction import execution_instruction

