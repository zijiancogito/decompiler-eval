#include "decompiler_output_parser.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <tree_sitter/api.h>
#include "uthash.h"

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
    int num_of_args;
}Function;

typedef struct {
	char * type_type;
	char * type_name;
}Type;

typedef struct{
	char id[20];
	Type *name;
	UT_hash_handle hh;
}VarMap;

char * get_content_in_source(int start, int end, const char *source) {
    char * content = (char*)malloc((end-start+1)*sizeof(char));
    for(int i = 0; i < end - start; i++){
	content[i] = source[start+i];
    }
    content[end-start+1] = '\0';
    return content;
}

int is_other_symbol(const char * symbol) {
	if (strcmp(symbol, "(") == 0) {
		return 1;
	}
	if (strcmp(symbol, ")") == 0) {
		return 1;
	}
	if (strcmp(symbol, ",") == 0) {
		return 1;
	}	
	return 0;
}

int parse_call_expression(TSNode node, Argument ** arguments, const char *source) {
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
    *arguments = (Argument*)malloc(child_count*sizeof(Argument));
    for(int i = 0; i< child_count; i++) {
	TSNode arg_node = ts_tree_cursor_current_node(&args);
	const char *tp = ts_node_type(arg_node);
	char *type = (char*)malloc(strlen(ts_node_type(arg_node))*sizeof(char));	    
	strcpy(type, ts_node_type(arg_node));
	(*arguments)[i].type = type;    
	int start = ts_node_start_point(arg_node).column;
	int end = ts_node_end_point(arg_node).column;
	(*arguments)[i].content = get_content_in_source(start, end, source);
	arg = ts_tree_cursor_goto_next_sibling(&args);
    }
    return child_count;
}

void parse_declaration(TSNode node, VarMap ** var_map, const char * source) {
	TSTreeCursor cursor = ts_tree_cursor_new(node);
	bool child = ts_tree_cursor_goto_first_child(&cursor);
	TSNode type_node = ts_tree_cursor_current_node(&cursor);
	const char * type_type = ts_node_type(type_node);
	child = ts_tree_cursor_goto_next_sibling(&cursor);
	TSNode identifier_node = ts_tree_cursor_current_node(&cursor);

	Type *tp = (Type*)malloc(sizeof(Type));
	tp->type_type = (char*)malloc(strlen(type_type)*sizeof(char));
	strcpy(tp->type_type, type_type);
	int type_start = ts_node_start_point(type_node).column;
	int type_end = ts_node_end_point(type_node).column;
	tp->type_name = get_content_in_source(type_start, type_end, source);

	int id_start = ts_node_start_point(identifier_node).column;
	int id_end = ts_node_end_point(identifier_node).column;
	char id[20];
        strcpy(id, get_content_in_source(id_start, id_end, source));
	
	VarMap *s;
	s = (VarMap *)malloc(sizeof(*s));
	strcpy(s->id, id);
	s->name = tp;
	HASH_ADD_STR(*var_map, id, s);
}

void build_variable_map(NodeList all_var_nodes, const char *source, VarMap **var_map){
	/* Build the map of the variables and its type.
	 *
	 */
	Node *tmp = all_var_nodes.head;
	for (int i = 0; i < all_var_nodes.listLen; i++) {
		tmp = tmp->next;
		printf("%s\n%s\n", ts_node_string(tmp->data), ts_node_type(tmp->data));	
		int start = ts_node_start_point(tmp->data).column;
		int end = ts_node_end_point(tmp->data).column;
		char * src = get_content_in_source(start, end, source);
		printf("%s\n", src);
		printf("\n");
		parse_declaration(tmp->data, var_map, source); 
	}
}

char * get_variable_name(const char * var) {
	char * result = (char*)malloc(strlen(var));
	int cnt = 0;
	for (int i = 0; i < strlen(var); i++) {
		if (var[i] != '&' && var[i] != '*') {
			result[cnt] = var[i];
			cnt++;
		}
	}
	return result;
}

void process(enum Decompiler decompiler, const char * filename) {
    char * source = read_source(filename);
    assert(source);
    printf("%s\n", source);
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
    NodeList all_call_nodes, all_var_nodes;
    parse_decompiler_output(tree, source, "call_expression", &all_call_nodes);
    parse_decompiler_output(tree, source, "declaration", &all_var_nodes);
    
    // Build map of variables and its type
    VarMap *var_map = NULL;
    build_variable_map(all_var_nodes, source, &var_map);

    // Parse all_call_nodes
    Node *tmp = all_call_nodes.head;
    Function * functions = (Function*)malloc(all_call_nodes.listLen * sizeof(Function));
    for (int i = 0; i < all_call_nodes.listLen; i++) {
	tmp = tmp->next;
	int start = ts_node_start_point(tmp->data).column;
	int end = ts_node_end_point(tmp->data).column;
	functions[i].name = get_content_in_source(start, end, source);
	functions[i].num_of_args = parse_call_expression(tmp->data, &functions[i].args, source);
    }
    for (int i = 0; i < all_call_nodes.listLen; i++) {
	printf("%s\n", functions[i].name);
	for (int j = 0; j < functions[i].num_of_args; j++) {
		if(is_other_symbol(functions[i].args[j].type) == 0) {

			printf("%s %s\n", functions[i].args[j].type, functions[i].args[j].content);
			VarMap *s = NULL;
			char * var_name = get_variable_name(functions[i].args[j].content);
			HASH_FIND_STR(var_map, var_name, s);
			// assert(s!=NULL);
			if (s != NULL)
				printf("%s\n", s->name->type_name);
		}
	}
	printf("\n");
    }
    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
}

int main(){
    process(Ghidra, "test.c");
    return 0;
}
