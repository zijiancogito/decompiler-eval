CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS =
INCLUDE  = -I ./ -I ../tree-sitter/ -I ../tree-sitter/tree-sitter/lib/include/
TARGET   = libcfg.so

OBJS     = parser.o
SRCS     = ../tree-sitter/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I ../tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) -shared -fPIC $(INCLUDE) cfg_generator.cpp ../tree-sitter/tree-sitter/libtree-sitter.a ../tree-sitter/libparser.so  $(OBJS) -o $(TARGET)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)