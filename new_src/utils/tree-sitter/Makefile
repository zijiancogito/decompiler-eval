CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS =
INCLUDE  = -I ./ -I tree-sitter/lib/include
TARGET   = libparser.so

OBJS     = decompiler_output_parser.o
SRCS     = decompiler_output_parser.cpp decompiler_output_parser.h

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) $(INCLUDE) vendor/tree-sitter-c/src/parser.c -c $^ 

all:$(OBJS)
	$(CXX) -shared -fPIC tree-sitter/libtree-sitter.a -o $(TARGET) $(OBJS)

clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
