
clang                                   \
  -I tree-sitter/lib/include            \
  decompiler_output_parser.c            \
  tree-sitter-c/src/parser.c         \
  tree-sitter/libtree-sitter.a          \
  -o decompiler_output_parser 
