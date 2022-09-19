#include "decompiler_output_parser.h"

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
    if (ts_tree_cursor_goto_next_sibling(cursor)){
      make_move(cursor, RIGHT, all_nodes, node_filter);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      make_move(cursor, UP, all_nodes, node_filter);
    }
  }
}

void parse_decompiler_output(TSTree * tree, const char * source, const char *node_filter, NodeList * all_nodes){
  // Get the root node of the syntax tree.
  TSNode root_node = ts_tree_root_node(tree);
  // Initialize the cursor from root_node.
  TSTreeCursor cursor = ts_tree_cursor_new(root_node);
  
  // Initialize all_nodes.
  init_node_list(all_nodes);
  
  // Walk the syntax tree and get filtered nodes.
  make_move(&cursor, DOWN, all_nodes, node_filter);
}

char * read_source(const char * filename) {
	FILE *fp = fopen(filename, "rb");
	assert(fp);
	fseek(fp, 0, SEEK_END);
	int len = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	char * source_buf = (char*)malloc(len+1);
	fread(source_buf, 1, len+1, fp);
	fclose(fp);
	for (int i = 0; i < strlen(source_buf); i++) {
	    if(source_buf[i]=='\n')
		source_buf[i] = ' ';
	}
	return source_buf;
}

void walk_expression(TSTreeCursor * cursor) {
    
}

//int main(){
  //const char *src = "int a = func(b);";
  //const char *node_filter = "";
  //parse_decompiler_output(src, node_filter);
  //return 0;
//}

