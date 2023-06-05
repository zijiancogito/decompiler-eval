CC       = clang
CXX      = clang++
CFLAGS   = -Wall -O -fPIC
CXXFLAGS = -g -ljsoncpp
ROOT	 = /home/eval/decompiler-eval/new_src
NOW	 = /home/eval/decompiler-eval/new_src/process/se/de_se/
INCLUDE  = -I ./ -I $(ROOT)/utils/tree-sitter/ -I $(ROOT)/utils/tree-sitter/tree-sitter/lib/include/ -I $(NOW)/cfg/
LIBS     = $(ROOT)/utils/tree-sitter/tree-sitter/libtree-sitter.a $(ROOT)/utils/tree-sitter/libparser.so $(NOW)/cfg/libcfg.so
TARGET   = libse.so
# TARGET   = se

OBJS     = parser.o
SRCS     = $(ROOT)/utils/tree-sitter/vendor/tree-sitter-c/src/parser.c

$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -I $(ROOT)/utils/tree-sitter/tree-sitter/lib/include/ -c $(SRCS)

all:$(OBJS)
	$(CXX) -shared -fPIC $(INCLUDE) $(CXXFLAGS) se.cpp $(LIBS) $(OBJS) -o $(TARGET)
#	$(CXX) $(INCLUDE) $(CXXFLAGS) se.cpp $(LIBS) $(OBJS) -o $(TARGET)
clean:
	rm -f $(TARGET)
	rm -rf $(OBJS)
