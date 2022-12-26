# Make

使用c++编写，如下是Makefile文件

```makefile
CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS =
INCLUDE  = -I ./ -I ../../tree-sitter/ -I ../../tree-sitter/tree-sitter/lib/include/
TARGET   = cfg_generator

OBJS     = parser.o
SRCS     = ../../tree-sitter/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) -I ../../tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) $(INCLUDE) cfg_generator.cpp ../../tree-sitter/tree-sitter/libtree-sitter.a ../../tree-sitter/libparser.so  $(OBJS) -o $(TARGET)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
```

# Decompiler parse

对之前的 `decompiler_output_parser` 进行了更改，其对应的 Makefile 文件不变