
clang                                   \
  -I ../tree-sitter/tree-sitter/lib/include            \
  -I ../tree-sitter/                   \
  -I ./ \
  decompiler_call_old.c            \
  ../tree-sitter/tree-sitter-c/src/parser.c         \
  ../tree-sitter/tree-sitter/libtree-sitter.a          \
  ../tree-sitter/libparser.so  \
  -o decompiler_call
