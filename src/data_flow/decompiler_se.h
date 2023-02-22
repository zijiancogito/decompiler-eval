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
    // std::unordered_map<Json::Value, Json::Value> *arr_expressions;
    bool is_input;
    bool is_output;
    bool is_global;
    // bool is_array;
} Variable;

enum MODE {
  FILE_NAME,
  FUNC_CNT
};

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

std::unordered_map<int, std::string> var_id_map;
std::vector<std::string> params;

void free_node_list(NodeList *node_list);

void free_variable(Variable *v);

Variable *variable_copy(Variable *v);

void print_input(std::unordered_map<std::string, Variable*> &var_map);

void create_var_map(std::unordered_map<std::string, Variable*> &var_map, TSNode var_node, const char *source, bool is_input);

void get_variables(TSTreeCursor *cursor, std::unordered_map<std::string, Variable*> &var_map, const char *source, const char *node_filter, bool is_input);

Json::Value find_input_variables(TSTree *tree, const char *source, std::unordered_map<std::string, Variable*> &var_map);

std::string opposite_relation(std::string relational_op);

// bool in_node_list(NodeList *all_nodes, TSNode node);
bool in_node_list(NodeList *all_nodes, TSNode node, const char *source);

Json::Value parse_expression(TSNode expression_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars);

Json::Value parse_assignment_expression(TSNode assign_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars);

Json::Value parse_branch_condition(TSNode con_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &brach_changed_vars, std::unordered_map<std::string, Variable*> &changed_vars, bool condition);

void symbolic_execution(CFG *cfg, CFGEdges *edge, std::unordered_map<CFGEdges*, bool> &visit, const char *source, NodeList *analyze_nodes, std::unordered_map<std::string, Variable*> &var_map, Json::Value &paths, Json::Value &conditions, Json::Value &outputs);

const char *run_se(TSTree *tree, const char * source, NodeList *analyze_nodes);

extern "C" const char *process(const char* str, MODE mode);

#endif