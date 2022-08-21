// TODO: Migrate python code to C.

#include "tree-sitter/decompiler_output_parser.h"

enum Decompiler {
	HexRays,
	Ghidra,
	RetDec,
	BinaryNinja,
	Unknow	
};

void process(enum Decompiler decompiler, const char * source) {
	if(decompiler == HexRays) {
		
