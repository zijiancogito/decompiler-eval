CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS = -g -ljsoncpp
INCLUDE  = -I ./ -I ../../../../utils/tree-sitter/ -I ../../../../utils/tree-sitter/tree-sitter/lib/include/ -I ../cfg/
LIBS     = ../../../../utils/tree-sitter/tree-sitter/libtree-sitter.a ../../../../utils/tree-sitter/libparser.so ../cfg/libcfg.so
TARGET   = libse.so
# TARGET   = se

OBJS     = parser.o
SRCS     = ../../../../utils/tree-sitter/vendor/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I ../../../../utils/tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) -shared -fPIC $(INCLUDE) $(CXXFLAGS) se.cpp $(LIBS) $(OBJS) -o $(TARGET)
#	$(CXX) $(INCLUDE) $(CXXFLAGS) se.cpp $(LIBS) $(OBJS) -o $(TARGET)
clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)