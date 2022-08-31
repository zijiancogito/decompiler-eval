#include "decompiler_output_parser.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <tree_sitter/api.h>

TSLanguage *tree_sitter_c();

enum Decompiler {
    HexRays,
    Ghidra,
    RetDec,
    BinaryNinja,
    Unknow	
};

void parse_expression(TSNode node) {
     TSTreeCursor cursor = ts_tree_cursor_new(node);

}

void process(enum Decompiler decompiler, const char * filename) {
    char * source = read_source(filename);
    assert(source);
    char * node_filter = "call_expression";
    // Create a parser
    TSParser * parser = ts_parser_new();
    // Set the parser's language
    ts_parser_set_language(parser, tree_sitter_c());
    TSTree *tree = ts_parser_parse_string(
	parser,
	NULL,
	source,
	strlen(source)
    );
    
    // Save filtered nodes in all_nodes
    NodeList all_nodes;
    parse_decompiler_output(tree, source, node_filter, &all_nodes);
    // Print all_nodes
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++) {
	tmp = tmp->next;
	printf("%s\n", ts_node_type(tmp->data));
    }

    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
}

int main(){
    printf("Main Entry\n");
    process(Ghidra, "test.c");
    return 0;
}
