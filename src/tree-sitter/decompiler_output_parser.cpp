#include <iostream>
#include <string.h>
#include "decompiler_output_parser.h"

char *get_content_in_source(int start, int end, const char *source)
{
    char *content = (char*)malloc(end-start+1);
    for(int i = 0; i < end - start; i++)
	    content[i] = source[start+i];
    content[end-start] = '\0';
    // printf("%s\n", content);
    for (int i = 0; i < strlen(content); i++) {
	    if(content[i]=='\n')
        content[i] = ' ';
	}
    return content;
}

char *get_content(TSNode node, const char *source)
{
    int start = ts_node_start_byte(node);
    int end = ts_node_end_byte(node);
    return get_content_in_source(start, end, source);
}

void init_node_list(NodeList *node_list) {
  Node *head = (Node*)malloc(sizeof(Node));
  Node *tail = (Node*)malloc(sizeof(Node));

  // Head is a NULL Node that point to the first TSNode
  // of the NodeList.
  head->next = tail;
  // Tail is a the last TSNode in the NodeList.
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

void make_move(TSTreeCursor *cursor, enum MOVE move, NodeList *all_nodes, const char *node_filter)
{
  TSNode currentNode = ts_tree_cursor_current_node(cursor);
  if (ts_node_is_null(currentNode)) {
    return ;
  }
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
    if (ts_tree_cursor_goto_next_sibling(cursor)){
      make_move(cursor, RIGHT, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      make_move(cursor, UP, all_nodes, node_filter);
    }
  }
}

void parse_decompiler_output(TSTree * tree, NodeList * all_nodes, const char *node_filter) {
  // Get the root node of the syntax tree.
  TSNode root_node = ts_tree_root_node(tree);
  // Initialize the cursor from root_node.
  TSTreeCursor cursor = ts_tree_cursor_new(root_node);
  
  // Initialize all_nodes.
  init_node_list(all_nodes);
  
  // Walk the syntax tree and get filtered nodes.
  make_move(&cursor, DOWN, all_nodes, node_filter);
}

void siplify_source(char *source)
{
  int len = strlen(source);
  for (int i = 0; i < sizeof(unnecessary)/sizeof(const char*); i ++ ) {
    char *unnecessary_position = strstr(source, unnecessary[i]);
    int sub_len = strlen(unnecessary[i]);
    while (unnecessary_position != NULL) {
      for (int j = 0; j < len - (unnecessary_position - source); j ++ )
        *(unnecessary_position + j) = *(unnecessary_position + j + sub_len);
      unnecessary_position = strstr(source, unnecessary[i]);
    }
  }
}

char *read_source(const char * filename) {
	FILE *fp = fopen(filename, "rb");
  if (fp == NULL) {
    printf("Fail to open file!\n");
    exit(0);
  }
	fseek(fp, 0, SEEK_END);
	int len = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	char *source_buf = (char*)malloc(len+1);
	fread(source_buf, 1, len+1, fp);
  siplify_source(source_buf);
	fclose(fp);
	return source_buf;
}

//int main(){
  //const char *src = "int a = func(b);";
  //const char *node_filter = "";
  //parse_decompiler_output(src, node_filter);
  //return 0;
//}

