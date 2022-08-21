#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <tree_sitter/api.h>

TSLanguage *tree_sitter_c();

int main() {
	// Create a parser.
	TSParser *parser = ts_parser_new();

	// Set the parser's language (JSON in this case).
	ts_parser_set_language(parser, tree_sitter_c());

	// Build a syntax tree based on source code stored in a string.
	const char *source_code = "int a = func(b, c)";
	TSTree *tree = ts_parser_parse_string(
			parser,
			NULL,
			source_code,
			strlen(source_code)
			);
	// Get the root node of the syntax tree.
	TSNode root_node = ts_tree_root_node(tree);

	// Get some child nodes.
	TSNode func_node = ts_node_named_child(root_node, 0);

	// Check that the nodes have the expected types.
	// assert(strcmp(ts_node_type(root_node), "document") == 0);

	// Check that the nodes have the expected child counts.
	// assert(ts_node_child_count(root_node) == 2);
	
	// Print the syntax tree as an S-expression.
	char *string = ts_node_string(root_node);
	printf("Syntax tree: %s\n", string);

	// Free all of the head-allocated memory.
	free(string);
	ts_tree_delete(tree);
	ts_parser_delete(parser);
	return 0;
}

