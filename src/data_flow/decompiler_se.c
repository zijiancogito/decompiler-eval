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

void create_var_map(Variable **var_map, TSNode var_node, const char *source, bool is_input)
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
    HASH_ADD_STR(*var_map, name, v);
}

void update_var_map_with_var_list(Variable **var_map, Variable_list var_list)
{
    Variable_node *tmp = var_list.head;
    for (int i = 0; i < var_list.len; i ++ )
    {
        Variable *replaced;
        tmp = tmp->next;
        HASH_REPLACE_STR(*var_map, name, tmp->var, replaced);
        free_variable(replaced);
    }
}

void get_variables(TSTree *tree, Variable **var_map, const char *source, const char *node_filter, bool is_input)
{
    NodeList all_nodes;
    parse_decompiler_output(tree, source, node_filter, &all_nodes);
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++)
    {
        tmp = tmp->next;
        create_var_map(var_map, tmp->data, source, is_input);
    }
}

void find_input_variables(TSTree *tree, const char *source, Variable **var_map)
{
    NodeList all_nodes;
    parse_decompiler_output(tree, source, "call_expression", &all_nodes);
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
                HASH_FIND_STR(*var_map, name, v);
                if (v != NULL)
                {
                    // printf("%s\n", v->name);
                    v->is_input = true;
                }
            }
        }

        free(content);
    }
}

TSNode *find_branch_condition(TSNode node, const char* source)
{
    TSTreeCursor cursor = ts_tree_cursor_new(node);
    TSNode *result = NULL;
    NodeList all_nodes;
    char *split;
    init_node_list(&all_nodes);
    make_move(&cursor, DOWN, &all_nodes, "");
    Node *tmp = all_nodes.head;
    if (strstr(ts_node_type(tmp->next->data), "for") != NULL)
        split = ";";
    else
        split = "(";

    for (int i = 0; i < all_nodes.listLen; i ++)
    {
        tmp = tmp->next;
        if (strcmp(ts_node_type(tmp->data), split) == 0)
        {
            result = (TSNode*)malloc(sizeof(TSNode));
            *result = tmp->next->data;
            break;
        }
    }
    // printf("%s\n", ts_node_type(result));
    // printf("%s\n", get_content(result, source));
    return result;
}

void find_for_tail(NodeList *tail_nodes, TSNode for_node)
{
    if (strcmp(ts_node_type(for_node), "for_statement") != 0) return ;

    TSTreeCursor cursor = ts_tree_cursor_new(for_node);
    TSNode *result = NULL;
    NodeList all_nodes;
    int num = 0;
    init_node_list(&all_nodes);
    make_move(&cursor, DOWN, &all_nodes, "");
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i ++)
    {
        tmp = tmp->next;
        if (strcmp(ts_node_type(tmp->data), ";") == 0)
        {
            if (num == 1)
            {
                result = (TSNode*)malloc(sizeof(TSNode));
                *result = tmp->next->data;
                break;
            }
            num ++ ;
        }
    }
    if (result != NULL)
    {
        cursor = ts_tree_cursor_new(*result);
        NodeList list;
        init_node_list(&list);
        make_move(&cursor, DOWN, &list, "");
        tmp = list.head;
        for (int i = 0; i < list.listLen; i ++)
        {
            tmp = tmp->next;
            if (strcmp(ts_node_type(tmp->data), "assignment_expression") == 0 || strcmp(ts_node_type(tmp->data), "update_expression") == 0)
            {
                append_node(tail_nodes, tmp->data);
            }
        }
    }
}

void find_for_head(TSNode for_node, const char* source, Variable **var_map, Variable_list *changed_vars)
{
    if (strcmp(ts_node_type(for_node), "for_statement") != 0) return ;

    TSNode assign_node = ts_node_child(for_node, 2);
    TSTreeCursor cursor = ts_tree_cursor_new(assign_node);
    NodeList list;
    init_node_list(&list);
    make_move(&cursor, DOWN, &list, "");
    Node *tmp = list.head;
    for (int i = 0; i < list.listLen; i ++)
    {
        tmp = tmp->next;
        if (strcmp(ts_node_type(tmp->data), "assignment_expression") == 0 || strcmp(ts_node_type(tmp->data), "update_expression") == 0)
        {
            parse_assignment_expression(tmp->data, source, var_map, changed_vars);
        }
    }
}

