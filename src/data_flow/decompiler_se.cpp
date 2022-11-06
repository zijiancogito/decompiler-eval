#include <iostream>
#include <cstring>
#include <unordered_map>
#include <algorithm>
#include <assert.h>
#include "../cfg/cfg_generator.h"
#include "decompiler_se.h"

void free_node_list(NodeList *node_list)
{
    Node *tmp = NULL;
    while (node_list->head != NULL)
    {
        tmp = node_list->head;
        node_list->head = node_list->head->next;
        free(tmp);
    }
}

void free_variable(Variable *v)
{
    if (v == NULL)
        return;
    if (v->type != NULL)
    {
        free(v->type);
        v->type = NULL;
    }
    if (v->name != NULL)
    {
        free(v->name);
        v->name = NULL;
    }
    if (v->value != NULL)
    {
        free(v->value);
        v->value = NULL;
    }
    free(v);
    v = NULL;
}

void free_variable_list(Variable_list *var_list)
{
    Variable_node *tmp = NULL;
    while (var_list->head != NULL)
    {
        tmp = var_list->head;
        var_list->head = var_list->head->next;
        free_variable(tmp->var);
        free(tmp);
    }
}

void init_condition_list(condition_list *con_list)
{
    condition_node *head = (condition_node*)malloc(sizeof(condition_node));
    condition_node *tail = (condition_node*)malloc(sizeof(condition_node));

    head->next = tail;
    
    head->condition = NULL;
    tail->condition = NULL;
    tail->next = NULL;
    con_list->head = head;
    con_list->tail = tail;
    con_list->len = 0;
}

void append_condition(condition_list *con_list, char *condition)
{
    condition_node * new_tail = NULL;
  
    // Alloc space for new tail.
    new_tail = (condition_node*)malloc(sizeof(condition_node));
    // Copy data to new node.
    new_tail->next = NULL;
    new_tail->condition = NULL;

    // Change the old tail.
    con_list->tail->condition = condition;
    con_list->tail->next = new_tail;
    con_list->tail = new_tail;
    con_list->len++;
}

void init_output_list(output_list *out_list)
{
    output_node *head = (output_node*)malloc(sizeof(output_node));
    output_node *tail = (output_node*)malloc(sizeof(output_node));

    head->next = tail;
    tail->prev = head;
    
    head->output = NULL;
    head->prev = NULL;
    tail->output = NULL;
    tail->next = NULL;
    out_list->head = head;
    out_list->tail = tail;
    out_list->len = 0;
}

void append_output(output_list *out_list, char *output)
{
    output_node * new_tail = NULL;
  
    // Alloc space for new tail.
    new_tail = (output_node*)malloc(sizeof(output_node));
    // Copy data to new node.
    new_tail->prev = out_list->tail;
    new_tail->next = NULL;
    new_tail->output = NULL;

    // Change the old tail.
    out_list->tail->output = output;
    out_list->tail->next = new_tail;
    out_list->tail = new_tail;
    out_list->len++;
}

void delete_tail_output(output_list *out_list)
{
    if (out_list->len == 0) return ;
    output_node *del = out_list->tail->prev;
    del->prev->next = del->next;
    del->next->prev = del->prev;

    free(del->output);
    free(del);

    out_list->len -- ;
}

void delete_output_by_num(output_list *out_list, int num)
{
    while (num --)
    {
        delete_tail_output(out_list);
    }
}

void init_path_condition(path_condition *path)
{
    condition_list *head = (condition_list*)malloc(sizeof(condition_list));
    condition_list *tail = (condition_list*)malloc(sizeof(condition_list));

    head->next = tail;
    tail->prev = head;
    
    head->head = NULL;
    head->tail = NULL;
    head->prev = NULL;
    head->len = 0;

    tail->head = NULL;
    tail->tail = NULL;
    tail->next = NULL;
    tail->len = 0;

    path->head = head;
    path->tail = tail;
    path->len = 0;
}

