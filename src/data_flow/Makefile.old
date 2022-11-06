CC       = clang
CFLAGS   = -Wall -O -fPIC
CXXFLAGS =
INCLUDE  = -I ../tree-sitter/ -I ../tree-sitter/tree-sitter/lib/include
TARGET   = libse.so

OBJS     = decompiler_se.o decompiler_cfg.o
SRCS     = decompiler_se.c decompiler_cfg.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) $(INCLUDE) ../tree-sitter/tree-sitter-c/src/parser.c -c $^ 

all:$(OBJS)
	$(CC) -shared -fPIC ../tree-sitter/tree-sitter/libtree-sitter.a -o $(TARGET) $(OBJS)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
