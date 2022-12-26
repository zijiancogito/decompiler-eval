#include "ir_call.h"

using namespace llvm;

int parse_bc(const char * filename, const char * filter) {
	StringRef fname = filename;
	LLVMContext context;

	// Read bitcode file.
	ErrorOr<std::unique_ptr<MemoryBuffer>> fileOrErr = 
		MemoryBuffer::getFileOrSTDIN(fname);
	if (std::error_code ec = fileOrErr.getError()) 
	{
		std::cerr << " Error opening input file: " + ec.message() << std::endl;
		return 2;
	}

	// Parse bitcode file and get module.
	Expected<std::unique_ptr<Module>> moduleOrErr =
		parseBitcodeFile(fileOrErr.get()->getMemBufferRef(), context);
	if (std::error_code ec = fileOrErr.getError()) 
	{
		std::cerr << " Error reading Module: " + ec.message() << std::endl;
		return 3;
	}

	// Read module.
	std::unique_ptr<Module> m = std::move(moduleOrErr.get());
	std::cout << "Successfully read Module: " << std::endl;
	// Print Name of Module.
	std::cout << " Name: " << m->getName().str() << std::endl;
	// Print Target triple
	std::cout << " Target triple: " << m->getTargetTriple() << std::endl;

	// Iter functions.
	for (auto func_iter = m->getFunctionList().begin(); func_iter != m->getFunctionList().end(); func_iter++)
	{
		Function &func = *func_iter;
		// Get name of function.
		std::string func_name = func.getName().str();

		// Iter basic blocks.
		for (auto bb_iter = func.getBasicBlockList().begin(); bb_iter != func.getBasicBlockList().end(); bb_iter++) 
		{
			BasicBlock &bb = *bb_iter;
			std::string bb_name = bb.getName().str();

			// Iter Instructions.
			for(auto inst_iter = bb.begin(); inst_iter != bb.end(); inst_iter++) 
			{
				Instruction &inst = *inst_iter;
				// Get opcode.
				std::string opcode = inst.getOpcodeName();
				if (strcmp(filter, "") != 0 && strcmp(filter,opcode.c_str())==0)
				{
					std::cout << opcode << std::endl;				
				} else if (strcmp(filter, "") == 0) 
				{
					std::cout << opcode << std::endl;
				}	
			
			}
		}
	}
	return 0;
}

int main(int argc, char *argv[]) {
	const char * filename = "test.bc";
	const char * filter = "call";
	int res = parse_bc(filename, filter);


}
