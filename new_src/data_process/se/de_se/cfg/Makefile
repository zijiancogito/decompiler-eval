CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS = -shared -fPIC
INCLUDE  = -I ./ -I ../../../../utils/tree-sitter/ -I ../../../../utils/tree-sitter/tree-sitter/lib/include/
LIBS     = ../../../../utils/tree-sitter/tree-sitter/libtree-sitter.a ../../../../utils/tree-sitter/libparser.so
TARGET   = libcfg.so

OBJS     = parser.o
SRCS     = ../../../../utils/tree-sitter/vendor/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I ../../../../utils/tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) -shared -fPIC $(INCLUDE) cfg.cpp $(LIBS) $(OBJS) -o $(TARGET)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)