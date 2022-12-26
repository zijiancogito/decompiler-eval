CC       = clang
CFLAGS   = -Wall -O -fPIC
CXXFLAGS =
INCLUDE  = -I ./ -I tree-sitter/lib/include
TARGET   = libparser.so

OBJS     = decompiler_output_parser.o
SRCS     = decompiler_output_parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) $(INCLUDE) tree-sitter-c/src/parser.c -c $^ 

all:$(OBJS)
	$(CC) -shared -fPIC tree-sitter/libtree-sitter.a -o $(TARGET) $(OBJS)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
