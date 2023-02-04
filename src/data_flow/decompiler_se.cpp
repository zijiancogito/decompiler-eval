#include <iostream>
#include <cstring>
#include <unordered_map>
#include <algorithm>
#include <assert.h>
#include "cfg_generator.h"
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
    if (v != NULL) {
        delete v;
        v = NULL;
    }
}

Variable *variable_copy(Variable *v)
{
    Variable *new_v = new Variable;
    new_v->is_input = v->is_input;
    new_v->is_output = v->is_output;
    new_v->is_global = v->is_global;
    new_v->expression = v->expression;
    if (!v->type.empty()) {
        new_v->type = v->type;
    }
    if (!v->name.empty()) {
        new_v->name =  v->name;
    }
    return new_v;
}

void print_input(std::unordered_map<std::string, Variable*> &var_map)
{
    printf("input:  ");
    Variable *v = NULL;
    for (std::unordered_map<std::string, Variable*>::iterator it = var_map.begin(); it != var_map.end(); it ++) {
        v = (*it).second;
        if (v->is_input)
            printf("%s  ", v->name.c_str());
    }
    printf("\n");
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
    v = new Variable;
    v->type = type;
    v->name = name;
    v->expression = Json::nullValue;
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

std::string opposite_relation(std::string relational_op)
{
    std::string res;
    for (int i = 0; i < 6; i ++ ) {
        if (relational_ops[i] == relational_op) {
            res = relational_ops[5 - i];
            break;
        }
    }
    return res;
}

bool in_node_list(NodeList *all_nodes, TSNode node)
{
    Node *tmp = all_nodes->head;
    for (int i = 0; i < all_nodes->listLen; i ++) {
        tmp = tmp->next;
        if (ts_node_eq(node, tmp->data)) {
            return true;
        }
    }
    return false;
}

Json::Value parse_expression(TSNode expression_node, const char* source, std::unordered_map<std::string, Variable*> &var_map)
{
    std::string node_type = ts_node_type(expression_node);
    Json::Value ret;
    if (node_type == "identifier") {
        char *id_name = get_content(expression_node, source);
        Variable *v = NULL;
        // Use variable name to find the variable struct, if
        // not found, the variable is considered global
        if (var_map.find(id_name) == var_map.end()) {
            Variable *new_v;
            new_v = new Variable;
            new_v->name = id_name;
            new_v->expression = Json::nullValue;
            new_v->is_input = false;
            new_v->is_output = false;
            new_v->is_global = true;  // set the global field to ture
            var_map.emplace(id_name, new_v);
        }
        v = var_map.at(id_name);
        // check whether the variable is assigned
        if (!v->expression.empty()) {
            ret = v->expression;
        } else {
            ret["type"] = node_type;
            ret["value"] = v->name;
        }
    } else if (node_type.find("_literal") != std::string::npos && 
             node_type.find("literal_") == std::string::npos) {
        // Get the value of the literal directly
        ret["type"] = node_type;
        ret["value"] = get_content(expression_node, source);
    } else if (node_type == "cast_expression") {
        // Get the variable node from a cast node and parse it
        TSNode cnt_node = ts_node_child(expression_node, 3);
        ret = parse_expression(cnt_node, source, var_map);
    } else if (node_type == "parenthesized_expression") {
        // parse the node in parentheses
        TSNode cnt_node = ts_node_child(expression_node, 1);
        ret = parse_expression(cnt_node, source, var_map);
    } else if (node_type == "pointer_expression") {
        TSNode pointer_node = ts_node_child(expression_node, 0);
        TSNode cnt_node = ts_node_next_sibling(pointer_node);
        std::string op = ts_node_type(pointer_node);
        ret["type"] = node_type;
        ret["op"] = op;
        if (op == "&") {
            // if reference, return the source content directly
            ret["value"]["type"] = "identifier";
            ret["value"]["value"] = get_content(cnt_node, source);
        } else {
            // if dereference, parse the variable node
            ret["value"] = parse_expression(cnt_node, source, var_map);
        }
    }
    else if (node_type == "binary_expression") {
        TSNode left_node = ts_node_child(expression_node, 0);
        TSNode right_node = ts_node_child(expression_node, 2);
        Json::Value cnt1 = parse_expression(left_node, source, var_map);
        Json::Value op = ts_node_type(ts_node_child(expression_node, 1));
        Json::Value cnt3 = parse_expression(right_node, source, var_map);
        ret["type"] = node_type;
        ret["left"] = cnt1;
        ret["op"] = op;
        ret["right"] = cnt3;
    }
    else if (node_type == "update_expression") {
        // Only consider identifier update
        TSNode first_node = ts_node_child(expression_node, 0);
        TSNode second_node = ts_node_child(expression_node, 1);
        if (strcmp(ts_node_type(second_node), "++") == 0 || strcmp(ts_node_type(second_node), "--") == 0) {
            // postfix operation, return the variable itself
            ret = parse_expression(first_node, source, var_map);
        } else {
            // prefix operation, the variable incremented/decremented by one
            const char *op = ts_node_type(first_node);
            Json::Value cnt = parse_expression(second_node, source, var_map);
            char *single_op = (char*)malloc(strlen(op) + 1);
            strcpy(single_op, op);
            single_op[strlen(op) - 1] = '\0';
            ret["type"] = "binary_expression";
            ret["left"] = cnt;
            ret["op"] = single_op;
            ret["right"] = "1";
        }
    }
    else if (node_type == "call_expression") { 
        // parse each argument of the function
        Json::Value func_name = get_content(ts_node_child(expression_node, 0), source);
        // get argument_list node
        Json::Value arguments;
        TSNode argument_list = ts_node_child(expression_node, 1);
        int argument_num = ts_node_child_count(argument_list);
        for (int i = 0; i < argument_num; i ++ ) {
            // parse arguments one by one
            TSNode argument = ts_node_child(argument_list, i);
            std::string argument_type = ts_node_type(argument);
            if (argument_type != "(" && argument_type != "," && argument_type != ")")
                arguments.append(parse_expression(argument, source, var_map));
        }
        ret["type"] = node_type;
        ret["func"] = func_name;
        ret["args"] = arguments;
    }
    else if (node_type == "return_statement") {
        TSNode return_node = ts_node_child(expression_node, 1);
        Json::Value return_cnt = parse_expression(return_node, source, var_map);
        if (!return_cnt.empty()) {
            ret["type"] = node_type;
            ret["value"] = return_cnt;
        }
    }

    return ret;
}

void parse_assignment_expression(TSNode assign_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars)
{
    TSNode var_node;
    Json::Value expression;  // The expression of the variable obtained by this assignment statement
    if (strcmp(ts_node_type(assign_node), "update_expression") == 0)
    {  // Only consider identifier update

        TSNode first_node = ts_node_child(assign_node, 0);
        TSNode second_node = ts_node_child(assign_node, 1);
        TSNode op_node;
        if (strcmp(ts_node_type(second_node), "++") == 0 || strcmp(ts_node_type(second_node), "--") == 0) {
            var_node = first_node;
            op_node = second_node;
        } else {
            var_node = second_node;
            op_node = first_node;
        }

        // set the expression
        Json::Value cnt = parse_expression(var_node, source, var_map);
        const char *op = ts_node_type(op_node);
        char *single_op = (char*)malloc(strlen(op) + 1);
        strcpy(single_op, op);
        single_op[strlen(op) - 1] = '\0';
        expression["type"] = "binary_expression";
        expression["left"] = cnt;
        expression["op"] = single_op;
        expression["right"]["type"] = "number_literal";
        expression["right"]["value"] = "1";
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
        new_v = new Variable;
        new_v->name = var_name;
        new_v->expression = Json::nullValue;
        new_v->is_input = false;
        new_v->is_output = false;
        new_v->is_global = true;  // set the global field to ture
        var_map.emplace(var_name, new_v);
    }
    v = var_map.at(var_name);

    // After the assignment statement, the expression of the variable will  
    // change, record the previous expression, convenient recovery
    Variable *changed_v = variable_copy(v);
    changed_vars.emplace(changed_v->name, changed_v);

    if (expression.empty()) {
        // not the update_expression
        // set the expression
        TSNode right_node = ts_node_child(assign_node, 2);
        TSNode op_node = ts_node_child(assign_node, 1);
        const char *op = ts_node_type(op_node);
        if (std::find(begin(self_ops), end(self_ops), op) != end(self_ops)) {
            // "+=", "-=", "*=", etc.
            char *single_op = (char*)malloc(strlen(op) + 1);
            strcpy(single_op, op);
            single_op[strlen(op) - 1] = '\0';
            Json::Value right = parse_expression(right_node, source, var_map);
            if (v->expression.empty()) {
                expression["left"]["type"] = "identifier";
                expression["left"]["value"] = v->name;
            } else {
                expression["left"] = v->expression;
            }
            expression["op"] = single_op;
            expression["right"] = right;
            expression["type"] = "binary_expression";
            free(single_op);
        } else {
            expression = parse_expression(right_node, source, var_map);
        }
    }

    v->expression = expression;
}

Json::Value parse_branch_condition(TSNode con_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars, bool condition)
{
    std::string node_type = ts_node_type(con_node);
    Json::Value ret;
    TSNode var_node;
    Json::Value expression = Json::nullValue;
    if (node_type == "binary_expression") {
        TSNode left_node = ts_node_child(con_node, 0);
        TSNode op_node = ts_node_child(con_node, 1);
        TSNode right_node = ts_node_child(con_node, 2);
        std::string op_type = ts_node_type(op_node);
        if (std::find(begin(relational_ops), end(relational_ops), op_type) != end(relational_ops)) {
            Json::Value left_cnt = parse_expression(left_node, source, var_map);
            Json::Value right_cnt = parse_expression(right_node, source, var_map);

            if (condition == false) {
                op_type = opposite_relation(op_type);
            }

            ret["type"] = node_type;
            ret["left"] = left_cnt;
            ret["op"] = op_type;
            ret["right"] = right_cnt;
            
            if (op_type == "==") {
                std::string left_type = ts_node_type(left_node);
                std::string right_type = ts_node_type(right_node);
                if (left_type == "identifier" && right_type == "number_literal") {
                    var_node = left_node;
                    expression["type"] = "number_literal";
                    expression["value"] = get_content(right_node, source);
                } else if (left_type == "number_literal" && right_type == "identifier") {
                    var_node = right_node;
                    expression["type"] = "number_literal";
                    expression["value"] = get_content(left_node, source);
                }
            }
        }
    } else if (node_type == "parenthesized_expression") {
        TSNode child = ts_node_child(con_node, 1);
        ret = parse_branch_condition(child, source, var_map, changed_vars, condition);
    } else if (node_type == "unary_expression") {
        TSNode unary_node = ts_node_child_by_field_name(con_node, "operator", strlen("operator"));
        if (strcmp(ts_node_type(unary_node), "!") == 0) {
            TSNode expression_node = ts_node_child_by_field_name(con_node, "argument", strlen("argument"));
            Json::Value expression_cnt = parse_expression(expression_node, source, var_map);
            std::string op;

            if (condition == true) {
                op = "==";
            } else {
                op = "!=";
            }

            ret["type"] = "binary_expression";
            ret["left"] = expression_cnt;
            ret["op"] = op;
            ret["right"]["type"] = "number_literal";
            ret["right"]["value"] = "0";

            if (op == "==") {
                std::string expression_type = ts_node_type(expression_node);
                if (expression_type == "identifier") {
                    var_node = expression_node;
                    expression["type"] = "number_literal";
                    expression["value"] = "0";
                }
            }
        }
    } else {
        Json::Value expression_cnt = parse_expression(con_node, source, var_map);
        std::string op;

        if (condition == true) {
            op = "!=";
        } else {
            op = "==";
        }

        ret["type"] = "binary_expression";
        ret["left"] = expression_cnt;
        ret["op"] = op;
        ret["right"]["type"] = "number_literal";
        ret["right"]["value"] = "0";

        if (op == "==") {
            std::string expression_type = ts_node_type(con_node);
            if (expression_type == "identifier") {
                var_node = con_node;
                expression["type"] = "number_literal";
                expression["value"] = "0";
            }
        }
    }

    if (!expression.empty()) {
        // Find variable node from the var_map by variable name
        std::string var_type = ts_node_type(var_node);
        char *var_name = get_content(var_node, source);
        Variable *v = NULL;
        if (var_map.find(var_name) == var_map.end())  // If not found, the variable is considered global
        {
            Variable *new_v;
            new_v = new Variable;
            new_v->name = var_name;
            new_v->expression = Json::nullValue;
            new_v->is_input = false;
            new_v->is_output = false;
            new_v->is_global = true;  // set the global field to ture
            var_map.emplace(var_name, new_v);
        }
        v = var_map.at(var_name);

        // After changing the expression of the variable, record the
        // previous expression, convenient recovery
        std::vector<Variable *> var_list;
        var_list.push_back(v);
        Variable *tmp = v;
        while (!tmp->expression.empty() && tmp->expression["type"] == "identifier") {
            std::string name = tmp->expression["value"].asString();
            tmp = var_map.at(name);
            var_list.push_back(tmp);
        }

        for (int i = 0; i < var_list.size(); i ++ ) {
            Variable *var = var_list[i];
            Variable *changed_v = variable_copy(var);
            changed_vars.emplace(changed_v->name, changed_v);
            var->expression = expression;
        }
    }

    return ret;

}

void symbolic_execution(CFG *cfg, CFGEdges *edge, std::unordered_map<CFGEdges*, bool> &visit, const char *source, NodeList *analyze_nodes, std::unordered_map<std::string, Variable*> &var_map, Json::Value &paths, Json::Value &conditions, Json::Value &outputs) 
{
    BasicBlock *bb = edge->get_destination();
    if (bb == cfg->get_exit()) {
        Json::Value path;
        /*
        Json::Value outputs;
        for (auto var: var_map) {
            if (var.second->expression.empty()){
                Json::Value expression;
                expression["type"] = "identifier";
                expression["value"] = var.first;
                outputs[var.first] = expression;
            } else {
                outputs[var.first] = var.second->expression;
            }
        }
        */
        path["conditions"] = conditions;
        path["outputs"] = outputs;
        paths.append(path);
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
        for (int j = 0; j < sub_nodes.listLen; j ++) {
            tmp = tmp->next;
            if (in_node_list(analyze_nodes, tmp->data)) {
                Json::Value out_put = parse_expression(tmp->data, source, var_map);
                if (out_put["type"] == "return_statement") {
                    out_put = out_put["value"];
                    output_num ++;
                    outputs.append(out_put);
                } else if (out_put["type"] == "call_expression") {
                    for (auto arg: out_put["args"]) {
                        output_num ++;
                        outputs.append(arg);
                    }
                }
            }
        }
    }

    // judge switch statement
    bool is_switch = false;
    Json::Value switch_condition;
    TSNode n = nodes.back();
    is_switch = (strcmp(ts_node_type(n), "switch_statement") == 0);
    if (is_switch) {
        TSNode con_node = ts_node_child_by_field_name(n, "condition", strlen("condition"));
        TSNode cnt_node = ts_node_child(con_node, 1);
        switch_condition = parse_expression(cnt_node, source, var_map);
    }

    // DFS
    for (int i = 0; i < out_edges.size(); i ++ ) {
        std::unordered_map<std::string, Variable*> branch_changed_vars;
        CFGEdges *out_edge = out_edges.at(i);
        // Parse jump conditions
        int con_num = 0;
        if (out_edge->get_condition() == TRUE) {
            Json::Value con = parse_branch_condition(nodes.back(), source, var_map, branch_changed_vars, true);
            if (!con.empty()) {
                con_num ++ ;
                conditions.append(con);
            }
        } else if (out_edge->get_condition() == FALSE) {
            Json::Value con = parse_branch_condition(nodes.back(), source, var_map, branch_changed_vars, false);
            if (!con.empty()) {
                con_num ++ ;
                conditions.append(con);
            }
        } else if (is_switch && !switch_condition.empty()) {
            BasicBlock *des_bb = out_edge->get_destination();
            TSNode case_node = des_bb->get_contained_nodes().at(0);
            TSNode type_node = ts_node_child(case_node, 0);
            if (strcmp(ts_node_type(type_node), "case") == 0) {
                Json::Value con;
                TSNode value_node = ts_node_child_by_field_name(case_node, "value", strlen("value"));
                Json::Value value = parse_expression(value_node, source, var_map);
                con["left"] = switch_condition;
                con["op"] = "==";
                con["right"] = value;
                con_num ++ ;
                conditions.append(con);
            } else {
                // default
                for (int j = 0; j < out_edges.size(); j ++ ) {
                    CFGEdges *edge = out_edges.at(j);
                    if (edge->get_condition() == JMP) {
                        BasicBlock *des_bb = edge->get_destination();
                        TSNode case_node = des_bb->get_contained_nodes().at(0);
                        TSNode type_node = ts_node_child(case_node, 0);
                        if (strcmp(ts_node_type(type_node), "case") == 0) {
                            Json::Value con;
                            TSNode value_node = ts_node_child_by_field_name(case_node, "value", strlen("value"));
                            Json::Value value = parse_expression(value_node, source, var_map);
                            con["left"] = switch_condition;
                            con["op"] = "!=";
                            con["right"] = value;
                            con_num ++ ;
                            conditions.append(con);
                        }
                    }
                }
            }
        }
        symbolic_execution(cfg, out_edge, visit, source, analyze_nodes, var_map, paths, conditions, outputs);
        // Restore the site
        for (auto it = branch_changed_vars.begin(); it != branch_changed_vars.end(); it ++ ) {
            var_map.at((*it).first) = (*it).second;
        }
        while (con_num --)
            conditions.removeIndex(conditions.size()-1, NULL);
    }

    // Restore the site
    while (output_num -- ) outputs.removeIndex(outputs.size()-1, NULL);
    for (auto it = changed_vars.begin(); it != changed_vars.end(); it ++ ) {
        var_map.at((*it).first) = (*it).second;
    }
    visit.at(edge) = false;
}

const char *run_se(TSTree *tree, const char * source, NodeList *analyze_nodes)
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
    // print_input(var_map);

    Json::Value conditions = Json::arrayValue;
    Json::Value outputs = Json::arrayValue;
    Json::Value paths;
    symbolic_execution(cfg, entry_edge, visit, source, analyze_nodes, var_map, paths, conditions, outputs);
    char *ret = new char[strlen(paths.toStyledString().c_str()) + 1];
    strcpy(ret, paths.toStyledString().c_str());
    return ret;
}

extern "C" const char *process(const char* filename)
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

    // find printf
    NodeList analyze_nodes;
    parse_decompiler_output(tree, &analyze_nodes, "call_expression");
    Node *tmp = analyze_nodes.head;
    while (tmp->next != analyze_nodes.tail) {
        Node *tmp2 = tmp;
        tmp = tmp->next;
        TSNode func_node = ts_node_child_by_field_name(tmp->data, "function", strlen("function"));
        if (strstr(get_content(func_node, source), "printf") == NULL) {
            tmp2->next = tmp->next;
            tmp = tmp2;
        }
    }  // when run out while loop, tmp->next point to analyze_nodes.tail
    NodeList return_nodes;
    parse_decompiler_output(tree, &return_nodes, "return_statement");
    Node *tmp2 = return_nodes.head->next;
    while (tmp2 != return_nodes.tail) {
        Node *tmp3 = tmp2->next;
        tmp->next = tmp2;
        tmp2->next = analyze_nodes.tail;
        tmp2 = tmp3;
    }
    const char *ret = run_se(tree, source, &analyze_nodes);

    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);

    return ret;
}

int main()
{
    process("s_test.c");
    return 0;
}