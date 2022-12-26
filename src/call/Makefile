ifndef VERBOSE
	QUIET:=@
endif

SRC_DIR = ./src

LLVM_CONFIG?=llvm-config-10
LDFLAGS+=$(shell $(LLVM_CONFIG) --ldflags)
LDFLAGS+=-ldl -ltinfo -lpthread -L.
COMMON_FLAGS=-Wall -Wextra -fno-rtti
CXX_FLAGS+=$(COMMON_FLAGS) $(shell $(LLVM_CONFIG) --cxxflags)
CPP_FLAGS+=$(shell $(LLVM_CONFIG) --cppflags) -I$(SRC_DIR)

LLVMLIBS=$(shell $(LLVM_CONFIG) --libs --system-libs)

BUILD_DIR = build
INCLUDE_DIR = src

SRC = ir_call
OBJ = $(join $(addsuffix $(BUILD_DIR)/, $(dir $(SRC))), $(notdir $(SRC:=.o)))
EXE = $(SRC)

all: default

default: directory $(OBJ)
	@echo Linking Project
	$(QUIET) $(CXX) -I$(INCLUDE_DIR) -o $(EXE) $(CXXFLAGS) $(OBJ) $(LLVMLIBS) $(LDFLAGS)
directory:
	mkdir -p $(BUILD_DIR)



$(BUILD_DIR)/%.o : $(SRC_DIR)/%.cpp
	@echo Compiling $*.cpp
	$(QUIET) $(CXX) -fPIC -o $@ -c $(CPPFLAGS) $(CXXFLAGS) $<

clean:
	$(QUIET)rm -rf $(EXE) $(BUILD_DIR)

