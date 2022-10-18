
clang                                   \
  -I ../tree-sitter/tree-sitter/lib/include            \
  -I ../tree-sitter/                   \
  decompiler_cfg.c           \
  decompiler_se.c            \
  ../tree-sitter/tree-sitter-c/src/parser.c         \
  ../tree-sitter/tree-sitter/libtree-sitter.a          \
  ../tree-sitter/libparser.so  \
  -o decompiler_se
