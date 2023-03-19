from tree_sitter import Language, Parser
import re

Language.build_library(
        'build/my-language.so',
        [
                'vendor/tree-sitter-c',
        ]
)

C = Language('build/my-language.so', 'c')

c_parser = Parser()
c_parser.set_language(C)
code = """
int main(){
    int a, b;
    printf("%d", a);
    return b;
    }
"""

def var_filter(node):
    if node.type == "declaration":
        return True
    return False

def copy_content(start, end, code):
    tmp = [list(code) for i in code.split('\n')]
    print(tmp)
    content = ''.join(tmp[start[0]][start[1]:end[1]])

    return content
    
def get_content(code, node):
    start = node.start_point
    end = node.end_point
    print(start)
    print(end)
    content = copy_content(start, end, code)
    print(content)
            
def make_move(cursor, move, ):
    print(cursor.node.type)
    get_content(code, cursor.node)
    if move == 'down':
        if cursor.goto_first_child():
            make_move(cursor, 'down')
        elif cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')
    elif move == 'right':
        if cursor.goto_first_child():
            make_move(cursor, 'down')
        elif cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')
    elif move == 'up':
        if cursor.goto_next_sibling():
            make_move(cursor, 'right')
        elif cursor.goto_parent():
            make_move(cursor, 'up')

def preprocess_code(code):
    code = re.sub('[\s]+', ' ', code.strip())
    print(code)
    return code

def parse_code(code):
    code = preprocess_code(code)
    tree = c_parser.parse(bytes(code, "utf8"))
    cursor = tree.walk()
    all_nodes = []
    make_move(cursor, 'down', all_nodes)


def test():
    global code
    code = preprocess_code(code)
    tree = c_parser.parse(bytes(code, "utf8"))
    root_node = tree.root_node

    cursor = tree.walk()
    make_move(cursor, 'down')

if __name__ == '__main__':
    test()

