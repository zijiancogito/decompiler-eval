#ifndef DECOMPILER_SE_H
#define DECOMPILER_SE_H

#include <jsoncpp/json/json.h>
#include <tree_sitter/api.h>
#include "decompiler_output_parser.h"

extern "C" {
TSLanguage *tree_sitter_c();
}

typedef struct {
    std::string type;
    std::string name;
    Json::Value expression;
    bool is_input;
    bool is_output;
    bool is_global;
} Variable;

/*
typedef struct {
    char *type;
    char *name;
    char *value;
    bool is_input;
    bool is_global;
}Variable;
*/

std::string relational_ops[] = {
    ">=",
    "<=",
    "!=",
    "==",
    ">",
    "<",
};

std::string self_ops[] = {
    "%=",
    "&=",
    "*=",
    "+=",
    "-=",
    "/=",
    "<<=",
    ">>=",
    "^=",
    "|=",
    "++",
    "--",
};

/*
void free_variable(Variable *v);

void free_variable_list(Variable_list *var_list);

void init_condition_list(condition_list *con_list);

void append_condition(condition_list *con_list, char *condition);

void init_output_list(output_list *out_list);

void append_output(output_list *out_list, char *output);

void delete_tail_output(output_list *out_list);

void delete_output_by_num(output_list *out_list, int num);

void init_path_condition(path_condition *path);

void append_condition_list(path_condition *path, condition_list *con_list);

void delete_tail_condition_list(path_condition *path);

void init_variable_list(Variable_list *var_list);

void append_variable(Variable_list *var_list, Variable *var);

Variable *variable_copy(Variable *v);

void create_var_map(Variable **var_map, TSNode var_node, const char *source, bool is_input);

void update_var_map_with_var_list(Variable **var_map, Variable_list var_list);

void get_variables(TSTree *tree, Variable **var_map, const char *source, const char *node_filter, bool is_input);

void find_input_variables(TSTree *tree, const char *source, Variable **var_map);

TSNode *find_branch_condition(TSNode node, const char* source);

void find_for_tail(NodeList *tail_nodes, TSNode for_node);

void find_for_head(TSNode for_node, const char* source, Variable **var_map, Variable_list *changed_vars);

const char *opposite_relation(const char* relational_op);

bool belong_to(const char *op, char **ops, int size);

bool in_node_list(NodeList *all_nodes, TSNode node);

// Returns the value of the node at this time
char *parse_expression(TSNode expression_node, const char* source, Variable **var_map);

void parse_assignment_expression(TSNode assign_node, const char* source, Variable **var_map, Variable_list *changed_vars);

void parse_branch_condition(TSNode branch_node, const char* source, Variable **var_map, condition_list *true_conditions, condition_list *false_conditions);

void print_input(Variable *var_map);

void print_analyze_nodes(path_condition *path, output_list *out_list, Variable *var_map);

// void symbolic_execution(Branch_Node **branch_map, Branch_Node * root, Variable **var_map, path_condition *path, output_list *out_list, NodeList *ignore_nodes, NodeList* analyze_nodes, const char *source);

void run_se(TSTree *tree, const char * source, NodeList *analyze_nodes);
*/
#endif