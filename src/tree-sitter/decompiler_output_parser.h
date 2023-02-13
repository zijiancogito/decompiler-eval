#ifndef DECOMPILER_OUTPUT_PARSER_H_
#define DECOMPILER_OUTPUT_PARSER_H_

#include <tree_sitter/api.h>

#ifdef __cplusplus
extern "C"{
#endif

enum MOVE {
  UP,
  DOWN,
  LEFT,
  RIGHT
};

// TSNode
typedef struct Node {
  TSNode data;
  struct Node * next;
}Node;

// TSNodeList
typedef struct NodeList {
  struct Node * head;
  struct Node * tail;
  int listLen;
}NodeList;

const char *cast[] = {
    "(int)",
    "(uint)",
    "(long)",
    "(ulong)",
};

void init_node_list(NodeList * node_list);

void append_node(NodeList *all_nodes, TSNode data);

void free_node_list(NodeList *list);

// node_filter can filter specific type of nodes.
void make_move(TSTreeCursor *cursor, enum MOVE move, NodeList *all_nodes, const char *node_filter);

// void parse_decompiler_output(TSTree *tree, const char *source, const char *node_filter, NodeList *all_nodes);
void parse_decompiler_output(TSTree *tree, NodeList *all_nodes, const char *node_filter);

char *read_source(const char *filename);

char *get_content_in_source(int start, int end, const char *source);

char *get_content(TSNode node, const char *source);

#ifdef __cplusplus
}
#endif

#endif  // DECOMPILER_OUTPUT_PARSER_H_