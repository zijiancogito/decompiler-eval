CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS = -shared -fPIC
ROOT	 = /home/eval/decompiler-eval/new_src
INCLUDE  = -I ./ -I $(ROOT)/utils/tree-sitter/ -I $(ROOT)/utils/tree-sitter/tree-sitter/lib/include/
LIBS     = $(ROOT)/utils/tree-sitter/tree-sitter/libtree-sitter.a $(ROOT)/utils/tree-sitter/libparser.so
TARGET   = libcfg.so

OBJS     = parser.o
SRCS     = $(ROOT)/utils/tree-sitter/vendor/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I $(ROOT)/utils/tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) -shared -fPIC $(INCLUDE) cfg.cpp $(LIBS) $(OBJS) -o $(TARGET)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
