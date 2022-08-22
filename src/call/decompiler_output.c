// TODO: Migrate python code to C.

#include "decompiler_output_parser.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <tree_sitter/api.h>

enum Decompiler {
	HexRays,
	Ghidra,
	RetDec,
	BinaryNinja,
	Unknow	
};

void unknow_decompiler() {
	printf("ERROR: Unknow Decompiler\n");
}

void process_hexrays(const char * source) {}
void process_retdec(const char * source) {}
void process_binaryninja(const char * source) {}
void process_ghidra(const char * source) {
	char *node_filter = "";
	// Create a parser
	TSParser *parser = ts_parser_new();
	// Set the parser's language
	ts_parser_set_language(parser, tree_sitter_c());

	TSTree *tree = ts_parser_parse_string(
			parser,
			NULL,
			source,
			strlen(source)
			);
	
	parse_decompiler_output(tree, source, node_filter);

}
void process(enum Decompiler decompiler, const char * filename) {
	char * source = NULL;
	printf("%s\n", filename);
	read_source(filename, source);
	assert(source);
	printf("%s", source);
	if(decompiler == HexRays) {
		process_hexrays(source);		
	}
	else if(decompiler == Ghidra) {
		process_ghidra(source);
	}
	else if(decompiler == RetDec) {
		process_retdec(source);
	}
	else if(decompiler == BinaryNinja) {
		process_binaryninja(source);
	}
	else{
		unknow_decompiler();
	}
}

int main(){
	printf("Main Entry\n");
	process(Ghidra, "test.c");
	return 0;
}
