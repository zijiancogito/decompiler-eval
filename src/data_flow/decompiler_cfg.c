#include "decompiler_cfg.h"

const char *branch_statements[] = {
    /*
    "break_statement",
    "continue_statement",
    */
    "for_statement",
    "if_statement",
    "while_statement",
    "else"
};

char *get_content(TSNode node, const char *source)
{
    int start = ts_node_start_point(node).column;
    int end = ts_node_end_point(node).column;
    return get_content_in_source(start, end, source);
}

char *get_content_in_source(int start, int end, const char *source)
{
    char *content = (char*)malloc(end-start+1);
    for(int i = 0; i < end - start; i++)
	    content[i] = source[start+i];
    content[end-start] = '\0';
    // printf("%s\n", content);
    return content;
}

void init_scfg(SCFG *scfg, TSNode root_node)
{
    Branch_Node *entry = (Branch_Node*)malloc(sizeof(Branch_Node));
    TSTreeCursor cursor = ts_tree_cursor_new(root_node);

    entry->start = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
    *entry->start = cursor;
    entry->end = NULL;
    entry->id = NULL;
    entry->true_branch = NULL;
    entry->false_branch = NULL;
    scfg->entry = entry;
}

bool is_branch_statement(const char *node_type)
{
    int size = sizeof(branch_statements) / sizeof(char *);
    for (int i = 0; i < size; i ++ )
        if (strcmp(node_type, branch_statements[i]) == 0)
            return true;
    return false;
}

void add_branch(SCFG *scfg, Branch_Node **branch_map, TSTreeCursor cursor, const char *source)
{
    TSNode current_node = ts_tree_cursor_current_node(&cursor);
    Branch_Node *new_true_branch_node = (Branch_Node*)malloc(sizeof(Branch_Node));
    Branch_Node *new_false_branch_node = (Branch_Node*)malloc(sizeof(Branch_Node));
    TSTreeCursor cursor_copy = ts_tree_cursor_copy(&cursor);
    Branch_Node *tmp = scfg->entry;
    bool successful = false;

    if (strcmp(ts_node_type(current_node), "else") == 0)
    {
        ts_tree_cursor_goto_next_sibling(&cursor_copy);
        TSNode next_node = ts_tree_cursor_current_node(&cursor_copy);
        ts_tree_cursor_goto_parent(&cursor);
        TSNode par_node = ts_tree_cursor_current_node(&cursor);
        char *cnt = get_content(par_node, source);
        Branch_Node *b;
        HASH_FIND_STR(*branch_map, cnt, b);
        Branch_Node *f = b->false_branch;
        Branch_Node *else_node = (Branch_Node*)malloc(sizeof(Branch_Node));
        else_node->start = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
        *else_node->start = cursor_copy;
        else_node->id = get_content(next_node, source);
        else_node->is_else = true;
        else_node->false_branch = f;
        TSTreeCursor c_true = ts_tree_cursor_copy(&cursor_copy);
        if (strcmp(ts_node_type(next_node), "if_statement") == 0)
        {
            else_node->end = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
            *else_node->end = cursor_copy;
            ts_tree_cursor_goto_first_child(&c_true);
            ts_tree_cursor_goto_next_sibling(&c_true);
            ts_tree_cursor_goto_next_sibling(&c_true);
        }
        else
            else_node->end = NULL;

        new_true_branch_node->start = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
        *new_true_branch_node->start = c_true;
        new_true_branch_node->end = NULL;
        new_true_branch_node->id = NULL;
        new_true_branch_node->true_branch = NULL;
        new_true_branch_node->false_branch = NULL;
        new_true_branch_node->is_else = false;

        else_node->true_branch = new_true_branch_node;
        HASH_ADD_STR(*branch_map, id, else_node);

        b->false_branch = else_node;

        return ;
    }
    else
    {
        char *cnt = get_content(current_node, source);
        Branch_Node *b;
        HASH_FIND_STR(*branch_map, cnt, b);
        if (b != NULL) return ;
    }

    while (ts_tree_cursor_goto_parent(&cursor))
    {
        TSNode par_node = ts_tree_cursor_current_node(&cursor);
        char *content = get_content(par_node, source);
        Branch_Node *par_branch = NULL;
        HASH_FIND_STR(*branch_map, content, par_branch);
        if (par_branch != NULL)
        {
            if (par_branch->true_branch->end == NULL)
            {
                successful = true; 
                par_branch->true_branch->end = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
                *par_branch->true_branch->end = cursor_copy;
            }
            tmp = par_branch->true_branch;
            break;
        }
    }

    if (!successful)
    {
        while (tmp->false_branch != NULL)
            tmp = tmp->false_branch;
        tmp->end = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
        *tmp->end = cursor_copy;
    }
    
    TSNode end_node = ts_tree_cursor_current_node(tmp->end);
    tmp->id = get_content(end_node, source);
    HASH_ADD_STR(*branch_map, id, tmp);

    TSTreeCursor c_true = ts_tree_cursor_copy(tmp->end);
    ts_tree_cursor_goto_first_child(&c_true);
    ts_tree_cursor_goto_next_sibling(&c_true);
    ts_tree_cursor_goto_next_sibling(&c_true);
    new_true_branch_node->start = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
    *new_true_branch_node->start = c_true;
    new_true_branch_node->end = NULL;
    new_true_branch_node->id = NULL;
    new_true_branch_node->is_else = false;
    new_true_branch_node->true_branch = NULL;
    new_true_branch_node->false_branch = NULL;

    TSTreeCursor c_false = ts_tree_cursor_copy(tmp->end);
    bool next = ts_tree_cursor_goto_next_sibling(&c_false);
    if (next)
    {
        new_false_branch_node->start = (TSTreeCursor*)malloc(sizeof(TSTreeCursor));
        *new_false_branch_node->start = c_false;
    }
    else new_false_branch_node->start = NULL;
    new_false_branch_node->end = NULL;
    new_false_branch_node->id = NULL;
    new_false_branch_node->is_else = false;
    new_false_branch_node->true_branch = NULL;
    new_false_branch_node->false_branch = NULL;

    tmp->true_branch = new_true_branch_node;
    tmp->false_branch = new_false_branch_node;
}

