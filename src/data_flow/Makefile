CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS = -g -ljsoncpp
INCLUDE  = -I ./ -I ../tree-sitter/ -I ../tree-sitter/tree-sitter/lib/include/ -I ../cfg/
# TARGET   = libse.so
TARGET   = se

OBJS     = parser.o
SRCS     = ../tree-sitter/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I ../tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
#	$(CXX) -shared -fPIC $(INCLUDE) $(CXXFLAGS) decompiler_se.cpp ../tree-sitter/tree-sitter/libtree-sitter.a ../tree-sitter/libparser.so ../cfg/libcfg.so $(OBJS) -o $(TARGET)
	$(CXX) $(INCLUDE) $(CXXFLAGS) decompiler_se.cpp ../tree-sitter/tree-sitter/libtree-sitter.a ../tree-sitter/libparser.so ../cfg/libcfg.so $(OBJS) -o $(TARGET)
clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)