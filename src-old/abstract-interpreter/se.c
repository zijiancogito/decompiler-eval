#include <stdio.h>
#include <stdlib.h>

void getAST(const char * source) {
	char *filter = "";
	// Create a parser
	TSParser * parser = ts_parser_new();
	// Set the parser's language
	ts_parser_set_language(parser, tree_sitter_c());
	
	TSTree * tree = ts_parser_parse_string(
		parser,
		NULL,
		source,
		strlen(source)
		);
	parse_decompiler_output(tree, source, filter);	
}

int main() {
	return 0;
}