void append_condition_list(path_condition *path, condition_list *con_list)
{
    path->tail->prev->next = con_list;
    con_list->prev = path->tail->prev;
    con_list->next = path->tail;
    path->tail->prev = con_list;
    path->len ++ ;
}

void delete_tail_condition_list(path_condition *path)
{
    condition_list *del = path->tail->prev;
    if (del == path->head) return;
    del->prev->next = path->tail;
    path->tail->prev = del->prev;
    path->len -- ;

    condition_node *tmp = del->head;
    
    for (int i = 0; i < del->len; i ++ )
    {
        tmp = tmp->next;
        free(tmp->condition);
    }
    
    while (del->head != NULL)
    {
        tmp = del->head;
        del->head = del->head->next;
        free(tmp);
    }

    free(del);

}

void init_variable_list(Variable_list *var_list)
{
    Variable_node *head = (Variable_node*)malloc(sizeof(Variable_node));
    head->var = NULL;
    head->next = NULL;
    var_list->head = head;
    var_list->len = 0;
}

void append_variable(Variable_list *var_list, Variable *var)
{
    // Head insertion method
    Variable_node * new_var = NULL;
    new_var = (Variable_node*)malloc(sizeof(Variable_node));
    new_var->var = var;
    new_var->next = var_list->head->next;
    var_list->head->next = new_var;
    var_list->len++;
}

Variable *variable_copy(Variable *v)
{
    Variable *new_v = (Variable *)malloc(sizeof(Variable));
    new_v->is_input = v->is_input;
    new_v->is_global = v->is_global;
    new_v->type = NULL;
    new_v->name = NULL;
    new_v->value = NULL;
    if (v->type != NULL)
    {
        new_v->type = (char*)malloc(strlen(v->type) + 1);
        strcpy(new_v->type, v->type);
    }
    if (v->name != NULL)
    {
        new_v->name = (char*)malloc(strlen(v->name) + 1);
        strcpy(new_v->name, v->name);
    }
    if (v->value != NULL)
    {
        new_v->value = (char*)malloc(strlen(v->value) + 1);
        strcpy(new_v->value, v->value);
    }
    return new_v;
}

void create_var_map(std::unordered_map<std::string, Variable*> &var_map, TSNode var_node, const char *source, bool is_input)
{
    TSTreeCursor cursor = ts_tree_cursor_new(var_node);
    ts_tree_cursor_goto_first_child(&cursor);
    TSNode type_node = ts_tree_cursor_current_node(&cursor);
    ts_tree_cursor_goto_next_sibling(&cursor);
    TSNode identifier_node = ts_tree_cursor_current_node(&cursor);

    char *type = get_content(type_node, source);
    char *name = get_content(identifier_node, source);
    
    if (strstr(name, "*") != NULL)
    {
        int num = 0;
        for (int i = 0; i < strlen(name); i ++ )
            if (name[i] == '*') num ++;
        char *tmp_type = type;
        char *tmp_name = name;
        type = (char*)malloc(strlen(tmp_type) + 1 + num);
        name = (char*)malloc(strlen(tmp_name) + 1 - num);
        strcpy(type, tmp_type);
        for (int i = 0; i < num; i ++ )
            strcat(type, "*");
        strcpy(name, tmp_name + num);
    }

    if (strcmp(type, "void") == 0)
        return ;

    Variable *v;
    v = (Variable *)malloc(sizeof(*v));
    v->type = type;
    v->name = name;
    v->value = NULL;
    v->is_input = is_input;
    v->is_global = false;
    var_map.emplace(name, v);
}

void get_variables(TSTree *tree, std::unordered_map<std::string, Variable*> &var_map, const char *source, const char *node_filter, bool is_input)
{
    NodeList all_nodes;
    parse_decompiler_output(tree, &all_nodes, node_filter);
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++)
    {
        tmp = tmp->next;
        create_var_map(var_map, tmp->data, source, is_input);
    }
}

