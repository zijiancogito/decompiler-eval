#include "decompiler_output_parser.h"
// #include <assert.h>
// #include <string.h>
// #include <stdio.h>
// #include <tree_sitter/api.h>
// // 
// enum MOVE {
  // UP,
  // DOWN,
  // // LEFT,
  // RIGHT
// };

// TSNode list 
// typedef struct Node {
  // TSNode data;
  // struct Node * next;
// }Node;

// typedef struct NodeList {
  // struct Node * head;
  // struct Node * tail;
  // int listLen;
// }NodeList;

// TSLanguage *tree_sitter_c();

void init_node_list(NodeList *node_list) {
  Node *head = (Node*)malloc(sizeof(Node));
  Node *tail = (Node*)malloc(sizeof(Node));

  // Head is a NULL Node that point to the first TSNode
  // of the NodeList.
  // head->data= NULL;
  head->next = tail;
  // Tail is a the last TSNode in the NodeList.
  // tail->data= NULL;
  tail->next = NULL;
  node_list->head = head;
  node_list->tail = tail;
  node_list->listLen = 0;
}

void append_node(NodeList *all_nodes, TSNode data) {
  Node * new_tail = NULL;
  
  // Alloc space for new tail.
  new_tail = (Node*)malloc(sizeof(Node));
  // Copy data to new node.
  new_tail->next = NULL;

  // Change the old tail.
  all_nodes->tail->data = data;
  all_nodes->tail->next = new_tail;
  all_nodes->tail = new_tail;
  all_nodes->listLen++;
}    

void free_node_list(NodeList *list){
  Node *tmp = list->head;
  for(int i = 0; i < list->listLen; i++) {
    if(tmp == NULL)
      break;
    Node *p = tmp;
    tmp = tmp->next;
    free(p);
  }
  free(list->head);
}

void make_move(TSTreeCursor *cursor, enum MOVE move, NodeList *all_nodes, const char * node_filter) {
  TSNode currentNode = ts_tree_cursor_current_node(cursor);
  const char *nodeType = ts_node_type(currentNode);
  if (move == DOWN) {
    if (strcmp(node_filter, "") == 0 || strcmp(node_filter, nodeType) == 0){
      append_node(all_nodes, currentNode);
    }
    if (ts_tree_cursor_goto_first_child(cursor)) {
      make_move(cursor, DOWN, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_next_sibling(cursor)) {
      make_move(cursor, RIGHT, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      make_move(cursor, UP, all_nodes, node_filter);
    }
  }
  else if (move == RIGHT) {
    if (strcmp(node_filter, "") == 0 || strcmp(node_filter, nodeType) == 0){
      append_node(all_nodes, currentNode);
    }
    if (ts_tree_cursor_goto_first_child(cursor)) {
      make_move(cursor, DOWN, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_next_sibling(cursor)) {
      make_move(cursor, RIGHT, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      make_move(cursor, UP, all_nodes, node_filter);
    }
  }
  else if (move == UP) {
    if (strcmp(node_filter, "") == 0 || strcmp(node_filter, nodeType) == 0){
      append_node(all_nodes, currentNode);
    }
    if (ts_tree_cursor_goto_next_sibling(cursor)){
      make_move(cursor, RIGHT, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      make_move(cursor, UP, all_nodes, node_filter);
    }
  }
}

void parse_decompiler_output(TSTree * tree, const char * source, const char *node_filter){
  // Create a parser.
  // TSParser *parser = ts_parser_new();
  
  // Set the parser's language (C in this case).
  // ts_parser_set_language(parser, tree_sitter_c());

  // Build a syntax tree based on source code stored
  // in a string.
  // TSTree *tree = ts_parser_parse_string(
      // parser,
      // NULL,
      // source,
      // strlen(source)
      // );

  // Get the root node of the syntax tree.
  TSNode root_node = ts_tree_root_node(tree);
  // Initialize the cursor from root_node.
  TSTreeCursor cursor = ts_tree_cursor_new(root_node);
  
  // Save filtered nodes in all_nodes.
  NodeList all_nodes;
  init_node_list(&all_nodes);
  
  // Walk the syntax tree and get filtered nodes.
  make_move(&cursor, DOWN, &all_nodes, node_filter);
  Node *tmp = all_nodes.head;
  for (int i = 0; i < all_nodes.listLen; i++) {
    tmp = tmp->next;
    printf("%s\n", ts_node_type(tmp->data));
  }
  // ts_tree_delete(tree);
  // ts_parser_delete(parser);
}

void read_source(const char * filename, char * source_buf) {
	FILE *fp = fopen(filename, "rb");
	assert(fp);
	fseek(fp, 0, SEEK_END);
	int len = ftell(fp);
	printf("%d\n", len);
	rewind(fp);
	source_buf = (char*)malloc(len);
	printf("%s\n", source_buf);
	fread(source_buf, 0, len, fp);
	fclose(fp);
}
//int main(){
  //const char *src = "int a = func(b);";
  //const char *node_filter = "";
  //parse_decompiler_output(src, node_filter);
  //return 0;
//}

