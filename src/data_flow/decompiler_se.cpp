#include <iostream>
#include <cstring>
#include <regex>
#include <unordered_map>
#include <algorithm>
#include <exception>
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

bool calculate(long long left, std::string op, long long right, long long &res)
{
    bool valid_calculate = true;
    if (op == "%") {
        if (right == 0)
            valid_calculate = false;
        else
            res = left % right;
    } else if (op == "&") {
        res = left & right;
    } else if (op == "*") {
        res = left * right;
    } else if (op == "/") {
        if (right == 0)
            valid_calculate = false;
        else
            res = left / right;
    } else if (op == "+") {
        res = left + right;
    } else if (op == "-") {
        res = left - right;
    } else if (op == "<<") {
        res = left << right;
    } else if (op == ">>") {
        res = left >> right;
    } else if (op == "^") {
        res = left ^ right;
    } else if (op == "|") {
        res = left | right;
    } else {
        valid_calculate = false;
    }
    return valid_calculate;
}

bool calculate(double left, std::string op, double right, double &res)
{
    bool valid_calculate = true;
    if (op == "*") {
        res = left * right;
    } else if (op == "/") {
        if (right == 0)
            valid_calculate = false;
        else
            res = left / right;
    } else if (op == "+") {
        res = left + right;
    } else if (op == "-") {
        res = left - right;
    } else {
        valid_calculate = false;
    }
    return valid_calculate;
}