void find_input_variables(TSTree *tree, const char *source, std::unordered_map<std::string, Variable*> &var_map)
{
    NodeList all_nodes;
    parse_decompiler_output(tree, &all_nodes, "call_expression");
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++) {
        tmp = tmp->next;
        TSNode func_node = ts_node_child(tmp->data, 0);
        char *content = NULL;
        content = get_content(func_node, source);

        if (strstr(content, "scanf") != NULL)
        {
            TSNode argument_node = ts_node_child(tmp->data, 1);
            TSTreeCursor cursor = ts_tree_cursor_new(argument_node);
            NodeList pnodes;
            init_node_list(&pnodes);
            make_move(&cursor, DOWN, &pnodes, "identifier");
            Node *tmp = pnodes.head;
            for (int j = 0; j < pnodes.listLen; j ++ )
            {
                tmp = tmp->next;
                char *name = get_content(tmp->data, source);
                Variable *v = NULL;
                if (var_map.find(name) != var_map.end())
                {
                    v = var_map.at(name);
                    // printf("%s\n", v->name);
                    v->is_input = true;
                }
            }
        }

        free(content);
    }
}

const char *opposite_relation(const char* relational_op)
{
    for (int i = 0; i < 6; i ++ )
        if (relational_ops[i] == relational_op)
            return relational_ops[5 - i];
    return NULL;
}

bool belong_to(const char *op, const char **ops, int size)
{
    for (int i = 0; i < size; i ++ )
    {
        if (strcmp(op, ops[i]) == 0)
            return true;;
    }
    return false;
}

bool in_node_list(NodeList *all_nodes, TSNode node)
{
    Node *tmp = all_nodes->head;
    for (int i = 0; i < all_nodes->listLen; i ++)
    {
        tmp = tmp->next;
        if (ts_node_eq(node, tmp->data))
        {
            return true;
        }
    }
    return false;
}