char *opposite_relation(const char* relational_op)
{
    for (int i = 0; i < 6; i ++ )
        if (relational_ops[i] == relational_op)
            return relational_ops[5 - i];
    return NULL;
}

bool belong_to(const char *op, char **ops, int size)
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

char *parse_expression(TSNode expression_node, const char* source, Variable **var_map)
{
    const char *node_type = ts_node_type(expression_node);
    if (strcmp("identifier", node_type) == 0)
    {
        char *id_name = get_content(expression_node, source);
        Variable *v = NULL;
        // use variable name to find the variable struct
        HASH_FIND_STR(*var_map, id_name, v);
        
        if (v == NULL)  // If not found, the variable is considered global
        {
            Variable *new_v;
            new_v = (Variable *)malloc(sizeof(Variable));
            new_v->type = NULL;
            new_v->name = id_name;
            new_v->value = NULL;
            new_v->is_input = false;
            new_v->is_global = true;  // set the global field to ture
            HASH_ADD_STR(*var_map, name, new_v);
            HASH_FIND_STR(*var_map, id_name, v);
        }
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

void parse_assignment_expression(TSNode assign_node, const char* source, Variable **var_map, Variable_list *changed_vars)
{
    TSNode var_node;
    char *value = NULL;  // The value of the variable obtained by this assignment statement
    if (strcmp(ts_node_type(assign_node), "update_expression") == 0)
    {  // Only consider identifier update

        // If it is an update statement, the variable is 
        // considered to be an iteration variable, and
        // can be retained as an output value
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
    HASH_FIND_STR(*var_map, var_name, v);
    if (v == NULL)  // If not found, the variable is considered global
    {
        Variable *new_v;
        new_v = (Variable *)malloc(sizeof(Variable));
        new_v->type = NULL;
        new_v->name = var_name;
        new_v->value = NULL;
        new_v->is_input = false;
        new_v->is_global = true;  // set the global field to ture
        HASH_ADD_STR(*var_map, name, new_v);
        HASH_FIND_STR(*var_map, var_name, v);
    }

    // After the assignment statement, the value of 
    // the variable will change, record the previous 
    // value, convenient recovery
    Variable *changed_v = variable_copy(v);
    append_variable(changed_vars, changed_v);
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

void parse_branch_condition(TSNode branch_node, const char* source, Variable **var_map, condition_list *true_conditions, condition_list *false_conditions)
{
    const char *node_type = ts_node_type(branch_node);
    if (strcmp(node_type, "binary_expression") == 0)
    {
        TSNode left_node = ts_node_child(branch_node, 0);
        TSNode op_node = ts_node_child(branch_node, 1);
        TSNode right_node = ts_node_child(branch_node, 2);
        const char *op_type = ts_node_type(op_node);
        if (belong_to(op_type, relational_ops, 6))
        {
            char *left_cnt = parse_expression(left_node, source, var_map);
            char *right_cnt = parse_expression(right_node, source, var_map);
            char *opposite_op_type = opposite_relation(op_type);

            char *true_cnt = (char*)malloc(strlen(left_cnt) + strlen(op_type) + strlen(right_cnt) + 1);
            char *false_cnt = (char*)malloc(strlen(left_cnt) + strlen(opposite_op_type) + strlen(right_cnt) + 1);

            strcpy(true_cnt, left_cnt);
            strcat(true_cnt, op_type);
            strcat(true_cnt, right_cnt);

            strcpy(false_cnt, left_cnt);
            strcat(false_cnt, opposite_op_type);
            strcat(false_cnt, right_cnt);

            free(left_cnt);
            free(right_cnt);

            append_condition(true_conditions, true_cnt);
            append_condition(false_conditions, false_cnt);
        }
        else if (strcmp(op_type, "||") == 0 || strcmp(op_type, "&&") == 0)
        {
            condition_list left_true_con;
            condition_list left_false_con;
            init_condition_list(&left_true_con);
            init_condition_list(&left_false_con);

            condition_list right_true_con;
            condition_list right_false_con;
            init_condition_list(&right_true_con);
            init_condition_list(&right_false_con);

            parse_branch_condition(left_node, source, var_map, &left_true_con, &left_false_con);
            parse_branch_condition(right_node, source, var_map, &right_true_con, &right_false_con);

            condition_node *left_true = left_true_con.head;
            condition_node *left_false = left_false_con.head;
            condition_node *right_true = right_true_con.head;
            condition_node *right_false = right_false_con.head;

            if (strcmp(op_type, "||") == 0)
            {
                for (int i = 0; i < left_true_con.len; i ++ )
                {
                    left_true = left_true->next;
                    char *con = (char*)malloc(strlen(left_true->condition) + 1);
                    strcpy(con, left_true->condition);
                    append_condition(true_conditions, con);
                }
                for (int i = 0; i < left_false_con.len; i ++ )
                {
                    left_false = left_false->next;
                    right_true = right_true_con.head;
                    for (int j = 0; j < right_true_con.len; j ++ )
                    {
                        right_true = right_true->next;
                        char *con = (char*)malloc(strlen(left_false->condition) + strlen(", ") + strlen(right_true->condition) + 1);
                        strcpy(con, left_false->condition);
                        strcat(con, ", ");
                        strcat(con, right_true->condition);
                        append_condition(true_conditions, con);
                    }
                    right_false = right_false_con.head;
                    for (int j = 0; j < right_false_con.len; j ++)
                    {
                        right_false = right_false->next;
                        char *con = (char*)malloc(strlen(left_false->condition) + strlen(", ") + strlen(right_false->condition) + 1);
                        strcpy(con, left_false->condition);
                        strcat(con, ", ");
                        strcat(con, right_false->condition);
                        append_condition(false_conditions, con);
                    }
                }
            }
            else
            {
                for (int i = 0; i < left_false_con.len; i ++ )
                {
                    left_false = left_false->next;
                    char *con = (char*)malloc(strlen(left_false->condition) + 1);
                    strcpy(con, left_false->condition);
                    append_condition(false_conditions, con);
                }
                for (int i = 0; i < left_true_con.len; i ++ )
                {
                    left_true = left_true->next;
                    right_false = right_false_con.head;
                    for (int j = 0; j < right_false_con.len; j ++ )
                    {
                        right_false = right_false->next;
                        char *con = (char*)malloc(strlen(left_true->condition) + strlen(", ") + strlen(right_false->condition) + 1);
                        strcpy(con, left_true->condition);
                        strcat(con, ", ");
                        strcat(con, right_false->condition);
                        append_condition(false_conditions, con);
                    }
                    right_true = right_true_con.head;
                    for (int j = 0; j < right_true_con.len; j ++)
                    {
                        right_true = right_true->next;
                        char *con = (char*)malloc(strlen(left_true->condition) + strlen(", ") + strlen(right_true->condition) + 1);
                        strcpy(con, left_true->condition);
                        strcat(con, ", ");
                        strcat(con, right_true->condition);
                        append_condition(true_conditions, con);
                    }
                }
            }
        }
    }
    else if (strcmp(node_type, "parenthesized_expression") == 0)
    {
        TSNode child = ts_node_child(branch_node, 1);
        parse_branch_condition(child, source, var_map, true_conditions, false_conditions);
    }
    else if (strcmp(node_type, "unary_expression") == 0)
    {
        TSNode unary_node = ts_node_child(branch_node, 0);
        if (strcmp(ts_node_type(unary_node), "!") == 0)
        {
            TSNode cnt_node = ts_node_child(branch_node, 1);
            char *cnt = parse_expression(cnt_node, source, var_map);

            char *true_cnt = (char*)malloc(strlen(cnt) + strlen("==0") + 1);
            char *false_cnt = (char*)malloc(strlen(cnt) + strlen("!=0") + 1);

            strcpy(true_cnt, cnt);
            strcat(true_cnt, "==0");

            strcpy(false_cnt, cnt);
            strcat(false_cnt, "!=0");

            free(cnt);

            append_condition(true_conditions, true_cnt);
            append_condition(false_conditions, false_cnt);
        }
    }
    else
    {
        char *cnt = parse_expression(branch_node, source, var_map);

        char *true_cnt = (char*)malloc(strlen(cnt) + strlen("!=0") + 1);
        char *false_cnt = (char*)malloc(strlen(cnt) + strlen("==0") + 1);

        strcpy(true_cnt, cnt);
        strcat(true_cnt, "!=0");

        strcpy(false_cnt, cnt);
        strcat(false_cnt, "==0");

        free(cnt);

        append_condition(true_conditions, true_cnt);
        append_condition(false_conditions, false_cnt);
    }
}

void print_input(Variable *var_map)
{
    printf("input:  ");
    Variable *v = var_map;
    while (v != NULL)
    {
        if (v->is_input)
            printf("%s  ", v->name);
        v = v->hh.next;
    }
    printf("\n");
}

void print_analyze_nodes(path_condition *path, output_list *out_list, Variable *var_map)
{
    int path_num = 1;

    condition_list *tmp = path->head;
    for (int i = 0; i < path->len; i ++ )
    {
        tmp = tmp->next;
        path_num *= tmp->len;
    }

    char **pathes = (char**)malloc(sizeof(char*) * path_num);
    int n = 0;
    tmp = path->head;
    for (int i = 0; i < path->len; i ++ )
    {
        tmp = tmp->next;
        char **tmp_pathes = (char**)malloc(sizeof(char*) * n);
        for (int j = 0; j < n; j ++ )
        {
            char *tmp_path = (char*)malloc(strlen(pathes[j]) + 1);
            strcpy(tmp_path, pathes[j]);
            tmp_pathes[j] = tmp_path;
        }
        int num = n;
        condition_node *tmp2 = tmp->head;
        for (int j = 0; j < tmp->len; j ++ )
        {
            tmp2 = tmp2->next;
            for (int k = 0; k < n; k ++ )
            {
                char *p = (char*)malloc(strlen(tmp_pathes[k]) + strlen(", ") + strlen(tmp2->condition) + 1);
                strcpy(p, tmp_pathes[k]);
                strcat(p, ", ");
                strcat(p, tmp2->condition);
                pathes[(j * n) + k] = p;
            }
            if (n == 0)
            {
                char *p = (char*)malloc(strlen(tmp2->condition) + 1);
                strcpy(p, tmp2->condition);
                pathes[num ++ ] = p;
            }
        }
        for (int j = 0; j < n; j ++ )
            free(tmp_pathes[j]);
        if (tmp_pathes != NULL) free(tmp_pathes);
        if (n != 0) num = tmp->len * n;
        n = num;
    }

    for (int i = 0; i < path_num; i ++)
    {
        printf("%s   ", pathes[i]);
        printf("output: ");
        output_node *t = out_list->head;
        for (int i = 0; i < out_list->len; i ++ )
        {
            t = t->next;
            printf("%s  ", t->output);
        }
        /*
        Variable *v = var_map->hh.next;
        while (v != NULL)
        {
            if (v->is_global && v->value != NULL)
                printf("%s=%s  ", v->name, v->value);
            v = v->hh.next;
        }
        */
        printf("\n");
    }

}

void symbolic_execution(Branch_Node **branch_map, Branch_Node * root, Variable **var_map, path_condition *path, output_list *out_list, NodeList *ignore_nodes, NodeList* analyze_nodes, const char *source)
{
    if (!root) return;

    // Save the original value of the changed variables, used to protect the site
    Variable_list changed_vars;
    init_variable_list(&changed_vars);
    
    // Save all true and false conditions for the branch
    condition_list *true_con = (condition_list*)malloc(sizeof(condition_list));
    condition_list *false_con = (condition_list*)malloc(sizeof(condition_list));
    init_condition_list(true_con);
    init_condition_list(false_con);

    TSNode branch_node;

    NodeList all_nodes;
    init_node_list(&all_nodes);
    TSTreeCursor cursor = ts_tree_cursor_copy(root->start);
    make_move(&cursor, DOWN, &all_nodes, "");

    Node *tmp = all_nodes.head;
    TSNode *jump_target_node = NULL;
    int output_num = 0;
    while (tmp->next != all_nodes.tail)
    {
        tmp = tmp->next;
        // Find the jump target node and execute from the jump
        // target point, because only forward jump is involved,
        // so just traverse and match the node.
        if (jump_target_node != NULL)
        {
            if (ts_node_eq(tmp->data, *jump_target_node))
            {
                free(jump_target_node);
                jump_target_node = NULL;
            }
            else
                continue;
        }

        const char *node_type = ts_node_type(tmp->data);
        char *cnt = get_content(tmp->data, source);

        // ignore the third node of the "for" statement
        if (in_node_list(ignore_nodes, tmp->data))
            continue;

        // match the nodes to analyze and perform the analysis
        if (in_node_list(analyze_nodes, tmp->data))
        {
            char *out_put = parse_expression(tmp->data, source, var_map);
            output_num ++;
            append_output(out_list, out_put);
        }

        // Parse assignment statements and update variable values
        else if (strcmp(node_type, "assignment_expression") == 0 || strcmp(node_type, "update_expression") == 0)
        {
            parse_assignment_expression(tmp->data, source, var_map, &changed_vars);
        }
        
        else if (strcmp(node_type, "else") == 0)
        {
            // When an else statement is encountered, jump out of the
            // entire if statement, look for the jump target node.
            TSNode next = ts_node_next_sibling(tmp->data);
            char *cnt = get_content(next, source);
            Branch_Node *b = NULL;
            HASH_FIND_STR(*branch_map, cnt, b);
            if (b != NULL)
            {
                Branch_Node *tmpb = b;
                while (tmpb->is_else)
                    tmpb = tmpb->false_branch;

                jump_target_node = (TSNode*)malloc(sizeof(TSNode));
                *jump_target_node = ts_tree_cursor_current_node(tmpb->start);
            }
        }

        else if (is_branch_statement(node_type))
        {
            // Find the third node in the "for" statement and add to ignore_nodes
            find_for_tail(ignore_nodes, tmp->data);
            // Before parsing the branching condition, find and parse the first node of the "for" statement
            find_for_head(tmp->data, source, var_map, &changed_vars);
            TSNode *n = find_branch_condition(tmp->data, source);
            if (n != NULL)
            {
                branch_node = *n;
                parse_branch_condition(branch_node, source, var_map, true_con, false_con);
            }
            if (root->end == NULL)
            {
                // This branch is not end, but there is another branch statement 
                // in this branch, should go to the new branch
                Branch_Node *branch = NULL;
                HASH_FIND_STR(*branch_map, cnt, branch);
                if (branch != NULL)
                {
                    append_condition_list(path, false_con); // False branch is entered, add false condition
                    symbolic_execution(branch_map, branch->false_branch, var_map, path, out_list, ignore_nodes, analyze_nodes, source);
                    delete_tail_condition_list(path);  // Restore the site, delete false condition
                    append_condition_list(path, true_con); // True branch is entered, add true condition
                    symbolic_execution(branch_map, branch->true_branch, var_map, path, out_list, ignore_nodes, analyze_nodes, source);
                    delete_tail_condition_list(path);  // Restore the site, delete true condition
                    delete_output_by_num(out_list, output_num);  // Restore the site, delete analyze_nodes from this path
                    update_var_map_with_var_list(var_map, changed_vars);  // Restore the site, updates changed variable with the original value
                    return ;
                }
            }
            // Reach the end of this branch
            break;
        }
        if (strcmp(node_type, "return_statement") == 0)
        {
            // Return statement means the end of this path
            print_analyze_nodes(path, out_list, *var_map);
            delete_output_by_num(out_list, output_num);  // Restore the site, delete analyze_nodes from this path
            update_var_map_with_var_list(var_map, changed_vars);  // Restore the site, updates changed variable with the original value
            return;
        }
    }
    free_node_list(&all_nodes);

    if (root->false_branch == NULL && root->true_branch == NULL)
    {
        // No true or false branch, means the end of this path
        print_analyze_nodes(path, out_list, *var_map);
    }
    else
    {
        append_condition_list(path, false_con); // False branch is entered, add false condition
        symbolic_execution(branch_map, root->false_branch, var_map, path, out_list, ignore_nodes, analyze_nodes, source);
        delete_tail_condition_list(path);  // Restore the site, delete false condition
        append_condition_list(path, true_con); // True branch is entered, add true condition
        symbolic_execution(branch_map, root->true_branch, var_map, path, out_list, ignore_nodes, analyze_nodes, source);
        delete_tail_condition_list(path);  // Restore the site, delete true condition
    }
    delete_output_by_num(out_list, output_num);  // Restore the site, delete analyze_nodes from this path
    update_var_map_with_var_list(var_map, changed_vars);  // Restore the site, updates changed variable with the original value
}

void run_se(TSTree *tree, const char * source, NodeList *analyze_nodes)
{
    //get_variables(tree, source);
    
    SCFG scfg;
    Branch_Node *branch_map = NULL;
    get_scfg(tree, source, &scfg, &branch_map);

    Variable *var_map = NULL;
    // get variables
    get_variables(tree, &var_map, source, "declaration", false);
    // get parameters
    get_variables(tree, &var_map, source, "parameter_declaration", true);

    // get input from scanf function
    find_input_variables(tree, source, &var_map);
    print_input(var_map);

    output_list out_list;  // A list of outputs for a path 
    path_condition path;  // records the branch condition in a path

    // Assume that the third node of the "for" statement is ignored, 
    // ( eg. "for(i = 1; i < n; i += 1)", ignore i += 1 )
    // because the loop is assumed to execute once, 
    // this node is not considered. 
    NodeList ignore_nodes;
    init_output_list(&out_list);
    init_path_condition(&path);
    init_node_list(&ignore_nodes);
    symbolic_execution(&branch_map, scfg.entry, &var_map, &path, &out_list, &ignore_nodes, analyze_nodes, source);
    
    /*
    // Save filtered nodes in all_nodes
    NodeList all_nodes;
    // init_node_list(&all_nodes);
    // TSTreeCursor cursor = ts_tree_cursor_copy(scfg.entry->true_branch->start);
    // make_move(&cursor, DOWN, &all_nodes, "");
    parse_decompiler_output(tree, source, "", &all_nodes);
    // Print all_nodes
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++) {
        tmp = tmp->next;
        
        if (strcmp(ts_node_type(tmp->data), "else") == 0)
        {
            TSNode par = ts_node_next_sibling(tmp->data);
            // par = ts_node_parent(par);
            char *content = NULL;
            printf("%s:\n", ts_node_type(par));
            content = get_content(par, source);
            // printf("%s\n", ts_node_string(tmp->data));
            printf("%s\n", content);
            printf("\n");
            free(content);
        }
        
        char *content = NULL;
        printf("%s:\n", ts_node_type(tmp->data));
        content = get_content(tmp->data, source);
        //printf("%s\n", ts_node_string(tmp->data));
        printf("%s\n", content);
        printf("\n");
        free(content);
        
    }
    */

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
    parse_decompiler_output(tree, source, "call_expression", &analyze_nodes);
    run_se(tree, source, &analyze_nodes);

    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
}

int main()
{
    process("test.c");
    return 0;
}