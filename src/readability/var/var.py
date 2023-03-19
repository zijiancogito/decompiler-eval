from tree_sitter import Language, Parser

Language.build_library(
        'build/my-language.so',
        [
                'vendor/tree-sitter-c',
        ]
)

C = Language('build/my-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C)

def make_move(cursor, move):
    if move == 'down':
        print(cursor.node.type)
        if cursor.goto_first_child():
            make_move(cursor, 'down')
        elif cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')
    elif move == 'right':
        print(cursor.node.type)
        if cursor.goto_first_child():
            make_move(cursor, 'down')
        elif cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')
    elif move == 'up':
        print(cursor.node.type)
        if cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')



def test(code):
    tree = c_parser.parse(bytes(code, "utf8"))
    root_node = tree.root_node

    cursor = tree.walk()
    make_move(cursor, 'down')

if __name__ == '__main__':
    code = """
    int main(){
    int a, b;
    printf("%d", a);
    return b;
    """
    test(code)

