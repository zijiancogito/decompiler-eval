
class DataSet:
    def __init__(self, compilers, decompilers, optimizations, colors=None) -> None:
        self.compilers = compilers
        self.decompilers = decompilers
        self.optimizations = optimizations
        self.colors = colors