char *parse_expression(TSNode expression_node, const char* source, std::unordered_map<std::string, Variable*> &var_map)
{
    const char *node_type = ts_node_type(expression_node);
    if (strcmp("identifier", node_type) == 0)
    {
        char *id_name = get_content(expression_node, source);
        Variable *v = NULL;
        // Use variable name to find the variable struct, if
        // not found, the variable is considered global
        if (var_map.find(id_name) == var_map.end())  
        {
            Variable *new_v;
            new_v = (Variable *)malloc(sizeof(Variable));
            new_v->type = NULL;
            new_v->name = id_name;
            new_v->value = NULL;
            new_v->is_input = false;
            new_v->is_global = true;  // set the global field to ture
            var_map.emplace(id_name, new_v);
        }
        v = var_map.at(id_name);
        char *cnt = NULL;
        if (v->value != NULL)  // check whether the variable is assigned
        {
            cnt = (char*)malloc(strlen(v->value) + 1);
            strcpy(cnt, v->value);  // get the variable value
            return cnt;
        }
        else
        {
            cnt = (char*)malloc(strlen(v->name) + 1);
            strcpy(cnt, v->name);  // get the variable name (the variable is not assigned)
            return cnt;
        }
    }
    else if (strstr(node_type, "_literal") != NULL && strstr(node_type, "literal_") == NULL)
    {
        // Get the value of the literal directly
        return get_content(expression_node, source);
    }
    else if (strcmp("cast_expression", node_type) == 0)
    {
        // Get the variable node from a cast node and parse it
        TSNode cnt_node = ts_node_child(expression_node, 3);
        return parse_expression(cnt_node, source, var_map);
    }
    else if (strcmp("pointer_expression", node_type) == 0)
    {
        TSNode pointer_node = ts_node_child(expression_node, 0);

        // if reference, return the source content directly
        if (strcmp(ts_node_type(pointer_node), "&") == 0)
            return get_content(expression_node, source);
        
        // if dereference, parse the variable node
        TSNode cnt_node = ts_node_next_sibling(pointer_node);
        char *cnt = parse_expression(cnt_node, source, var_map);
        char *full_cnt = (char*)malloc(strlen("*") + strlen(cnt) + 1);
        strcpy(full_cnt, "*");
        strcat(full_cnt, cnt);
        free(cnt);
        return full_cnt;
    }
    else if (strcmp("parenthesized_expression", node_type) == 0)
    {
        // parse the node in parentheses
        TSNode cnt_node = ts_node_child(expression_node, 1);
        char *cnt = parse_expression(cnt_node, source, var_map);
        char *full_cnt = (char*)malloc(strlen("(") + strlen(cnt) + strlen(")") + 1);
        strcpy(full_cnt, "(");
        strcat(full_cnt, cnt);
        strcat(full_cnt, ")");
        free(cnt);
        return full_cnt;
    }
    else if (strcmp("binary_expression", node_type) == 0)
    {
        TSNode left = ts_node_child(expression_node, 0);
        TSNode right = ts_node_child(expression_node, 2);
        char *cnt1 = parse_expression(left, source, var_map);
        const char *cnt2 = ts_node_type(ts_node_child(expression_node, 1));
        char *cnt3 = parse_expression(right, source, var_map);
        char *full_cnt = (char*)malloc(strlen(cnt1) + strlen(cnt2) + strlen(cnt3) + 1);
        strcpy(full_cnt, cnt1);
        strcat(full_cnt, cnt2);
        strcat(full_cnt, cnt3);
        free(cnt1);
        free(cnt3);
        return full_cnt;
    }
    else if (strcmp("update_expression", node_type) == 0)
    {
        // Only consider identifier update
        TSNode first_node = ts_node_child(expression_node, 0);
        TSNode second_node = ts_node_child(expression_node, 1);
        char *cnt = NULL, *full_cnt = NULL;
        if (strcmp(ts_node_type(second_node), "++") == 0 || strcmp(ts_node_type(second_node), "--") == 0)
        {
            // postfix operation, return the variable itself
            full_cnt = get_content(first_node, source);
        }
        else
        {
            // prefix operation, the variable incremented/decremented by one
            const char *op = ts_node_type(first_node);
            cnt = get_content(second_node, source);
            char *single_op = (char*)malloc(strlen(op) + 1);
            strcpy(single_op, op);
            single_op[strlen(op) - 1] = '\0';
            char *full_cnt = (char*)malloc(strlen(cnt) + strlen(single_op) + strlen("1") + 1);
            strcpy(full_cnt, cnt);
            strcat(full_cnt, single_op);
            strcat(full_cnt, "1");
        }

        return full_cnt;
    }
    else if (strcmp("call_expression", node_type) == 0)
    { // parse each argument of the function

        char *func_name = get_content(ts_node_child(expression_node, 0), source);
        // get argument_list node
        TSNode argument_list = ts_node_child(expression_node, 1);
        int argument_num = ts_node_child_count(argument_list);
        char **arguments = (char**)malloc(sizeof(char*) * argument_num);
        int real_arg_num = 0, length = strlen(func_name) + strlen("(") + strlen(")");
        for (int i = 0; i < argument_num; i ++ )
        {  // parse arguments one by one
            TSNode argument = ts_node_child(argument_list, i);
            const char *argument_type = ts_node_type(argument);
            if (strcmp(argument_type, "(") != 0 && strcmp(argument_type, ",") != 0 && strcmp(argument_type, ")") != 0)
            {
                arguments[real_arg_num ++ ] = parse_expression(argument, source, var_map);
                length += strlen(arguments[real_arg_num - 1]);
            }
        }
        if (real_arg_num > 0)
            length += (real_arg_num - 1) * strlen(", ");
        char *func = (char*)malloc(length + 1);
        strcpy(func, func_name);
        strcat(func, "(");
        if (real_arg_num > 0)
        {
            strcat(func, arguments[0]);
            free(arguments[0]);
        }
        for (int i = 1; i < real_arg_num; i ++ )
        {
            strcat(func, ", ");
            strcat(func, arguments[i]);
            free(arguments[i]);
        }
        strcat(func, ")");
        free(func_name);
        free(arguments);
        return func;
    }
    else if (strcmp("return_statement", node_type) == 0)
    {
        TSNode return_node = ts_node_child(expression_node, 1);
        char *return_cnt = parse_expression(return_node, source, var_map);
        if (return_cnt == NULL)
            return NULL;
        char *full_cnt = (char*)malloc(strlen("return ") + strlen(return_cnt) + 1);
        strcpy(full_cnt, "return ");
        strcat(full_cnt, return_cnt);
        free(return_cnt);
        return full_cnt;
    }

    return NULL;
}

