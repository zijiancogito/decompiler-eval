#ifndef DECOMPILER_CFG_H
#define DECOMPILER_CFG_H

#include "decompiler_output_parser.h"
#include "uthash.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include <tree_sitter/api.h>

typedef struct Branch_Node {
  char *id;
  TSTreeCursor *start;
  TSTreeCursor *end;
  struct Branch_Node *true_branch;
  struct Branch_Node *false_branch;
  bool is_else;
  UT_hash_handle hh;
}Branch_Node;

// A simplified cfg
typedef struct {
  Branch_Node *entry;
  Branch_Node *exit;
}SCFG;

bool is_branch_statement(const char *node_type);

char *get_content_in_source(TSNode node, const char *source);

void init_scfg(SCFG *scfg, TSNode root_node);

void add_branch(SCFG *scfg, Branch_Node **branch_map, TSTreeCursor cursor, const char *source);

void get_branches(SCFG *scfg, TSTreeCursor *cursor, enum MOVE move, Branch_Node **branch_map, const char *source);

void get_scfg(TSTree *tree, const char *source, SCFG *scfg, Branch_Node **branch_map);

#endif