bool simplification(Json::Value &expression)
{
    if (expression.empty())
        return false;
    // std::cout << expression.toStyledString() << std::endl;
    Json::Value copy = expression;
    std::stack<Json::Value *> exp_list;
    exp_list.push(&expression);
    while (!exp_list.empty()) {
        Json::Value *exp = exp_list.top();
        exp_list.pop();
        if ((*exp)["type"] == "binary_expression") {
            if ((*exp)["left"]["type"] == "number_literal" && (*exp)["right"]["type"] == "number_literal") {
                if ((*exp)["left"]["value"].asString().find(".") == std::string::npos && 
                    (*exp)["right"]["value"].asString().find(".") == std::string::npos) {
                    long long res;
                    if (calculate(std::stoll((*exp)["left"]["value"].asString()), (*exp)["op"].asString(), std::stoll((*exp)["right"]["value"].asString()), res)) {
                        (*exp).clear();
                        (*exp)["type"] = "number_literal";
                        (*exp)["value"] = std::to_string(res);
                    }
                } else {
                    double res;
                    if (calculate(std::stod((*exp)["left"]["value"].asString()), (*exp)["op"].asString(), std::stod((*exp)["right"]["value"].asString()), res)) {
                        (*exp).clear();
                        (*exp)["type"] = "number_literal";
                        (*exp)["value"] = std::to_string(res);
                    }
                }
            } else {
                bool check = false;

                if ((*exp)["right"]["type"] == "number_literal" &&
                    (*exp)["left"]["type"] == "binary_expression" &&
                    (*exp)["right"]["value"] == "0" && 
                    std::find(begin(relational_ops), end(relational_ops), (*exp)["left"]["op"].asString()) != end(relational_ops)) {
                    if ((*exp)["op"] == "==") {
                        (*exp) = (*exp)["left"];
                        (*exp)["op"] = opposite_relation((*exp)["op"].asString());
                    } else if ((*exp)["op"] == "!=") {
                        (*exp) = (*exp)["left"];
                    }
                }

                if ((*exp)["left"]["type"] == "number_literal") {
                    if (((*exp)["left"]["value"] == "0" && (*exp)["op"] == "+") || 
                        ((*exp)["left"]["value"] == "1" && (*exp)["op"] == "*")) {
                        (*exp) = (*exp)["right"];
                        check = true;
                    } else if ((*exp)["left"]["value"] == "0" && (*exp)["op"] == "*") {
                        (*exp) = (*exp)["left"];
                        check = true;
                    }
                }

                if (!check && (*exp)["right"]["type"] == "number_literal") {
                    if (((*exp)["right"]["value"] == "0" && ((*exp)["op"] == "+" || (*exp)["op"] == "-")) || 
                        ((*exp)["right"]["value"] == "1" && ((*exp)["op"] == "*" || (*exp)["op"] == "/"))) {
                        (*exp) = (*exp)["left"];
                        check = true;
                    } else if ((*exp)["right"]["value"] == "0" && (*exp)["op"] == "*") {
                        (*exp) = (*exp)["right"];
                        check = true;
                    }
                }

                if (check) {
                    if ((*exp)["type"] == "binary_expression" || (*exp)["type"] == "call_expression")
                        exp_list.push(exp);
                } else {
                    if ((*exp)["left"]["type"] == "binary_expression" || (*exp)["left"]["type"] == "call_expression")
                        exp_list.push(&(*exp)["left"]);
                    if ((*exp)["right"]["type"] == "binary_expression" || (*exp)["left"]["type"] == "call_expression")
                        exp_list.push(&(*exp)["right"]);
                }
            }
        } else if ((*exp)["type"] == "call_expression") {
            Json::Value *args = &(*exp)["args"];
            for (int i = 0; i < args->size(); i ++ ) {
                if ((*args)[i]["type"] == "binary_expression" || (*args)[i]["type"] == "call_expression")
                    exp_list.push(&(*args)[i]);
            }
        } else if ((*exp)["type"] == "pointer_expression") {
            Json::Value *val = &(*exp)["value"];
            exp_list.push(val);
        }
        
    }

    return copy != expression;
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

void get_parameters(TSTreeCursor *cursor, std::unordered_map<std::string, Variable*> &var_map, const char *source)
{
    try {
        NodeList all_nodes;
        init_node_list(&all_nodes);
        make_move(cursor, DOWN, &all_nodes, "parameter_declaration");
        Node *tmp = all_nodes.head;
        for (int i = 0; i < all_nodes.listLen; i++) {
            tmp = tmp->next;
            add_declarator_to_var_map(var_map, tmp->data, source, PARAM);
        }
    } catch (std::exception e) {
        throw e;
    }   
}

void add_declarator_to_var_map(std::unordered_map<std::string, Variable*> &var_map, TSNode var_node, const char *source, bool is_param)
{
    NodeList all_nodes;
    TSTreeCursor cursor = ts_tree_cursor_new(var_node);
    init_node_list(&all_nodes);
    make_move(&cursor, DOWN, &all_nodes, "identifier");
    if (all_nodes.listLen == 0)
        return ;

    TSNode type_node = ts_node_child_by_field_name(var_node, "type", strlen("type"));
    std::string type = get_content(type_node, source);
    
    Node *tmp = all_nodes.head;
    for (int i = 0; i < all_nodes.listLen; i++) {
        tmp = tmp->next;
        std::string name = get_content(tmp->data, source);
        Variable *v = new Variable;
        v->type = type;
        v->name = name;
        v->is_input = is_param;
        v->is_global = false;
        if (is_param) {
            v->expression["type"] = "input_symbol";
            v->expression["value"] = "param" + std::to_string(params_num ++);
        } else {
            v->expression = Json::nullValue;
        }
        var_map.emplace(name, v);
    }
}

std::string json_to_string(Json::Value json)
{
    std::string ret;
    // std::cout << json.toStyledString() << std::endl;
    if (json.empty())
        return ret;
    if (json["type"] == "binary_expression") {
        std::string left = json_to_string(json["left"]);
        std::string right = json_to_string(json["right"]);
        std::string op = json["op"].asString();
        ret = left + op + right;
    } else if (strstr(json["type"].asCString(), "literal") != NULL || json["type"] == "identifier" || json["type"] == "input_symbol") {
        ret = json["value"].asString();
    } else if (json["type"] == "call_expression") {
        std::string func = json["func"].asString();
        std::string args = "";
        if (!json["args"].empty()) {
            for (auto arg: json["args"]) {
                args += json_to_string(arg) + ",";
            }
            args.pop_back();
        }
        ret = func + "(" + args + ")";
    } else if (json["type"] == "pointer_expression" || json["type"] == "unary_expression") {
        std::string op = json["op"].asString();
        std::string val = json_to_string(json["value"]);
        ret = op + val;
    }
    return ret;
}

Json::Value find_input_variables(TSTree *tree, const char *source, std::unordered_map<std::string, Variable*> &var_map)
{
    Json::Value ret = Json::nullValue;
    NodeList all_nodes;
    parse_decompiler_output(tree, &all_nodes, "call_expression");
    Node *tmp = all_nodes.head;
    int scanf_idx = 0;
    for (int i = 0; i < all_nodes.listLen; i++) {
        tmp = tmp->next;
        TSNode func_node = ts_node_child(tmp->data, 0);
        std::string func_name = get_content(func_node, source);

        if (func_name == "scanf" || func_name == "__isoc99_scanf") {
            TSNode arguments_node = ts_node_child_by_field_name(tmp->data, "arguments", strlen("arguments"));
            int argument_num = ts_node_child_count(arguments_node);
            bool is_first_arg = true;
            for (int i = 0; i < argument_num; i ++ ) {
                TSNode argument_node = ts_node_child(arguments_node, i);
                std::string argument_type = ts_node_type(argument_node);
                if (argument_type == "(" || argument_type == "," || argument_type == ")")
                    continue;
                if (is_first_arg) {
                    is_first_arg = false;
                    continue;
                } else if (argument_type == "identifier") {
                    std::string arg_name = get_content(argument_node, source);
                    std::string name = "*" + arg_name;
                    ret[name] = "scanf" + std::to_string(scanf_idx ++ );
                } else if (argument_type == "pointer_expression") {
                    // TODO
                }
                if (argument_type == "binary_expression") {
                    argument_node = ts_node_child_by_field_name(argument_node, "left", strlen("left"));
                }
                else if (argument_type != "identifier" && argument_type != "pointer_expression") {
                    continue;
                }
                TSTreeCursor cursor = ts_tree_cursor_new(argument_node);
                NodeList pnodes;
                init_node_list(&pnodes);
                make_move(&cursor, DOWN, &pnodes, "identifier");
                Node *tmp = pnodes.head;
                for (int j = 0; j < pnodes.listLen; j ++ ) {
                    tmp = tmp->next;
                    std::string name = get_content(tmp->data, source);
                    ret[name] = "scanf" + std::to_string(scanf_idx ++ );
                    Variable *v = NULL;
                    if (var_map.find(name) != var_map.end()) {
                        v = var_map.at(name);
                        v->is_input = true;
                    }
                }
            }
        }
    }
    return ret;
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

bool in_node_list(NodeList *all_nodes, TSNode node, const char *source)
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

bool is_valid_condition(Json::Value conditions, int con_num)
{
    for (int i = conditions.size() - 1; i > conditions.size() - 1 - con_num; i -- ) {
        Json::Value con = conditions[i];
        if (con["type"] == "binary_expression" &&
           con["left"]["type"] == "number_literal" &&
           con["right"]["type"] == "number_literal") {
            std::string left = con["left"]["value"].asString();
            std::string right = con["right"]["value"].asString();
            int left_num = std::stoll(left);
            int right_num = std::stoll(right);
            if (con["op"] == ">=") {
                return left_num >= right_num;
            } else if (con["op"] == "<=") {
                return left_num <= right_num;
            } else if (con["op"] == "!=") {
                return left_num != right_num;
            } else if (con["op"] == "==") {
                return left_num == right_num;
            } else if (con["op"] == ">") {
                return left_num > right_num;
            } else if (con["op"] == "<") {
                return left_num < right_num;
            }
        }
    }
    return true;
}

Json::Value parse_expression(TSNode expression_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars, int get_self)
{
    std::string node_type = ts_node_type(expression_node);
    Json::Value ret;
    if (node_type == "assignment_expression" || node_type == "update_expression") {
        ret = parse_assignment_expression(expression_node, source, var_map, changed_vars);
    } else if (node_type == "declaration") {
        TSNode declarator_node = ts_node_child_by_field_name(expression_node, "declarator", strlen("declarator"));
        std::string declarator_type = ts_node_type(declarator_node);
        if (declarator_type == "init_declarator") {
            TSNode dec_node = ts_node_child_by_field_name(declarator_node, "declarator", strlen("declarator"));
            TSNode val_node = ts_node_child_by_field_name(declarator_node, "value", strlen("value"));
            Json::Value val = parse_expression(val_node, source, var_map, changed_vars);
            NodeList all_id_nodes;
            TSTreeCursor cursor = ts_tree_cursor_new(dec_node);
            init_node_list(&all_id_nodes);
            make_move(&cursor, DOWN, &all_id_nodes, "identifier");
            Node *tmp = all_id_nodes.head;
            for (int i = 0; i < all_id_nodes.listLen; i ++ ) {
                tmp = tmp->next;
                std::string name = get_content(tmp->data, source);
                if (var_map.find(name) == var_map.end()) {
                    Variable *v = new Variable;
                    v->name = name;
                    v->is_input = false;
                    v->is_global = false;
                    v->expression = val;
                    var_map.emplace(name, v);
                } else {
                    var_map[name]->expression = val;
                }
            }
        } else
            add_declarator_to_var_map(var_map, expression_node, source);
    } else if (node_type == "identifier") {
        char *id_name = get_content(expression_node, source);
        Variable *v = NULL;
        // Use variable name to find the variable struct, if
        // not found, the variable is considered global
        if (var_map.find(id_name) == var_map.end()) {
            Variable *new_v;
            new_v = new Variable;
            new_v->name = id_name;
            new_v->expression["type"] = "input_symbol";
            new_v->expression["value"] = "global" + std::to_string(global_num ++);
            new_v->is_input = false;
            new_v->is_output = false;
            new_v->is_global = true;  // set the global field to ture
            var_map.emplace(id_name, new_v);
            // std::cout << id_name << std::endl;
            // std::cout << 111 << std::endl;
        }
        v = var_map.at(id_name);
        // check whether the variable is assigned
        if (!v->expression.empty() && !get_self) {
            ret = v->expression;
        } else {
            ret["type"] = node_type;
            ret["value"] = v->name;
        }
    } else if (node_type == "unary_expression") {
        TSNode arg_node = ts_node_child_by_field_name(expression_node, "argument", strlen("argument"));
        TSNode op_node = ts_node_child_by_field_name(expression_node, "operator", strlen("operator"));
        Json::Value op = ts_node_type(op_node);
        ret["type"] = node_type;
        ret["op"] = op;
        ret["value"] = parse_expression(arg_node, source, var_map, changed_vars);
    } else if (node_type == "subscript_expression") {
        TSNode arg_node = ts_node_child_by_field_name(expression_node, "argument", strlen("argument"));
        TSNode idx_node = ts_node_child_by_field_name(expression_node, "index", strlen("index"));
        Json::Value arg_expression = parse_expression(arg_node, source, var_map, changed_vars);
        Json::Value idx_expression = parse_expression(idx_node, source, var_map, changed_vars);
        ret["type"] = "pointer_expression";
        ret["op"] = "*";
        ret["value"]["type"] = "binary_expression";
        ret["value"]["left"] = arg_expression;
        ret["value"]["op"] = "+";
        ret["value"]["right"] = idx_expression;
    } else if (node_type == "comma_expression") {
        TSNode left_node = ts_node_child_by_field_name(expression_node, "left", strlen("left"));
        TSNode right_node = ts_node_child_by_field_name(expression_node, "right", strlen("right"));
        parse_expression(left_node, source, var_map, changed_vars);
        ret = parse_expression(right_node, source, var_map, changed_vars, get_self);
    } else if (node_type.find("_literal") != std::string::npos && 
             node_type.find("literal_") == std::string::npos) {
        // Get the value of the literal directly
        ret["type"] = node_type;
        std::string literal = get_content(expression_node, source);
        if (node_type == "number_literal" && literal.find(".") == std::string::npos) {
            ret["tag"] = literal;
            if (literal.find("0x") != std::string::npos) {
                int tmp;
                sscanf(literal.c_str(), "%x", &tmp);
                literal = std::to_string(tmp);
            } else {
                int tmp;
                char tmp2[100];
                sprintf(tmp2, "%llx", std::stoll(literal));
                sscanf(tmp2, "%x", &tmp);
                literal = std::to_string(tmp);
            }
        }
        ret["value"] = literal;
    } else if (node_type == "cast_expression") {
        // Get the variable node from a cast node and parse it
        TSNode cnt_node = ts_node_child(expression_node, 3);
        ret = parse_expression(cnt_node, source, var_map, changed_vars, get_self);
    } else if (node_type == "parenthesized_expression") {
        // parse the node in parentheses
        TSNode cnt_node = ts_node_child(expression_node, 1);
        ret = parse_expression(cnt_node, source, var_map, changed_vars, get_self);
    } else if (node_type == "pointer_expression") {
        TSNode op_node = ts_node_child_by_field_name(expression_node, "operator", strlen("operator"));
        TSNode arg_node = ts_node_child_by_field_name(expression_node, "argument", strlen("argument"));
        std::string op = ts_node_type(op_node);
        std::string arg_type = ts_node_type(arg_node);
        if (op == "&") {
            // if reference, return the source content directly
            if (arg_type == "subscript_expression") {
                Json::Value subscript_node = parse_expression(arg_node, source, var_map, changed_vars, GET_SELF);
                ret = subscript_node["value"];
            } else {
                ret["type"] = "pointer_expression";
                ret["op"] = op;
                ret["value"]["type"] = "identifier";
                ret["value"]["value"] = get_content(arg_node, source);
            }
        } else {  // i.e. op == "*"
            // if dereference, parse the variable node
            bool is_arg_ref = false;
            if (arg_type == "pointer_expression") {
                std::string arg_op = ts_node_type(ts_node_child_by_field_name(arg_node, "operator", strlen("operator")));
                if (arg_op == "&") {
                    is_arg_ref = true;
                    TSNode arg_arg_node = ts_node_child_by_field_name(arg_node, "argument", strlen("argument"));
                    ret = parse_expression(arg_arg_node, source, var_map, changed_vars, GET_SELF);
                }    
            }
            if (!is_arg_ref) {
                ret["type"] = "pointer_expression";
                ret["op"] = op;
                ret["value"] = parse_expression(arg_node, source, var_map, changed_vars);
            }
        }
    }
    else if (node_type == "binary_expression") {
        TSNode left_node = ts_node_child_by_field_name(expression_node, "left", strlen("left"));
        TSNode right_node = ts_node_child_by_field_name(expression_node, "right", strlen("right"));
        Json::Value cnt1 = parse_expression(left_node, source, var_map, changed_vars);
        Json::Value op = ts_node_type(ts_node_child_by_field_name(expression_node, "operator", strlen("operator")));
        Json::Value cnt3 = parse_expression(right_node, source, var_map, changed_vars);
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
            ret = parse_expression(first_node, source, var_map, changed_vars);
        } else {
            // prefix operation, the variable incremented/decremented by one
            const char *op = ts_node_type(first_node);
            Json::Value cnt = parse_expression(second_node, source, var_map, changed_vars);
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
        std::string func_name = get_content(ts_node_child_by_field_name(expression_node, "function", strlen("function")), source);
        if (func_name == "f_scanf_nop" && var_id_map.find(ts_node_start_byte(expression_node)) != var_id_map.end()) {
            ret["type"] = "input_symbol";
            ret["value"] = var_id_map.at(ts_node_start_byte(expression_node));
        } else {
            // get argument_list node
            Json::Value arguments;
            TSNode argument_list = ts_node_child_by_field_name(expression_node, "arguments", strlen("arguments"));
            int argument_num = ts_node_child_count(argument_list);
            for (int i = 0; i < argument_num; i ++ ) {
                // parse arguments one by one
                TSNode argument = ts_node_child(argument_list, i);
                std::string argument_type = ts_node_type(argument);
                if (argument_type != "(" && argument_type != "," && argument_type != ")") {
                    arguments.append(parse_expression(argument, source, var_map, changed_vars));
                    if ((func_name == "scanf" || func_name == "__isoc99_scanf") && var_id_map.find(ts_node_start_byte(argument)) != var_id_map.end()) {
                        std::string var_name;
                        if (argument_type == "identifier" || argument_type == "binary_expression") {
                            std::string arg_name = json_to_string(parse_expression(argument, source, var_map, changed_vars));
                            var_name = "*" + arg_name;
                        } else if (argument_type == "pointer_expression") {
                            TSNode op_node = ts_node_child_by_field_name(argument, "operator", strlen("operator"));
                            TSNode arg_node = ts_node_child_by_field_name(argument, "argument", strlen("argument"));
                            std::string arg_type = ts_node_type(arg_node);
                            if (arg_type == "identifier")
                                var_name = get_content(arg_node, source);
                            else if (arg_type == "subscript_expression")
                                var_name = json_to_string(parse_expression(arg_node, source, var_map, changed_vars));
                        } 
                        if (var_name.empty())
                            continue;
                        if (var_map.find(var_name) == var_map.end()) {
                            Variable *new_v = new Variable;
                            new_v->name = var_name;
                            new_v->is_input = true;
                            new_v->is_output = false;
                            new_v->is_global = false;
                            new_v->expression["type"] = "input_symbol";
                            new_v->expression["value"] = var_id_map.at(ts_node_start_byte(argument));
                            var_map.emplace(var_name, new_v);
                        } else {
                            Variable *v = var_map.at(var_name);
                            Variable *changed_v = variable_copy(v);
                            changed_vars.emplace(changed_v->name, changed_v);
                            v->expression = Json::nullValue;
                            v->expression["type"] = "input_symbol";
                            v->expression["value"] = var_id_map.at(ts_node_start_byte(argument));
                        }
                    }
                }
            }
            ret["type"] = "input_symbol";
            ret["value"] = func_name;
        }
    } else if (node_type == "sizeof_expression") {
        // TSNode type_node = ts_node_child_by_field_name(expression_node, "type", strlen("type"));
        // TSNode value_node = ts_node_child_by_field_name(expression_node, "value", strlen("value"));
        // Json::Value arguments = Json::arrayValue;
        // arguments.append(parse_expression(value_node, source, var_map, changed_vars));
        ret["type"] = "input_symbol";
        ret["value"] = "sizeof";
    } else if (node_type == "return_statement") {
        TSNode return_node = ts_node_child(expression_node, 1);
        Json::Value return_cnt = parse_expression(return_node, source, var_map, changed_vars);
        if (!return_cnt.empty()) {
            ret["type"] = node_type;
            ret["value"] = return_cnt;
        }
    }

    while(simplification(ret));

    if (!get_self) {
        std::string str = json_to_string(ret);
        if (var_map.find(str) != var_map.end() && !var_map.at(str)->expression.empty())
            ret = var_map.at(str)->expression;
    }
    return ret;
}

Json::Value parse_assignment_expression(TSNode assign_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &changed_vars)
{
    TSNode var_node;
    Json::Value ret;
    Json::Value expression;  // The expression of the variable obtained by this assignment statement
    if (strcmp(ts_node_type(assign_node), "update_expression") == 0)
    {  // Only consider identifier update

        var_node = ts_node_child_by_field_name(assign_node, "argument", strlen("argument"));
        TSNode op_node = ts_node_child_by_field_name(assign_node, "operator", strlen("operator"));

        // set the expression
        Json::Value cnt = parse_expression(var_node, source, var_map, changed_vars);
        const char *op = ts_node_type(op_node);
        char *single_op = (char*)malloc(strlen(op) + 1);
        strcpy(single_op, op);
        single_op[strlen(op) - 1] = '\0';
        expression["type"] = "binary_expression";
        expression["left"] = cnt;
        expression["op"] = single_op;
        expression["right"]["type"] = "number_literal";
        expression["right"]["value"] = "1";

        if (ts_node_eq(op_node, ts_node_child(assign_node, 0)))
            ret = expression;
        else
            ret = cnt;
    }
    else
        var_node = ts_node_child_by_field_name(assign_node, "left", strlen("left"));

    // Find variable node from the var_map by variable name
    std::string var_name = get_content(var_node, source);
    std::string var_type = ts_node_type(var_node);
    if (var_type == "subscript_expression" || var_type == "parenthesized_expression" || var_type == "pointer_expression") {
        Json::Value var_json = parse_expression(var_node, source, var_map, changed_vars, GET_SELF);
        var_name = json_to_string(var_json);
    }
    Variable *v = NULL;
    if (var_map.find(var_name) == var_map.end()) {
        // If not found, the variable is considered global
        Variable *new_v;
        new_v = new Variable;
        new_v->name = var_name;
        new_v->expression["type"] = "input_symbol";
        new_v->expression["value"] = "global" + std::to_string(global_num ++);
        new_v->is_input = false;
        new_v->is_output = false;
        new_v->is_global = true;  // set the global field to ture
        var_map.emplace(var_name, new_v);
        // std::cout << var_name << std::endl;
        // std::cout << 222 << std::endl;
    }
    v = var_map.at(var_name);

    // After the assignment statement, the expression of the variable will  
    // change, record the previous expression, convenient recovery
    Variable *changed_v = variable_copy(v);
    changed_vars.emplace(changed_v->name, changed_v);

    if (expression.empty()) {
        // not the update_expression
        // set the expression
        TSNode right_node = ts_node_child_by_field_name(assign_node, "right", strlen("right"));
        TSNode op_node = ts_node_child_by_field_name(assign_node, "operator", strlen("operator"));
        const char *op = ts_node_type(op_node);
        if (std::find(begin(self_ops), end(self_ops), op) != end(self_ops)) {
            // "+=", "-=", "*=", etc.
            char *single_op = (char*)malloc(strlen(op) + 1);
            strcpy(single_op, op);
            single_op[strlen(op) - 1] = '\0';
            Json::Value right = parse_expression(right_node, source, var_map, changed_vars);
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
            expression = parse_expression(right_node, source, var_map, changed_vars);
        }
        ret = expression;
    }

    while(simplification(expression));
    while(simplification(ret));
    v->expression = expression;
    return ret;
}

Json::Value parse_branch_condition(TSNode con_node, const char* source, std::unordered_map<std::string, Variable*> &var_map, std::unordered_map<std::string, Variable*> &brach_changed_vars, std::unordered_map<std::string, Variable*> &changed_vars, bool condition)
{
    std::string node_type = ts_node_type(con_node);
    Json::Value ret;
    TSNode var_node;
    Json::Value expression = Json::nullValue;
    if (node_type == "binary_expression") {
        TSNode left_node = ts_node_child_by_field_name(con_node, "left", strlen("left"));
        TSNode op_node = ts_node_child_by_field_name(con_node, "operator", strlen("operator"));
        TSNode right_node = ts_node_child_by_field_name(con_node, "right", strlen("right"));
        std::string op_type = ts_node_type(op_node);
        if (std::find(begin(relational_ops), end(relational_ops), op_type) != end(relational_ops)) {
            Json::Value left_cnt = parse_expression(left_node, source, var_map, changed_vars);
            Json::Value right_cnt = parse_expression(right_node, source, var_map, changed_vars);

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
    } else if (node_type == "comma_expression") {
        TSNode left_node = ts_node_child_by_field_name(con_node, "left", strlen("left"));
        TSNode right_node = ts_node_child_by_field_name(con_node, "right", strlen("right"));
        parse_expression(left_node, source, var_map, changed_vars);
        ret = parse_branch_condition(right_node, source, var_map, brach_changed_vars, changed_vars, condition);
    } else if (node_type == "parenthesized_expression") {
        TSNode child = ts_node_child(con_node, 1);
        ret = parse_branch_condition(child, source, var_map, brach_changed_vars, changed_vars, condition);
    } else if (node_type == "unary_expression") {
        TSNode unary_node = ts_node_child_by_field_name(con_node, "operator", strlen("operator"));
        if (strcmp(ts_node_type(unary_node), "!") == 0) {
            TSNode expression_node = ts_node_child_by_field_name(con_node, "argument", strlen("argument"));
            Json::Value expression_cnt = parse_expression(expression_node, source, var_map, changed_vars);
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
        Json::Value expression_cnt = parse_expression(con_node, source, var_map, changed_vars);
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
            new_v->expression["type"] = "input_symbol";
            new_v->expression["value"] = "global" + std::to_string(global_num ++);
            new_v->is_input = false;
            new_v->is_output = false;
            new_v->is_global = true;  // set the global field to ture
            var_map.emplace(var_name, new_v);
            // std::cout << var_name << std::endl;
            // std::cout << 333 << std::endl;
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
            brach_changed_vars.emplace(changed_v->name, changed_v);
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
        for (int i = 0; i < conditions.size(); i ++ ) {
            while (simplification(conditions[i]));
        }
        for (int i = 0; i < outputs.size(); i ++ ) {
            while (simplification(outputs[i]));
        }
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
        std::string node_type = ts_node_type(node);
        // std::cout << get_content(node, source) << std::endl;
        parse_expression(node, source, var_map, changed_vars);
        // match the nodes to analyze and perform the analysis
        if (node_type == "switch_statement" || node_type == "case_statement")
            continue;
        NodeList sub_nodes;
        TSTreeCursor cursor = ts_tree_cursor_new(node);
        init_node_list(&sub_nodes);
        make_move(&cursor, DOWN, &sub_nodes, "");
        Node *tmp = sub_nodes.head;
        for (int j = 0; j < sub_nodes.listLen; j ++) {
            tmp = tmp->next;
            if (in_node_list(analyze_nodes, tmp->data, source)) {
                std::string type = ts_node_type(tmp->data);
                if (type == "return_statement") {
                    Json::Value out_put = parse_expression(tmp->data, source, var_map, changed_vars);
                    if (out_put.empty()) continue;
                    out_put = out_put["value"];
                    out_put["id"] = var_id_map[ts_node_start_byte(tmp->data)];
                    TSNode value_node = ts_node_child(tmp->data, 1);
                    std::string value_type = ts_node_type(value_node);
                    if (value_type == "identifier") {
                        out_put["name"] = get_content(value_node, source);
                    } else {
                        out_put["name"] = out_put["id"];
                    }
                    output_num ++;
                    outputs.append(out_put);
                } else if (type == "call_expression") {
                    TSNode arg_list = ts_node_child_by_field_name(tmp->data, "arguments", strlen("arguments"));
                    int arg_num = ts_node_child_count(arg_list);
                    for (int i = 0; i < arg_num; i ++ ) {
                        TSNode arg = ts_node_child(arg_list, i);
                        std::string arg_type = ts_node_type(arg);
                        if (arg_type != "(" && arg_type != "," && arg_type != ")") {
                            if (var_id_map.find(ts_node_start_byte(arg)) != var_id_map.end()) {
                                Json::Value out_put = parse_expression(arg, source, var_map, changed_vars);
                                out_put["id"] = var_id_map[ts_node_start_byte(arg)];
                                if (arg_type == "identifier") {
                                    out_put["name"] = get_content(arg, source);
                                } else {
                                    out_put["name"] = out_put["id"];
                                }
                                output_num ++;
                                outputs.append(out_put);
                            }  // end if
                        }  // end if
                    }  // end for
                }  // end if
            }  // end if
        }  // end for
    }  // end for

    // judge switch statement
    bool is_switch = false;
    Json::Value switch_condition;
    TSNode n = nodes.back();
    is_switch = (strcmp(ts_node_type(n), "switch_statement") == 0);
    if (is_switch) {
        TSNode con_node = ts_node_child_by_field_name(n, "condition", strlen("condition"));
        TSNode cnt_node = ts_node_child(con_node, 1);
        switch_condition = parse_expression(cnt_node, source, var_map, changed_vars);
    }

    // DFS
    for (int i = 0; i < out_edges.size(); i ++ ) {
        std::unordered_map<std::string, Variable*> branch_changed_vars;
        CFGEdges *out_edge = out_edges.at(i);
        // Parse jump conditions
        int con_num = 0;
        if (out_edge->get_condition() == TRUE) {
            Json::Value con = parse_branch_condition(nodes.back(), source, var_map, branch_changed_vars, changed_vars, true);
            if (!con.empty()) {
                con_num ++ ;
                conditions.append(con);
            }
        } else if (out_edge->get_condition() == FALSE) {
            Json::Value con = parse_branch_condition(nodes.back(), source, var_map, branch_changed_vars, changed_vars, false);
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
                Json::Value value = parse_expression(value_node, source, var_map, changed_vars);
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
                            Json::Value value = parse_expression(value_node, source, var_map, changed_vars);
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
        while (con_num --) {
            Json::Value del;  // no use but need
            conditions.removeIndex(conditions.size()-1, &del);
        }
    }

    // Restore the site
    Json::Value del;  // no ues but need
    while (output_num -- ) outputs.removeIndex(outputs.size()-1, &del);
    for (auto it = changed_vars.begin(); it != changed_vars.end(); it ++ ) {
        var_map.at((*it).first) = (*it).second;
    }
    visit.at(edge) = false;
}

const char *run_se(TSTree *tree, const char * source, NodeList *analyze_nodes, Json::Value &callees)
{
    try {
        //get_variables(tree, source);
        CFG *cfg = new CFG(tree, source);
        cfg->cfg_build();
        // cfg->print_cfg();
        BasicBlock *entry = cfg->get_entry();
        CFGEdges *entry_edge = entry->get_out_edges().at(0);
        std::vector<BasicBlock*> bbs = cfg->get_bbs();

        std::unordered_map<CFGEdges*, bool> visit;
        visit.emplace(entry_edge, false);
        for (int i = 0; i < bbs.size(); i ++ ){ 
            std::vector<CFGEdges*> out_edges = bbs.at(i)->get_out_edges();
            for (int j = 0; j < out_edges.size(); j ++ ) {
                visit.emplace(out_edges.at(j), false);
            }
        }

        std::unordered_map<std::string, Variable*> var_map;
        std::unordered_map<std::string, Variable*> changed_vars;

        NodeList func_node_list;
        parse_decompiler_output(tree, &func_node_list, "function_definition");
        TSNode func_node = func_node_list.head->next->data;
        TSTreeCursor cursor = ts_tree_cursor_new(func_node);

        // get parametersx
        get_parameters(&cursor, var_map, source);
        // get input from scanf function
        // Json::Value inputs = find_input_variables(tree, source, var_map);

        Json::Value se_res;

        Json::Value conditions = Json::arrayValue;
        Json::Value outputs = Json::arrayValue;
        Json::Value paths;
        // cfg->print_cfg();
        symbolic_execution(cfg, entry_edge, visit, source, analyze_nodes, var_map, paths, conditions, outputs);

        se_res["paths"] = paths;
        se_res["scanf_num"] = scanf_num;
        se_res["params_num"] = params_num;
        se_res["global_num"] = global_num;
        se_res["callees"] = callees;
        char *ret = new char[strlen(se_res.toStyledString().c_str()) + 1];
        strcpy(ret, se_res.toStyledString().c_str());
        // std::cout << se_res.toStyledString() << std::endl;
        return ret;
    } catch(std::exception e) {
        throw e;
    }
}

extern "C" const char *process(const char *str, MODE mode)
{
    try{
        scanf_num = 0;
        params_num = 0;
        global_num = 0;
        var_id_map.clear();

        char *source = NULL;
        if (mode == FILE_NAME) {
            std::cout << "Load from file" << std::endl;
            source = read_source(str);
        } else if (mode == FUNC_CNT) {
            std::cout << "Load from string" << std::endl;
            int len = strlen(str);
            source = (char*)malloc(len + 1);
            strcpy(source, str);
            siplify_source(source);
        }
        
        assert(source);
        // if (strstr(source, "?") != NULL)
        //     return NULL;

        // std::string s(source);
        // std::string pattern("(([^\\.]+\\.[^\\.]+)|([[:alnum:]]+->[[:alnum:]]+))");
        // std::smatch results;
        // std::regex r(pattern);
        // if (regex_search(s, results, r)) {
        //     return NULL;
        //     // std::cout << "May be contain field_expression" << std::endl;
        //     // exit(0);
        // }

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

        // find printf and return statement
        // name the output variable
        NodeList analyze_nodes;
        parse_decompiler_output(tree, &analyze_nodes, "call_expression");
        Node *tmp = analyze_nodes.head;
        int printf_num = 0;
        Json::Value callees;
        while (tmp->next != analyze_nodes.tail) {
            Node *tmp2 = tmp;
            tmp = tmp->next;
            TSNode func_node = ts_node_child_by_field_name(tmp->data, "function", strlen("function"));
            std::string func_name = get_content(func_node, source);
            bool visited = false;
            for (auto callee: callees) {
                if (callee.asString() == func_name) {
                    visited = true;
                    break;
                }
            }
            if (!visited) callees.append(func_name);
            if (func_name.find("printf") != std::string::npos) {
                TSNode arg_list = ts_node_child_by_field_name(tmp->data, "arguments", strlen("arguments"));
                int arg_num = ts_node_child_count(arg_list);
                bool is_first_arg = true;
                bool is_second_arg = true;
                for (int i = 0; i < arg_num; i ++ ) {
                    TSNode arg = ts_node_child(arg_list, i);
                    std::string arg_type = ts_node_type(arg);
                    if (arg_type != "(" && arg_type != "," && arg_type != ")") {
                        bool is_var_arg = false;
                        if (func_name == "__printf_chk" || func_name == "_printf_chk") {
                            if (is_first_arg) is_first_arg = false;
                            else if (is_second_arg) is_second_arg = false;
                            else is_var_arg = true;
                        } else if (func_name == "printf") {
                            if (is_first_arg) is_first_arg = false;
                            else is_var_arg = true;
                        } else if (func_name == "f_printf")
                            is_var_arg = true;
                        if (is_first_arg) {
                            is_first_arg = false;
                            if (arg_type == "string_literal") is_var_arg = false;
                        }
                        if (is_var_arg) {
                            std::string name = "printf" + std::to_string(printf_num ++ );
                            var_id_map.emplace(ts_node_start_byte(arg), name);
                        }
                    }
                }
            } else {
                if (func_name == "scanf" || func_name == "__isoc99_scanf") {
                    TSNode arg_list = ts_node_child_by_field_name(tmp->data, "arguments", strlen("arguments"));
                    int arg_num = ts_node_child_count(arg_list);
                    bool is_first_arg = true;
                    for (int i = 0; i < arg_num; i ++ ) {
                        TSNode arg = ts_node_child(arg_list, i);
                        std::string arg_type = ts_node_type(arg);
                        if (arg_type != "(" && arg_type != "," && arg_type != ")") {
                            if (is_first_arg) {
                                is_first_arg = false;
                                continue;
                            }
                            std::string name = "scanf" + std::to_string(scanf_num ++ );
                            var_id_map.emplace(ts_node_start_byte(arg), name);
                        }
                    }
                } else if (func_name == "f_scanf_nop") {
                    std::string name = "scanf" + std::to_string(scanf_num ++ );
                    var_id_map.emplace(ts_node_start_byte(tmp->data), name);
                }
                tmp2->next = tmp->next;
                analyze_nodes.listLen -- ;
                tmp = tmp2;
            }
        }  // when run out while loop, tmp->next point to analyze_nodes.tail
        NodeList return_nodes;
        parse_decompiler_output(tree, &return_nodes, "return_statement");
        Node *tmp2 = return_nodes.head->next;
        int return_num = 0;
        while (tmp2 != return_nodes.tail) {
            std::string name = "return" + std::to_string(return_num ++ );
            var_id_map.emplace(ts_node_start_byte(tmp2->data), name);
            Node *tmp3 = tmp2->next;
            tmp2->next = tmp->next;
            tmp->next = tmp2;
            tmp = tmp2;
            tmp2 = tmp3;
            analyze_nodes.listLen ++ ;
        }

        NodeList sizeof_nodes;
        parse_decompiler_output(tree, &sizeof_nodes, "sizeof_expression");
        if (sizeof_nodes.listLen > 0)
            callees.append("sizeof");

        // tmp = analyze_nodes.head;
        // while (tmp->next != analyze_nodes.tail) {
        //     tmp = tmp->next;
        //     std::cout << ts_node_type(tmp->data) << ":  " << get_content(tmp->data, source) << std::endl;
        // }
        const char *ret = run_se(tree, source, &analyze_nodes, callees);

        ts_tree_delete(tree);
        ts_parser_delete(parser);
        free(source);

        return ret;
    } catch(std::exception e) {
        std::cout << "Wrong!!!" << std::endl;
        return NULL;
    }
}

int main()
{
    // process("/home/eval/POJ/test/c/10-11-11/main.txt", FILE_NAME);
    process("./s_test.c", FILE_NAME);
    return 0;
}