void parse_assignment_expression(TSNode assign_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars)
{
    TSNode var_node;
    char *value = NULL;  // The value of the variable obtained by this assignment statement
    if (strcmp(ts_node_type(assign_node), "update_expression") == 0)
    {  // Only consider identifier update

        // If it is an update statement, the variable is considered to be an
        // iteration variable, and can be retained as an output value.
        TSNode first_node = ts_node_child(assign_node, 0);
        TSNode second_node = ts_node_child(assign_node, 1);
        TSNode op_node;
        if (strcmp(ts_node_type(second_node), "++") == 0 || strcmp(ts_node_type(second_node), "--") == 0)
        {
            var_node = first_node;
            op_node = second_node;
        }
        else
        {
            var_node = second_node;
            op_node = first_node;
        }

        // set the value
        const char *op = ts_node_type(op_node);
        char *cnt = get_content(var_node, source);
        char *single_op = (char*)malloc(strlen(op) + 1);
        strcpy(single_op, op);
        single_op[strlen(op) - 1] = '\0';
        value = (char*)malloc(strlen(cnt) + strlen(single_op) + strlen("1") + 1);
        strcpy(value, cnt);
        strcat(value, single_op);
        strcat(value, "1");
        free(cnt);
        free(single_op);
    }
    else
        var_node = ts_node_child(assign_node, 0);

    // Find variable node from the var_map by variable name
    const char* var_type = ts_node_type(var_node);
    char *var_name = get_content(var_node, source);
    Variable *v = NULL;
    if (var_map.find(var_name) == var_map.end())  // If not found, the variable is considered global
    {
        Variable *new_v;
        new_v = (Variable *)malloc(sizeof(Variable));
        new_v->type = NULL;
        new_v->name = var_name;
        new_v->value = NULL;
        new_v->is_input = false;
        new_v->is_global = true;  // set the global field to ture
        var_map.emplace(var_name, new_v);
    }
    v = var_map.at(var_name);

    // After the assignment statement, the value of the variable will  
    // change, record the previous value, convenient recovery
    Variable *changed_v = variable_copy(v);
    changed_vars.emplace(changed_v->name, changed_v);
    char *append = NULL;

    if (strcmp(ts_node_type(assign_node), "update_expression") != 0)
    {  // set the value
        TSNode right_node = ts_node_child(assign_node, 2);
        TSNode op_node = ts_node_child(assign_node, 1);
        const char *op = ts_node_type(op_node);
        if (belong_to(op, self_ops, 12))  // "+=", "-=", "*=", etc.
        {  // Lvalue variable of self-operate statements is 
           // also considered to be a iteration variable
            v->value = NULL;
            char *single_op = (char*)malloc(strlen(op) + 1);
            strcpy(single_op, op);
            single_op[strlen(op) - 1] = '\0';
            append = (char*)malloc(strlen(var_name) + strlen(single_op) + 1);
            strcpy(append, var_name);
            strcat(append, single_op);
            free(single_op);
        }
        
        if (v->value != NULL)
        {   // Check that the right expression contains Lvalue variable, if
            // it does, consider the variable as an iteration variable
            TSTreeCursor cursor = ts_tree_cursor_new(right_node);
            NodeList all_nodes;
            init_node_list(&all_nodes);
            make_move(&cursor, DOWN, &all_nodes, var_type);
            Node *tmp = all_nodes.head;
            for (int i = 0; i < all_nodes.listLen; i++ )
            {
                tmp = tmp->next;
                char *cnt = get_content(tmp->data, source);
                if (strcmp(cnt, v->name) == 0)
                {
                    v->value = NULL;
                    break;
                }
            }
        }

        value = parse_expression(right_node, source, var_map);
    }
    if (append == NULL)
    {
        v->value = (char*)malloc(strlen(value) + 1);
        strcpy(v->value, value);
    }
    else
    {
        v->value = (char*)malloc(strlen(append) + strlen(value) + 1);
        strcpy(v->value, append);
        strcat(v->value, value);
    }
}

