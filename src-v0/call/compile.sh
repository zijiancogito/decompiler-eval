
clang                                   \
  -I ../tree-sitter/tree-sitter/lib/include            \
  -I ../tree-sitter/                   \
  -I ../data_flow/       \
  -I ./ \
  decompiler_call.c            \
  ../tree-sitter/tree-sitter-c/src/parser.c         \
  ../tree-sitter/tree-sitter/libtree-sitter.a          \
  ../tree-sitter/libparser.so  \
  ../data_flow/libse.so  \
  -o decompiler_call
