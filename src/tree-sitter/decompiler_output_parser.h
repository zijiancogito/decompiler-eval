#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <tree_sitter/api.h>
  
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

TSLanguage *tree_sitter_c();

void init_node_list(NodeList * node_list);

void append_node(NodeList *all_nodes, TSNode data);

void free_node_list(NodeList *list);

// node_filter can filter specific type of nodes.
void make_move(TSTreeCursor *cursor, enum MOVE move, NodeList *all_nodes, const char *node_filter);

void parse_decompiler_output(TSTree *tree, const char *source, const char *node_filter);

void read_source(const char *filename, char * source_buf);