void print_input(std::unordered_map<std::string, Variable*> &var_map)
{
    printf("input:  ");
    Variable *v = NULL;
    for (std::unordered_map<std::string, Variable*>::iterator it = var_map.begin(); it != var_map.end(); it ++) {
        v = (*it).second;
        if (v->is_input)
            printf("%s  ", v->name);
    }
    printf("\n");
}

char *parse_branch_condition(TSNode con_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, bool condition)
{
    const char *node_type = ts_node_type(con_node);
    if (strcmp(node_type, "binary_expression") == 0)
    {
        TSNode left_node = ts_node_child(con_node, 0);
        TSNode op_node = ts_node_child(con_node, 1);
        TSNode right_node = ts_node_child(con_node, 2);
        const char *op_type = ts_node_type(op_node);
        if (belong_to(op_type, relational_ops, 6))
        {
            char *left_cnt = parse_expression(left_node, source, var_map);
            char *right_cnt = parse_expression(right_node, source, var_map);
            char *cnt = NULL;

            if (condition == false) {
                op_type = opposite_relation(op_type);
            }

            cnt = (char*)malloc(strlen(left_cnt) + strlen(op_type) + strlen(right_cnt) + 1);
            strcpy(cnt, left_cnt);
            strcat(cnt, op_type);
            strcat(cnt, right_cnt);

            free(left_cnt);
            free(right_cnt);
            return cnt;
        }
    }
    else if (strcmp(node_type, "parenthesized_expression") == 0)
    {
        TSNode child = ts_node_child(con_node, 1);
        parse_branch_condition(child, source, var_map, condition);
    }
    else if (strcmp(node_type, "unary_expression") == 0)
    {
        TSNode unary_node = ts_node_child(con_node, 0);
        if (strcmp(ts_node_type(unary_node), "!") == 0)
        {
            TSNode expression_node = ts_node_child(con_node, 1);
            char *expression_cnt = parse_expression(expression_node, source, var_map);
            const char *op = NULL;

            if (condition == true) {
                op = "==0";
            } else {
                op = "!=0";
            }

            char *cnt = (char*)malloc(strlen(expression_cnt) + strlen(op) + 1);

            strcpy(cnt, expression_cnt);
            strcat(cnt, op);

            free(expression_cnt);
            return cnt;
        }
    }
    else
    {
        char *expression_cnt = parse_expression(con_node, source, var_map);
        const char *op = NULL;

        if (condition == true) {
            op = "==0";
        } else {
            op = "!=0";
        }

        char *cnt = (char*)malloc(strlen(expression_cnt) + strlen("!=0") + 1);

        strcpy(cnt, expression_cnt);
        strcat(cnt, op);

        free(expression_cnt);
        return cnt;
    }
    
    return NULL;
}

