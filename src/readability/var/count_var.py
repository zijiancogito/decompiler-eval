from tree_sitter import Language, Parser

Language.build_library(
        'build/my-language.so',

        [
            'vendor/tree-sitter-c',
        ]
)

C_LANGUAGE = Language('build/my-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C_LANGUAGE)

code = """ 
int main() {
    printf("hello world");
    return 0;
    }
"""

tree = c_parser.parse(bytes(code, "utf8"))

root_node = tree.root_node

print(root_node)