void get_branches(SCFG *scfg, TSTreeCursor *cursor, enum MOVE move, Branch_Node **branch_map, const char *source) 
{
  TSNode current_node = ts_tree_cursor_current_node(cursor);
  const char *node_type = ts_node_type(current_node);
  if (move == DOWN) {
    if (is_branch_statement(node_type)){
      add_branch(scfg, branch_map, *cursor, source);
    }
    if (ts_tree_cursor_goto_first_child(cursor)) {
      get_branches(scfg, cursor, DOWN, branch_map, source);
    }
    else if (ts_tree_cursor_goto_next_sibling(cursor)) {
      get_branches(scfg, cursor, RIGHT, branch_map, source);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      get_branches(scfg, cursor, UP, branch_map, source);
    }
  }
  else if (move == RIGHT) {
    if (is_branch_statement(node_type)){
      add_branch(scfg, branch_map, *cursor, source);
    }
    if (ts_tree_cursor_goto_first_child(cursor)) {
      get_branches(scfg, cursor, DOWN, branch_map, source);
    }
    else if (ts_tree_cursor_goto_next_sibling(cursor)) {
      get_branches(scfg, cursor, RIGHT, branch_map, source);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      get_branches(scfg, cursor, UP, branch_map, source);
    }
  }
  else if (move == UP) {
    if (ts_tree_cursor_goto_next_sibling(cursor)){
      get_branches(scfg, cursor, RIGHT, branch_map, source);
    }
    else if (ts_tree_cursor_goto_parent(cursor)) {
      get_branches(scfg, cursor, UP, branch_map, source);
    }
  }
}

void get_scfg(TSTree *tree, const char *source, SCFG *scfg, Branch_Node **branch_map)
{
    TSNode root_node = ts_tree_root_node(tree);
    TSTreeCursor cursor = ts_tree_cursor_new(root_node);
    init_scfg(scfg, root_node);
    get_branches(scfg, &cursor, DOWN, branch_map, source);
}