void symbolic_execution(CFG *cfg, CFGEdges *edge, std::unordered_map<CFGEdges*, bool> &visit, const char *source, NodeList *analyze_nodes, std::unordered_map<std::string, Variable*> &var_map, std::vector<std::string> &conditions, std::vector<std::string> &outputs) 
{
    BasicBlock *bb = edge->get_destination();
    if (bb == cfg->get_exit()) {
        // print
        for (int i = 0; i < conditions.size(); i ++ ) {
            std::cout << conditions.at(i) << ", ";
        }
        printf("output: ");
        for (int i = 0; i < outputs.size(); i ++ ) {
            std::cout << outputs.at(i) << "  ";
        }
        puts("");
        return ;
    }
    // Only enter loop once
    if (visit.at(edge) == true) return ;
    visit.at(edge) = true;

    // Only enter "do while" once
    if (strcmp(ts_node_type(bb->get_contained_nodes().at(0)), "do") == 0) {
        BasicBlock *src_bb = edge->get_source();
        std::vector<BasicBlock*> bbs = cfg->get_bbs();
        std::vector<BasicBlock*>::iterator src_it = std::find(bbs.begin(), bbs.end(), src_bb);
        if (src_it != bbs.end()) {
            std::vector<BasicBlock*>::iterator des_it = std::find(bbs.begin(), bbs.end(), bb);
            if (src_it - des_it > 0)
                return ;
        }
    }

    std::unordered_map<std::string, Variable*> changed_vars;
    std::vector<CFGEdges*> out_edges = bb->get_out_edges();
    std::vector<TSNode> nodes = bb->get_contained_nodes();
    int output_num = 0;

    // parse statements in basic block
    for (int i = 0; i < nodes.size(); i ++ ) {
        TSNode node = nodes.at(i);
        const char *node_type = ts_node_type(node);
        if (strcmp(node_type, "assignment_expression") == 0 || strcmp(node_type, "update_expression") == 0) {
            // Parse assignment statements and update variable values
            parse_assignment_expression(node, source, var_map, changed_vars);
        }
        // match the nodes to analyze and perform the analysis
        if (strcmp(node_type, "switch_statement") == 0 || strcmp(node_type, "case_statement") == 0)
            continue;
        NodeList sub_nodes;
        TSTreeCursor cursor = ts_tree_cursor_new(node);
        init_node_list(&sub_nodes);
        make_move(&cursor, DOWN, &sub_nodes, "");
        Node *tmp = sub_nodes.head;
        for (int j = 0; j < sub_nodes.listLen; j ++)
        {
            tmp = tmp->next;
            if (in_node_list(analyze_nodes, tmp->data)) {
                char *out_put = parse_expression(tmp->data, source, var_map);
                output_num ++;
                outputs.push_back(out_put);
            }
        }
    }

    // judge switch statement
    bool is_switch = false;
    char *switch_condition = NULL;
    TSNode n = nodes.back();
    is_switch = (strcmp(ts_node_type(n), "switch_statement") == 0);
    if (is_switch) {
        TSNode con_node = ts_node_child_by_field_name(n, "condition", strlen("condition"));
        TSNode cnt_node = ts_node_child(con_node, 1);
        switch_condition = parse_expression(cnt_node, source, var_map);
    }

    // DFS
    for (int i = 0; i < out_edges.size(); i ++ ) {
        CFGEdges *out_edge = out_edges.at(i);
        char *con = NULL;
        if (out_edge->get_condition() == TRUE) {
            con = parse_branch_condition(nodes.back(), source, var_map, true);
            if (con != NULL)
                conditions.push_back(con);
        } else if (out_edge->get_condition() == FALSE) {
            con = parse_branch_condition(nodes.back(), source, var_map, false);
            if (con != NULL)
                conditions.push_back(con);
        } else if (is_switch && switch_condition != NULL) {
            // TODO: consider the situation of switch statement
            BasicBlock *des_bb = out_edge->get_destination();
            TSNode case_node = des_bb->get_contained_nodes().at(0);
            TSNode type_node = ts_node_child(case_node, 0);
            if (strcmp(ts_node_type(type_node), "case") == 0) {
                TSNode value_node = ts_node_child_by_field_name(case_node, "value", strlen("value"));
                char *value = parse_expression(value_node, source, var_map);
                con = (char*)malloc(strlen(switch_condition) + strlen("==") + strlen(value) + 1);
                strcpy(con, switch_condition);
                strcat(con, "==");
                strcat(con, value);
                conditions.push_back(con);
                free(value);
            } else {
                // default
                con = switch_condition;
                std::string condition;
                for (int j = 0; j < out_edges.size(); j ++ ) {
                    CFGEdges *edge = out_edges.at(j);
                    if (edge->get_condition() == JMP) {
                        BasicBlock *des_bb = edge->get_destination();
                        TSNode case_node = des_bb->get_contained_nodes().at(0);
                        TSNode type_node = ts_node_child(case_node, 0);
                        if (strcmp(ts_node_type(type_node), "case") == 0) {
                            TSNode value_node = ts_node_child_by_field_name(case_node, "value", strlen("value"));
                            char *value = parse_expression(value_node, source, var_map);
                            condition.append(switch_condition);
                            condition.append("!=");
                            condition.append(value);
                            condition.append(", ");
                            free(value);
                        }
                    }
                }
                condition = condition.substr(0, condition.length() - 2);
                conditions.push_back(condition);
            }
        }
        symbolic_execution(cfg, out_edge, visit, source, analyze_nodes, var_map, conditions, outputs);
        // Restore the site
        if (con != NULL)
            conditions.pop_back();
    }

    // Restore the site
    while (output_num -- ) outputs.pop_back();
    for (std::unordered_map<std::string, Variable*>::iterator it = changed_vars.begin(); it != changed_vars.end(); it ++ ) {
        Variable *replaced = var_map.at((*it).first);
        var_map.at((*it).first) = (*it).second;
    }
    visit.at(edge) = false;
}

