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

typedef struct {
    char * type;
    char * content;
}Argument;

typedef struct {
    char * name;
    Argument * args; 
}Function;

void get_content_in_source(int start, int end, const char *source, char *content) {
    content = (char*)malloc((end-start+2)*sizeof(char));
    for(int i = 0; i < end - start + 1; i++){
	content[i] = source[start+i];
    }
    content[end-start+1] = '\0';
    printf("%s\n", content);
}

void parse_expression(TSNode node, Argument * arguments, const char *source) {
    /* Input node of call statement
     * Parse it
     */
    // call node cursor
    TSTreeCursor cursor = ts_tree_cursor_new(node);
    // save to params nodes
    NodeList pnodes;
    init_node_list(&pnodes);
    make_move(&cursor, DOWN, &pnodes, "argument_list"); 
    Node *tmp = pnodes.head->next;
    TSTreeCursor args = ts_tree_cursor_new(tmp->data);
    bool arg = ts_tree_cursor_goto_first_child(&args);
    int child_count = ts_node_child_count(tmp->data);
    arguments = (Argument*)malloc(child_count*sizeof(Argument));
    for(int i = 0; i< child_count; i++) {
	TSNode arg_node = ts_tree_cursor_current_node(&args);
	const char *tp = ts_node_type(arg_node);
	if(strcmp(tp,")") != 0 && strcmp(tp, "(") != 0 && strcmp(tp, ",") != 0) {
	    printf("%s %s\n", ts_node_type(arg_node), ts_node_string(arg_node));
	    char *type = (char*)malloc(strlen(ts_node_type(arg_node))*sizeof(char));
	    strcpy(type, ts_node_type(arg_node));
	    arguments[i].type = type;    
	    int start = ts_node_start_point(arg_node).column;
	    int end = ts_node_end_point(arg_node).column;
	    get_content_in_source(start, end, source, arguments[i].content);
	}
	arg = ts_tree_cursor_goto_next_sibling(&args);
    }
}

void process(enum Decompiler decompiler, const char * filename) {
    char * source = read_source(filename);
    assert(source);
    printf("%s\n", source);
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
    Function * functions = (Function*)malloc(all_nodes.listLen * sizeof(Function));
    for (int i = 0; i < all_nodes.listLen; i++) {
	tmp = tmp->next;
	printf("%s\n", ts_node_type(tmp->data));
	int start = ts_node_start_point(tmp->data).column;
	int end = ts_node_end_point(tmp->data).column;
	get_content_in_source(start, end, source, functions[i].name);
	parse_expression(tmp->data, functions[i].args, source);
	printf("\n");
    }
    for (int i = 0; i < all_nodes.listLen; i++) {
	printf("%s\n", functions[i].name);
    }
    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
}

int main(){
    process(Ghidra, "test.c");
    return 0;
}