void run_se(TSTree *tree, const char * source, NodeList *analyze_nodes)
{
    //get_variables(tree, source);
    
    CFG *cfg = new CFG(tree, source);
    cfg->cfg_build();
    // cfg->print_cfg();
    BasicBlock *entry = cfg->get_entry();
    CFGEdges *entry_edge = entry->get_out_edges().at(0);
    std::vector<BasicBlock*> bbs = cfg->get_bbs();

    std::unordered_map<CFGEdges*, bool> visit;
    visit.emplace(entry_edge, false);
    for (int i = 0; i < bbs.size(); i ++ ) {
        std::vector<CFGEdges*> out_edges = bbs.at(i)->get_out_edges();
        for (int j = 0; j < out_edges.size(); j ++ ) {
            visit.emplace(out_edges.at(j), false);
        }
    }

    std::unordered_map<std::string, Variable*> var_map;
    std::unordered_map<std::string, Variable*> changed_vars;
    // get variables
    get_variables(tree, var_map, source, "declaration", false);
    // get parameters
    get_variables(tree, var_map, source, "parameter_declaration", true);
    // get input from scanf function
    find_input_variables(tree, source, var_map);
    print_input(var_map);

    std::vector<std::string> conditions;
    std::vector<std::string> outputs;
    symbolic_execution(cfg, entry_edge, visit, source, analyze_nodes, var_map, conditions, outputs);
}

void process(const char* filename)
{
    char * source = read_source(filename);
    assert(source);

    // Create a parser
    TSParser * parser = ts_parser_new();
    // Set the parser's language
    ts_parser_set_language(parser, tree_sitter_c());
    TSTree *tree = ts_parser_parse_string(
        parser,
        NULL,
        source,
        strlen(source)
    );

    // Test call_expression
    NodeList analyze_nodes;
    parse_decompiler_output(tree, &analyze_nodes, "call_expression");
    run_se(tree, source, &analyze_nodes);

    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
}

int main()
{
    process("s_test.c");
    return 0;
}