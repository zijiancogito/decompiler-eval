#include <iostream>
#include <cstring>
#include <vector>
#include <algorithm>
#include <set>
#include <queue>
#include <unordered_map>
#include "cfg.h"
extern "C" {
TSLanguage *tree_sitter_c();
}
std::string JUMP_STATEMENT[] = {"goto_statement", "break_statement", "continue_statement"};
std::string LOOP_STATEMENT[] = {"for_statement", "while_statement", "do_statement"};
std::string BRANCH_STATEMENT[] = {"if_statement", "switch_statement"};

CFG::CFG(TSTree *tree, const char *source): tree(tree), source(source)
{  
    this->entry = new BasicBlock;
    this->exit = new BasicBlock;
    this->entry->set_entry();
    this->exit->set_exit();
}

void CFG::get_ast_nodes()
{
    // Get all AST nodes from TSTree
    NodeList *all_nodes = new NodeList;
    parse_decompiler_output(this->tree, all_nodes, "");

    // Save nodes in rows
    int pre_row = -1;
    int cur_row;
    Node *tmp = all_nodes->head;
    while (tmp->next != all_nodes->tail) {
        tmp = tmp->next;
        TSNode node = tmp->data;
        cur_row = ts_node_start_point(node).row;
        // compound_statement contains many following statements, ignore it
        if (strcmp(ts_node_type(node), "compound_statement") == 0)
            continue;

        // Add ATS nodes
        if (cur_row != pre_row) {
            // Add the first node of the new row
            if (strcmp(ts_node_type(node), "expression_statement") == 0)
                node = ts_node_child(node, 0);
            this->all_nodes.push_back(node);
            pre_row = cur_row;
        } else {
            // Add other nodes in the same row
            TSNode pre_node = this->all_nodes.back();
            int cur_col = ts_node_start_point(node).column;
            int pre_end_row = ts_node_end_point(pre_node).row;
            int pre_end_col = ts_node_end_point(pre_node).column;
            if (pre_end_row == pre_row && cur_col >= pre_end_col) {
                if (strcmp(ts_node_type(node), "expression_statement") == 0)
                    node = ts_node_child(node, 0);
                this->all_nodes.push_back(node);
            }
        }
    }
}

bool CFG::in_all_nodes(TSNode node)
{
    for (int i = 0; i < this->all_nodes.size(); i ++ ) {
        if (ts_node_eq(this->all_nodes.at(i), node))
            return true;
    }
    return false;
}

bool CFG::is_node_parsed(TSNode node)
{
    for (int i = 0; i < this->parsed_nodes.size(); i ++ ) {
        if (ts_node_eq(this->parsed_nodes.at(i), node))
            return true;
    }
    return false;
}

TSNode CFG::find_node_in_all_nodes(TSNode node)
{
    TSTreeCursor cursor = ts_tree_cursor_new(node);
    NodeList *sub_all_nodes = new NodeList;
    init_node_list(sub_all_nodes);
    make_move(&cursor, DOWN, sub_all_nodes, "");
    Node *tmp = sub_all_nodes->head;
    while (tmp->next != sub_all_nodes->tail) {
        tmp = tmp->next;
        if (in_all_nodes(tmp->data) && ts_node_is_named(tmp->data))
            return tmp->data;
    }
    return node;
}

BasicBlock *CFG::find_basic_block(TSNode node)
{
    for (int i = 0; i < this->basic_blocks.size(); i ++ ) {
        BasicBlock *bb = this->basic_blocks.at(i);
        std::vector<TSNode> nodes = bb->get_contained_nodes();
        for (int j = 0; j < nodes.size(); j ++ ) {
            if (ts_node_eq(nodes.at(j), node))
                return bb;
        }
    }
    return NULL;
}

/// @brief 
/// @param cur_bb 
/// @param branch_node 
/// @return The basic block of the node after branch_node
BasicBlock *CFG::parse_branches(BasicBlock *cur_bb, TSNode branch_node)
{
    std::string type = ts_node_type(branch_node);
    BasicBlock *bb = cur_bb;
    if (type == "if_statement") {
        std::vector<CFGEdges*> cur_out = cur_bb->get_out_edges();
        BasicBlock *par_jump_bb = NULL;
        for (int i = 0; i < cur_out.size(); i ++ ) {
            if (cur_out.at(i)->get_condition() == JMP) {
                par_jump_bb = cur_out.at(i)->get_destination();
                cur_bb->delete_out_edge(cur_out.at(i));
                par_jump_bb->delete_in_edge(cur_out.at(i));
                break;
            }
        }
        // 分析内部之前，先找到跳出节点基本块
        BasicBlock *jump_to_bb = NULL;
        BasicBlock *jump_to_after_parse_bb = NULL;
        TSNode jump_to_node = ts_node_next_sibling(branch_node);
        if (ts_node_is_null(jump_to_node) || strcmp(ts_node_type(jump_to_node), "}") == 0) {
            TSNode parent = ts_node_parent(branch_node);
            while (!ts_node_is_null(parent) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent)) == end(LOOP_STATEMENT) &&
                    strcmp(ts_node_type(parent), "labeled_statement") != 0) {
                parent = ts_node_parent(parent);
            }
            if (ts_node_is_null(parent) || jump_to_map.find(ts_node_start_byte(parent)) == jump_to_map.end()) {
                if (!ts_node_is_null(parent) && strcmp(ts_node_type(parent), "labeled_statement") == 0) {
                    jump_to_node = ts_node_next_sibling(parent);
                }
                if (!ts_node_is_null(jump_to_node)){
                    jump_to_bb = new BasicBlock;
                    jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
                    jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
                }
            } else {
                jump_to_bb = jump_to_map.at(ts_node_start_byte(parent));
                jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
            }
        } else {
            jump_to_bb = new BasicBlock;
            jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
            jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
        }
        // 若存在跳出基本块，且不在basic_blocks中，则加入basic_blocks
        if (jump_to_bb != NULL && std::count(this->basic_blocks.begin(), this->basic_blocks.end(), jump_to_bb) == 0){
                this->basic_blocks.push_back(jump_to_bb);
        }

        TSNode condition_node = ts_node_child_by_field_name(branch_node, "condition", strlen("condition"));
        std::vector<BasicBlock*> record_bbs;
        parse_condition(cur_bb, condition_node, record_bbs);

        BasicBlock *bb_true = new BasicBlock;
        if (jump_to_bb != NULL) {
            CFGEdges *edge = new CFGEdges(bb_true, jump_to_bb, JMP);
            if (bb_true->add_out_edges(edge))
                jump_to_bb->add_in_edges(edge);
        }
        if (par_jump_bb != NULL && par_jump_bb != jump_to_bb) {
            if (jump_to_bb->get_out_edges().empty()) {  // 若下一个跳出基本块不是跳转节点，则加入边
                CFGEdges *edge = new CFGEdges(jump_to_bb, par_jump_bb, JMP);
                if (jump_to_bb->add_out_edges(edge))
                    par_jump_bb->add_in_edges(edge);
            }
        }
        TSNode consequence_node = ts_node_child_by_field_name(branch_node, "consequence", strlen("consequence"));
        consequence_node = find_node_in_all_nodes(consequence_node);
        this->basic_blocks.push_back(bb_true);
        // bb 用于返回
        bb = parse_node(bb_true, consequence_node);

        BasicBlock *bb_false = new BasicBlock;
        TSNode alternative_node = ts_node_child_by_field_name(branch_node, "alternative", strlen("alternative"));
        if (!ts_node_is_null(alternative_node)) {
            alternative_node = find_node_in_all_nodes(alternative_node);
            std::string type = ts_node_type(alternative_node);
            if (type != "if_statement") { // else 语句
                if (jump_to_bb != NULL) {
                    CFGEdges *edge = new CFGEdges(bb_false, jump_to_bb, JMP);
                    if (bb_false->add_out_edges(edge))
                        jump_to_bb->add_in_edges(edge);
                }
            }
            parse_node(bb_false, alternative_node);
        } else {
            bb_false = jump_to_bb;
        }
        if (std::count(this->basic_blocks.begin(), this->basic_blocks.end(), bb_false) == 0)
            this->basic_blocks.push_back(bb_false);

        for (auto it = record_bbs.begin(); it != record_bbs.end(); it ++ ) {
            BasicBlock *con_bb = *it;
            std::vector<CFGEdges*> out_edges = con_bb->get_out_edges();
            if (out_edges.size() == 1) {
                CONDITION c = out_edges.at(0)->get_condition();
                if (c == FALSE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_true, TRUE);
                    if (con_bb->add_out_edges(edge))
                        bb_true->add_in_edges(edge);
                } else if (c == TRUE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_false, FALSE);
                    if (con_bb->add_out_edges(edge))
                        bb_false->add_in_edges(edge);
                }
            } else if (out_edges.size() == 0) {
                CFGEdges *edge_true = new CFGEdges(con_bb, bb_true, TRUE);
                if (con_bb->add_out_edges(edge_true))
                    bb_true->add_in_edges(edge_true);
                CFGEdges *edge_false = new CFGEdges(con_bb, bb_false, FALSE);
                if (con_bb->add_out_edges(edge_false))
                    bb_false->add_in_edges(edge_false);
            }
        }
    } else if (type == "switch_statement") {
        std::vector<CFGEdges*> cur_out = cur_bb->get_out_edges();
        BasicBlock *par_jump_bb = NULL;
        for (int i = 0; i < cur_out.size(); i ++ ) {
            if (cur_out.at(i)->get_condition() == JMP) {
                par_jump_bb = cur_out.at(i)->get_destination();
                cur_bb->delete_out_edge(cur_out.at(i));
                par_jump_bb->delete_in_edge(cur_out.at(i));
                break;
            }
        }
        // 分析内部之前，先找到跳出节点基本块
        BasicBlock *jump_to_bb = NULL;
        BasicBlock *jump_to_after_parse_bb = NULL;
        TSNode jump_to_node = ts_node_next_sibling(branch_node);
        if (ts_node_is_null(jump_to_node) || strcmp(ts_node_type(jump_to_node), "}") == 0) {
            TSNode parent = ts_node_parent(branch_node);
            while (!ts_node_is_null(parent) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent)) == end(LOOP_STATEMENT) &&
                    strcmp(ts_node_type(parent), "labeled_statement") != 0) {
                parent = ts_node_parent(parent);
            }
            if (ts_node_is_null(parent) || jump_to_map.find(ts_node_start_byte(parent)) == jump_to_map.end()) {
                if (!ts_node_is_null(parent) && strcmp(ts_node_type(parent), "labeled_statement") == 0) {
                    jump_to_node = ts_node_next_sibling(parent);
                }
                if (!ts_node_is_null(jump_to_node)){
                    jump_to_bb = new BasicBlock;
                    jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
                    jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
                }
            } else {
                jump_to_bb = jump_to_map.at(ts_node_start_byte(parent));
                jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
            }
        } else {
            jump_to_bb = new BasicBlock;
            jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
            jump_to_map.emplace(ts_node_start_byte(branch_node), jump_to_bb);
        }
        // 若存在跳出基本块，且不在basic_blocks中，则加入basic_blocks
        if (jump_to_bb != NULL && std::count(this->basic_blocks.begin(), this->basic_blocks.end(), jump_to_bb) == 0){
                this->basic_blocks.push_back(jump_to_bb);
        }

        cur_bb->add_nodes(branch_node);

        TSNode body_node = ts_node_child_by_field_name(branch_node, "body", strlen("body"));
        TSTreeCursor cursor = ts_tree_cursor_new(body_node);
        NodeList *all_case_nodes = new NodeList;
        init_node_list(all_case_nodes);
        make_move(&cursor, DOWN, all_case_nodes, "case_statement");
        Node *tmp = all_case_nodes->head;
        while (tmp->next != all_case_nodes->tail) {
            tmp = tmp->next;
            BasicBlock *case_bb = new BasicBlock;
            case_bb->add_nodes(tmp->data);
            this->basic_blocks.push_back(case_bb);
            std::vector<CFGEdges *> out_edges = cur_bb->get_out_edges();
            if (!out_edges.empty() && out_edges.back()->get_condition() == JMP) {
                BasicBlock *pre_case_bb = out_edges.back()->get_destination();
                CFGEdges *case_e = new CFGEdges(pre_case_bb, case_bb, JMP);
                pre_case_bb->add_out_edges(case_e);
                case_bb->add_in_edges(case_e);
            }
            CFGEdges *e = new CFGEdges(cur_bb, case_bb, JMP);
            cur_bb->add_out_edges(e);
            case_bb->add_in_edges(e);
        }

    }
    this->map.emplace(ts_node_start_byte(branch_node), bb);
    return bb;
}

BasicBlock *CFG::parse_loops(BasicBlock *cur_bb, TSNode loop_node)
{
    std::string type = ts_node_type(loop_node);
    BasicBlock *bb = cur_bb;
    if (type == "while_statement") {
        std::vector<CFGEdges*> cur_out = cur_bb->get_out_edges();
        BasicBlock *par_jump_bb = NULL;
        for (int i = 0; i < cur_out.size(); i ++ ) {
            if (cur_out.at(i)->get_condition() == JMP) {
                par_jump_bb = cur_out.at(i)->get_destination();
                cur_bb->delete_out_edge(cur_out.at(i));
                par_jump_bb->delete_in_edge(cur_out.at(i));
                break;
            }
        }

        if (!cur_bb->get_contained_nodes().empty()) {
            BasicBlock *new_bb = new BasicBlock;
            this->basic_blocks.push_back(new_bb);
            CFGEdges *e = new CFGEdges(cur_bb, new_bb, JMP);
            if (cur_bb->add_out_edges(e))
                new_bb->add_in_edges(e);
            bb = new_bb;
            cur_bb = new_bb;
        }
        jump_to_map.emplace(ts_node_start_byte(loop_node), cur_bb);  

        // 分析内部之前，先找到跳出节点基本块
        BasicBlock *jump_to_bb = NULL;
        BasicBlock *jump_to_after_parse_bb = NULL;
        TSNode jump_to_node = ts_node_next_sibling(loop_node);
        if (ts_node_is_null(jump_to_node) || strcmp(ts_node_type(jump_to_node), "}") == 0) {
            TSNode parent = ts_node_parent(loop_node);
            while (!ts_node_is_null(parent) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent)) == end(LOOP_STATEMENT) &&
                    strcmp(ts_node_type(parent), "labeled_statement") != 0) {
                parent = ts_node_parent(parent);
            }
            if (ts_node_is_null(parent) || jump_to_map.find(ts_node_start_byte(parent)) == jump_to_map.end()) {
                if (!ts_node_is_null(parent) && strcmp(ts_node_type(parent), "labeled_statement") == 0) {
                    jump_to_node = ts_node_next_sibling(parent);
                }
                if (!ts_node_is_null(jump_to_node)){
                    jump_to_bb = new BasicBlock;
                    jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
                    jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
                }
            } else {
                jump_to_bb = jump_to_map.at(ts_node_start_byte(parent));
                jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
            }
        } else {
            jump_to_bb = new BasicBlock;
            jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
            jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
        }
        // 若存在跳出基本块，且不在basic_blocks中，则加入basic_blocks
        if (jump_to_bb != NULL && std::count(this->basic_blocks.begin(), this->basic_blocks.end(), jump_to_bb) == 0){
                this->basic_blocks.push_back(jump_to_bb);
        }

        TSNode condition_node = ts_node_child_by_field_name(loop_node, "condition", strlen("condition"));
        std::vector<BasicBlock*> record_bbs;
        if (strcmp(ts_node_type(ts_node_child(condition_node, 1)), "true") != 0 && strcmp(get_content(ts_node_child(condition_node, 1), source), "1") != 0) {
            parse_condition(cur_bb, condition_node, record_bbs);
        }

        BasicBlock *bb_true = NULL;
        if (!cur_bb->get_contained_nodes().empty()) {
            bb_true = new BasicBlock;
            this->basic_blocks.push_back(bb_true);
        } else {
            bb_true = cur_bb;
        }

        CFGEdges *edge = new CFGEdges(bb_true, cur_bb, JMP);
        if (bb_true->add_out_edges(edge))
            cur_bb->add_in_edges(edge);
        
        TSNode body_node = ts_node_child_by_field_name(loop_node, "body", strlen("body"));
        body_node = find_node_in_all_nodes(body_node);
        bb = parse_node(bb_true, body_node);

        BasicBlock *bb_false = jump_to_bb;
        if (std::count(this->basic_blocks.begin(), this->basic_blocks.end(), bb_false) == 0)
            this->basic_blocks.push_back(bb_false);

        for (auto it = record_bbs.begin(); it != record_bbs.end(); it ++ ) {
            BasicBlock *con_bb = *it;
            std::vector<CFGEdges*> out_edges = con_bb->get_out_edges();
            if (out_edges.size() == 1) {
                CONDITION c = out_edges.at(0)->get_condition();
                if (c == FALSE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_true, TRUE);
                    if (con_bb->add_out_edges(edge))
                        bb_true->add_in_edges(edge);
                } else if (c == TRUE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_false, FALSE);
                    if (con_bb->add_out_edges(edge))
                        bb_false->add_in_edges(edge);
                }
            } else if (out_edges.size() == 0) {
                CFGEdges *edge_true = new CFGEdges(con_bb, bb_true, TRUE);
                if (con_bb->add_out_edges(edge_true)) {
                    bb_true->add_in_edges(edge_true);
                }
                CFGEdges *edge_false = new CFGEdges(con_bb, bb_false, FALSE);
                if (con_bb->add_out_edges(edge_false)) {
                    bb_false->add_in_edges(edge_false);
                }
            }
        }
    } else if (type == "do_statement") {
        std::vector<CFGEdges*> cur_out = cur_bb->get_out_edges();
        BasicBlock *par_jump_bb = NULL;
        for (int i = 0; i < cur_out.size(); i ++ ) {
            if (cur_out.at(i)->get_condition() == JMP) {
                par_jump_bb = cur_out.at(i)->get_destination();
                cur_bb->delete_out_edge(cur_out.at(i));
                par_jump_bb->delete_in_edge(cur_out.at(i));
                break;
            }
        }

        if (!cur_bb->get_contained_nodes().empty()) {
            BasicBlock *new_bb = new BasicBlock;
            this->basic_blocks.push_back(new_bb);
            CFGEdges *e = new CFGEdges(cur_bb, new_bb, JMP);
            if (cur_bb->add_out_edges(e))
                new_bb->add_in_edges(e);
            bb = new_bb;
            cur_bb = new_bb;
        }

        // 分析条件节点
        TSNode condition_node = ts_node_child_by_field_name(loop_node, "condition", strlen("condition"));
        std::vector<BasicBlock*> record_bbs;
        BasicBlock *con_bb = NULL;
        if (strcmp(ts_node_type(ts_node_child(condition_node, 1)), "true")!= 0 && strcmp(get_content(ts_node_child(condition_node, 1), source), "1") != 0) {
            con_bb = new BasicBlock;
            this->basic_blocks.push_back(con_bb);
            parse_condition(con_bb, condition_node, record_bbs);
        }
        if (con_bb == NULL) {
            jump_to_map.emplace(ts_node_start_byte(loop_node), cur_bb);
        } else {
            jump_to_map.emplace(ts_node_start_byte(loop_node), con_bb);
        }

        // 分析内部之前，先找到跳出节点基本块
        BasicBlock *jump_to_bb = NULL;
        BasicBlock *jump_to_after_parse_bb = NULL;
        TSNode jump_to_node = ts_node_next_sibling(loop_node);
        if (ts_node_is_null(jump_to_node) || strcmp(ts_node_type(jump_to_node), "}") == 0) {
            TSNode parent = ts_node_parent(loop_node);
            while (!ts_node_is_null(parent) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent)) == end(LOOP_STATEMENT) &&
                    strcmp(ts_node_type(parent), "labeled_statement") != 0) {
                parent = ts_node_parent(parent);
            }
            if (ts_node_is_null(parent) || jump_to_map.find(ts_node_start_byte(parent)) == jump_to_map.end()) {
                if (!ts_node_is_null(parent) && strcmp(ts_node_type(parent), "labeled_statement") == 0) {
                    jump_to_node = ts_node_next_sibling(parent);
                }
                if (!ts_node_is_null(jump_to_node)){
                    jump_to_bb = new BasicBlock;
                    jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
                    jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
                }
            } else {
                jump_to_bb = jump_to_map.at(ts_node_start_byte(parent));
                jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
            }
        } else {
            jump_to_bb = new BasicBlock;
            jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
            jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
        }
        // 若存在跳出基本块，且不在basic_blocks中，则加入basic_blocks
        if (jump_to_bb != NULL && std::count(this->basic_blocks.begin(), this->basic_blocks.end(), jump_to_bb) == 0){
                this->basic_blocks.push_back(jump_to_bb);
        }

        BasicBlock *bb_true = cur_bb;
        TSNode do_node = ts_node_child(loop_node, 0);
        bb_true->add_nodes(do_node);
        BasicBlock *jump_to = jump_out_map.at(ts_node_start_byte(loop_node));
        CFGEdges *edge = new CFGEdges(bb_true, jump_to, JMP);
        if (bb_true->add_out_edges(edge))
            jump_to->add_in_edges(edge);

        TSNode body_node = ts_node_child_by_field_name(loop_node, "body", strlen("body"));
        body_node = find_node_in_all_nodes(body_node);
        bb = parse_node(bb_true, body_node);

        BasicBlock *bb_false = jump_to_bb;
        if (std::count(this->basic_blocks.begin(), this->basic_blocks.end(), bb_false) == 0)
            this->basic_blocks.push_back(bb_false);

        for (auto it = record_bbs.begin(); it != record_bbs.end(); it ++ ) {
            BasicBlock *con_bb = *it;
            std::vector<CFGEdges*> out_edges = con_bb->get_out_edges();
            if (out_edges.size() == 1) {
                CONDITION c = out_edges.at(0)->get_condition();
                if (c == FALSE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_true, TRUE);
                    if (con_bb->add_out_edges(edge))
                        bb_true->add_in_edges(edge);
                } else if (c == TRUE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_false, FALSE);
                    if (con_bb->add_out_edges(edge))
                        bb_false->add_in_edges(edge);
                }
            } else if (out_edges.size() == 0) {
                CFGEdges *edge_true = new CFGEdges(con_bb, bb_true, TRUE);
                if (con_bb->add_out_edges(edge_true))
                    bb_true->add_in_edges(edge_true);
                CFGEdges *edge_false = new CFGEdges(con_bb, bb_false, FALSE);
                if (con_bb->add_out_edges(edge_false))
                    bb_false->add_in_edges(edge_false);
            }
        }
    } else if (type == "for_statement") {
        std::vector<CFGEdges*> cur_out = cur_bb->get_out_edges();
        BasicBlock *par_jump_bb = NULL;
        for (int i = 0; i < cur_out.size(); i ++ ) {
            if (cur_out.at(i)->get_condition() == JMP) {
                par_jump_bb = cur_out.at(i)->get_destination();
                cur_bb->delete_out_edge(cur_out.at(i));
                par_jump_bb->delete_in_edge(cur_out.at(i));
                break;
            }
        }

        TSNode initializer_node = ts_node_child_by_field_name(loop_node, "initializer", strlen("initializer"));
        if (!ts_node_is_null(initializer_node)) {
            initializer_node = find_node_in_all_nodes(initializer_node);
            parse_node(cur_bb, initializer_node);
        }

        if (!cur_bb->get_contained_nodes().empty()) {
            BasicBlock *new_bb = new BasicBlock;
            this->basic_blocks.push_back(new_bb);
            CFGEdges *e = new CFGEdges(cur_bb, new_bb, JMP);
            if (cur_bb->add_out_edges(e))
                new_bb->add_in_edges(e);
            bb = new_bb;
            cur_bb = new_bb;
        }

        TSNode update_node = ts_node_child_by_field_name(loop_node, "update", strlen("update"));
        if (!ts_node_is_null(update_node)) {
            BasicBlock *update_bb = new BasicBlock;
            this->basic_blocks.push_back(update_bb);
            update_node = find_node_in_all_nodes(update_node);
            parse_node(update_bb, update_node);
            CFGEdges *e = new CFGEdges(update_bb, cur_bb, JMP);
            if (update_bb->add_out_edges(e))
                cur_bb->add_in_edges(e);
            jump_to_map.emplace(ts_node_start_byte(loop_node), update_bb);
        } else {
            jump_to_map.emplace(ts_node_start_byte(loop_node), cur_bb);
        }

        // 分析内部之前，先找到跳出节点基本块
        BasicBlock *jump_to_bb = NULL;
        BasicBlock *jump_to_after_parse_bb = NULL;
        TSNode jump_to_node = ts_node_next_sibling(loop_node);
        if (ts_node_is_null(jump_to_node) || strcmp(ts_node_type(jump_to_node), "}") == 0) {
            TSNode parent = ts_node_parent(loop_node);
            while (!ts_node_is_null(parent) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent)) == end(LOOP_STATEMENT) &&
                    strcmp(ts_node_type(parent), "labeled_statement") != 0) {
                parent = ts_node_parent(parent);
            }
            if (ts_node_is_null(parent) || jump_to_map.find(ts_node_start_byte(parent)) == jump_to_map.end()) {
                if (!ts_node_is_null(parent) && strcmp(ts_node_type(parent), "labeled_statement") == 0) {
                    jump_to_node = ts_node_next_sibling(parent);
                }
                if (!ts_node_is_null(jump_to_node)){
                    jump_to_bb = new BasicBlock;
                    jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
                    jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
                }
            } else {
                jump_to_bb = jump_to_map.at(ts_node_start_byte(parent));
                jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
            }
        } else {
            jump_to_bb = new BasicBlock;
            jump_to_after_parse_bb = parse_node(jump_to_bb, jump_to_node);
            jump_out_map.emplace(ts_node_start_byte(loop_node), jump_to_bb);
        }
        // 若存在跳出基本块，且不在basic_blocks中，则加入basic_blocks
        if (jump_to_bb != NULL && std::count(this->basic_blocks.begin(), this->basic_blocks.end(), jump_to_bb) == 0){
                this->basic_blocks.push_back(jump_to_bb);
        }

        TSNode condition_node = ts_node_child_by_field_name(loop_node, "condition", strlen("condition"));
        std::vector<BasicBlock*> record_bbs;
        if (!ts_node_is_null(condition_node) && strcmp(ts_node_type(condition_node), "true") != 0 && strcmp(get_content(ts_node_child(condition_node, 1), source), "1") != 0)
            parse_condition(cur_bb, condition_node, record_bbs);

        BasicBlock *bb_true = NULL;
        if (!cur_bb->get_contained_nodes().empty()) {
            bb_true = new BasicBlock;
            this->basic_blocks.push_back(bb_true);
        } else {
            bb_true = cur_bb;
        }
        BasicBlock *jump_to = jump_to_map.at(ts_node_start_byte(loop_node));
        CFGEdges *edge = new CFGEdges(bb_true, jump_to, JMP);
        if (bb_true->add_out_edges(edge))
            jump_to->add_in_edges(edge);
        
        TSNode body_node = ts_node_child_by_field_name(loop_node, "body", strlen("body"));
        body_node = find_node_in_all_nodes(body_node);
        bb = parse_node(bb_true, body_node);

        BasicBlock *bb_false = jump_to_bb;
        if (std::count(this->basic_blocks.begin(), this->basic_blocks.end(), bb_false) == 0)
            this->basic_blocks.push_back(bb_false);

        for (auto it = record_bbs.begin(); it != record_bbs.end(); it ++ ) {
            BasicBlock *con_bb = *it;
            std::vector<CFGEdges*> out_edges = con_bb->get_out_edges();
            if (out_edges.size() == 1) {
                CONDITION c = out_edges.at(0)->get_condition();
                if (c == FALSE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_true, TRUE);
                    if (con_bb->add_out_edges(edge))
                        bb_true->add_in_edges(edge);
                } else if (c == TRUE) {
                    CFGEdges *edge = new CFGEdges(con_bb, bb_false, FALSE);
                    if (con_bb->add_out_edges(edge))
                        bb_false->add_in_edges(edge);
                }
            } else if (out_edges.size() == 0) {
                CFGEdges *edge_true = new CFGEdges(con_bb, bb_true, TRUE);
                if (con_bb->add_out_edges(edge_true))
                    bb_true->add_in_edges(edge_true);
                CFGEdges *edge_false = new CFGEdges(con_bb, bb_false, FALSE);
                if (con_bb->add_out_edges(edge_false))
                    bb_false->add_in_edges(edge_false);
            }
        }
    }
    this->map.emplace(ts_node_start_byte(loop_node), bb);
    return bb;
}

BasicBlock *CFG::parse_jump(BasicBlock *cur_bb, TSNode jump_node)
{
    std::string type = ts_node_type(jump_node);
    BasicBlock *bb = cur_bb;
    if (type == "break_statement") {
        TSNode parent_node = ts_node_parent(jump_node);
        while (!ts_node_is_null(parent_node) && 
                strcmp(ts_node_type(parent_node), "switch_statement") != 0 &&
                std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent_node)) == end(LOOP_STATEMENT) ) {
            parent_node = ts_node_parent(parent_node);
        }
        if (!ts_node_is_null(parent_node)) {
            int byte = ts_node_start_byte(parent_node);
            if (strcmp(ts_node_type(parent_node), "switch_statement") == 0) {
                if (jump_to_map.count(byte) != 0) {
                    BasicBlock *jump_to_bb = jump_to_map.at(byte);
                    std::vector<CFGEdges*> out_edges = cur_bb->get_out_edges();
                    while (!out_edges.empty()) {
                        BasicBlock *des_bb = out_edges.at(0)->get_destination();
                        cur_bb->delete_out_edge(out_edges.at(0));
                        des_bb->delete_in_edge(out_edges.at(0));
                        out_edges = cur_bb->get_out_edges();
                    }
                    CFGEdges *edge = new CFGEdges(cur_bb, jump_to_bb, JMP);
                    if (cur_bb->add_out_edges(edge))
                        jump_to_bb->add_in_edges(edge);
                }
            } else {
                if (jump_out_map.count(byte) != 0) {
                    BasicBlock *jump_out_bb = jump_out_map.at(byte);
                    std::vector<CFGEdges*> out_edges = cur_bb->get_out_edges();
                    while (!out_edges.empty()) {
                        BasicBlock *des_bb = out_edges.at(0)->get_destination();
                        cur_bb->delete_out_edge(out_edges.at(0));
                        des_bb->delete_in_edge(out_edges.at(0));
                        out_edges = cur_bb->get_out_edges();
                    }
                    CFGEdges *edge = new CFGEdges(cur_bb, jump_out_bb, JMP);
                    if (cur_bb->add_out_edges(edge))
                        jump_out_bb->add_in_edges(edge);
                }
            }   
        }
    } else if (type == "continue_statement") {
        TSNode parent_node = ts_node_parent(jump_node);
        while (!ts_node_is_null(parent_node) && 
                std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent_node)) == end(LOOP_STATEMENT) ) {
            parent_node = ts_node_parent(parent_node);
        }
        if (!ts_node_is_null(parent_node)) {
            int byte = ts_node_start_byte(parent_node);
            if (jump_to_map.count(byte) != 0) {
                BasicBlock *jump_to_bb = jump_to_map.at(byte);
                std::vector<CFGEdges*> out_edges = cur_bb->get_out_edges();
                while (!out_edges.empty()) {
                    BasicBlock *des_bb = out_edges.at(0)->get_destination();
                    cur_bb->delete_out_edge(out_edges.at(0));
                    des_bb->delete_in_edge(out_edges.at(0));
                    out_edges = cur_bb->get_out_edges();
                }
                CFGEdges *edge = new CFGEdges(cur_bb, jump_to_bb, JMP);
                if (cur_bb->add_out_edges(edge))
                    jump_to_bb->add_in_edges(edge);
            }
        }
    } else if (type == "goto_statement") {
        BasicBlock *lable_bb = NULL;
        TSNode label_node = ts_node_child_by_field_name(jump_node, "label", strlen("label"));
        std::string lable_str = get_content(label_node, this->source);
        std::vector<CFGEdges*> out_edges = cur_bb->get_out_edges();
        while (!out_edges.empty()) {
            BasicBlock *des_bb = out_edges.at(0)->get_destination();
            cur_bb->delete_out_edge(out_edges.at(0));
            des_bb->delete_in_edge(out_edges.at(0));
            out_edges = cur_bb->get_out_edges();
        }
        CFGEdges *edge = new CFGEdges(cur_bb, lable_bb, JMP);
        cur_bb->add_out_edges(edge);
        this->goto_map.emplace(cur_bb, lable_str);
    }
    return bb;
}

/// @brief Parse the compound condition and add to the basic block
/// @param cur_bb 
/// @param condition_node 
/// @return The last basic block after adding the compound condition
BasicBlock *CFG::parse_condition(BasicBlock *cur_bb, TSNode condition_node, std::vector<BasicBlock*> &record_bbs)
{
    std::string type = ts_node_type(condition_node);
    BasicBlock *ret_bb = cur_bb;
    if (std::find(record_bbs.begin(), record_bbs.end(), cur_bb) == record_bbs.end())
        record_bbs.push_back(cur_bb);
    if (type == "parenthesized_expression") {
        // Unparentheses to parse the nodes in parentheses
        TSNode child_node = ts_node_child(condition_node, 1);
        ret_bb = parse_condition(cur_bb, child_node, record_bbs);
    } else if (type == "binary_expression") {
        TSNode left_node = ts_node_child_by_field_name(condition_node, "left", strlen("left"));
        TSNode op_node = ts_node_child_by_field_name(condition_node, "operator", strlen("operator"));
        TSNode right_node = ts_node_child_by_field_name(condition_node, "right", strlen("right"));
        std::string op_type = ts_node_type(op_node);
        if (op_type == "||" || op_type == "&&") {
            // Parse left condition first
            ret_bb = parse_condition(cur_bb, left_node, record_bbs);
            // Create initial basic block for right condition
            BasicBlock *bb = new BasicBlock;
            // Create edges indicate the left condition basic blocks point to 
            // the initial basic block of right condition
            auto it = std::find(record_bbs.begin(), record_bbs.end(), cur_bb);
            for (; it != record_bbs.end(); it ++ ) {
                BasicBlock *pre_bb = *it;
                CFGEdges *edge;
                if (op_type == "||") {
                    edge = new CFGEdges(pre_bb, bb, FALSE);
                } else {  // op_type == "&&"
                    edge = new CFGEdges(pre_bb, bb, TRUE);
                }
                if (pre_bb->add_out_edges(edge))
                    bb->add_in_edges(edge);
            }
            
            this->basic_blocks.push_back(bb);
            if (std::find(record_bbs.begin(), record_bbs.end(), cur_bb) == record_bbs.end())
                record_bbs.push_back(cur_bb);
            // Parse next condition
            ret_bb = parse_condition(bb, right_node, record_bbs);

        } else {
            ret_bb->add_nodes(condition_node);
        }
    } else if (type == "unary_expression") {
        TSNode op_node = ts_node_child_by_field_name(condition_node, "operator", strlen("operator"));
        std::string op_type = ts_node_type(op_node);
        if (op_type == "!") {
            TSNode argument_node = ts_node_child_by_field_name(condition_node, "argument", strlen("argument"));
            ret_bb = parse_condition(cur_bb, argument_node, record_bbs);
            BasicBlock *bb = new BasicBlock;
            int idx = std::find(record_bbs.begin(), record_bbs.end(), cur_bb) - record_bbs.begin();
            for (int i = idx; i < record_bbs.size(); i ++ ) {
                std::vector<CFGEdges*> out_edges = basic_blocks.at(i)->get_out_edges();
                if (out_edges.size() == 1) {
                    CONDITION c = out_edges.at(0)->get_condition();
                    if (c != JMP) {
                        CFGEdges *edge = new CFGEdges(basic_blocks.at(i), bb, CONDITION(c ^ 1));
                        if (basic_blocks.at(i)->add_out_edges(edge))
                            bb->add_in_edges(edge);
                    }
                } else if (out_edges.size() == 0) {
                    CFGEdges *edge = new CFGEdges(basic_blocks.at(i), bb, JMP);
                    if (basic_blocks.at(i)->add_out_edges(edge))
                        bb->add_in_edges(edge);
                }
            }
            this->basic_blocks.push_back(bb);
            if (std::find(record_bbs.begin(), record_bbs.end(), bb) == record_bbs.end())
                record_bbs.push_back(bb);
            bb->add_nodes(condition_node);
            ret_bb = bb;
        } else {
            ret_bb->add_nodes(condition_node);
        }
    } else {
        ret_bb->add_nodes(condition_node);
    }

    return ret_bb;
}

BasicBlock *CFG::parse_node(BasicBlock *cur_bb, TSNode node)
{
    std::string type = ts_node_type(node);
    BasicBlock *bb = find_basic_block(node);
    if (bb != NULL) {
        cur_bb = bb;
    } else if (type == "}") {  // 复合语句结束点
        if (cur_bb->get_out_edges().empty()) {
            TSNode parent_node = ts_node_parent(node);
            while (!ts_node_is_null(parent_node) && 
                    std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), ts_node_type(parent_node)) == end(BRANCH_STATEMENT) &&
                    std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), ts_node_type(parent_node)) == end(LOOP_STATEMENT) ) {
                parent_node = ts_node_parent(parent_node);
            }
            if (!ts_node_is_null(parent_node) && jump_to_map.find(ts_node_start_byte(parent_node)) != jump_to_map.end()) {
                BasicBlock *jump_to_bb = jump_to_map.at(ts_node_start_byte(parent_node));
                CFGEdges *edge = new CFGEdges(cur_bb, jump_to_bb, JMP);
                cur_bb->add_out_edges(edge);
                jump_to_bb->add_in_edges(edge);
            }
        }
    } else if (!ts_node_is_named(node) ||
                type == "translation_unit" ||
                type == "function_definition" ||
                type == "preproc_include" ||
                type == "comment"
                ) {  // 忽略
        this->parsed_nodes.push_back(node);
        return cur_bb;
    } else if (is_node_parsed(node)){
        int byte = ts_node_start_byte(node);
        if (this->map.count(byte))
            return this->map.at(byte);
        else 
            return cur_bb;
    } else if (std::find(begin(BRANCH_STATEMENT), end(BRANCH_STATEMENT), type) != end(BRANCH_STATEMENT)) {
        cur_bb = parse_branches(cur_bb, node);
    } else if (std::find(begin(LOOP_STATEMENT), end(LOOP_STATEMENT), type) != end(LOOP_STATEMENT)) {
        cur_bb = parse_loops(cur_bb, node);
    } else if (std::find(begin(JUMP_STATEMENT), end(JUMP_STATEMENT), type) != end(JUMP_STATEMENT)) {
        cur_bb = parse_jump(cur_bb, node);
    } else if (type == "labeled_statement") {
        TSNode label_node = ts_node_child_by_field_name(node, "label", strlen("label"));
        BasicBlock *label_bb = NULL;
        std::vector<TSNode> cur_nodes = cur_bb->get_contained_nodes();
        if (cur_nodes.empty()) {
            label_bb = cur_bb;
        } else {
            label_bb = new BasicBlock;
            this->basic_blocks.push_back(label_bb);
            std::vector<CFGEdges*> out_edges = cur_bb->get_out_edges();
            for (int i = 0; i < out_edges.size(); i ++ ) {
                CFGEdges *oe = out_edges.at(i);
                BasicBlock *des_bb = oe->get_destination();
                CONDITION con = oe->get_condition();
                des_bb->delete_in_edge(oe);
                cur_bb->delete_out_edge(oe);
                CFGEdges *e = new CFGEdges(label_bb, des_bb, con);
                if (label_bb->add_out_edges(e))
                    des_bb->add_in_edges(e);
            }
            CFGEdges *edge = new CFGEdges(cur_bb, label_bb, JMP);
            if (cur_bb->add_out_edges(edge))
                label_bb->add_in_edges(edge);
        }
        
        std::string lable_str = get_content(label_node, this->source);
        this->label_map.emplace(lable_str, label_bb);
        
        TSNode child_node = ts_node_child(node, 2);
        cur_bb = parse_node(label_bb, child_node);
    } else if (type == "expression_statement") {
        cur_bb = parse_node(cur_bb, ts_node_child(node, 0));
    } else {
        TSTreeCursor cursor = ts_tree_cursor_new(node);
        NodeList *sub_all_nodes = new NodeList;
        init_node_list(sub_all_nodes);
        make_move(&cursor, DOWN, sub_all_nodes, "");
        Node *tmp = sub_all_nodes->head;
        while (tmp->next != sub_all_nodes->tail) {
            tmp = tmp->next;
            BasicBlock *tmp_bb = find_basic_block(tmp->data);
            if (tmp_bb != NULL) {
                this->parsed_nodes.push_back(node);
                return cur_bb;
            }
        }
        cur_bb->add_nodes(node);
    }
    this->parsed_nodes.push_back(node);
    return cur_bb;
}

void CFG::cfg_build()
{
    get_ast_nodes();
    BasicBlock *cur_bb = new BasicBlock;
    CFGEdges *edge = new CFGEdges(this->entry, cur_bb, JMP);
    this->entry->add_out_edges(edge);
    cur_bb->add_in_edges(edge);
    this->basic_blocks.push_back(cur_bb);

    for (int i = 0; i < this->all_nodes.size(); i ++ ) {
        // std::cout << get_content(this->all_nodes.at(i), source) << std::endl;
        cur_bb = parse_node(cur_bb, this->all_nodes.at(i));
    }
    // link goto and label
    for (std::unordered_map<BasicBlock*, std::string>::iterator it = goto_map.begin(); it != goto_map.end(); it ++ ) {
        BasicBlock *goto_bb = (*it).first;
        std::string label_str = (*it).second;
        BasicBlock *label_bb = label_map.at(label_str);
        std::vector<CFGEdges*> out_edges = goto_bb->get_out_edges();
        for (int i = 0; i < out_edges.size(); i ++ ) {
            CFGEdges *e = out_edges.at(i);
            BasicBlock *des_bb = e->get_destination();
            if (des_bb == NULL) {
                e->set_destination(label_bb);
                label_bb->add_in_edges(e);
            }
        }
    }

    // 添加exit基本块
    for (int i = 0; i < this->basic_blocks.size(); i ++ ) {
        BasicBlock *bb = this->basic_blocks.at(i);
        std::vector<CFGEdges*> out_edges = bb->get_out_edges();
        if (out_edges.empty()) {
            CFGEdges *edge = new CFGEdges(bb, this->exit, JMP);
            bb->add_out_edges(edge);
            this->exit->add_in_edges(edge);
        }
    }

    for (int i = 0; i < this->basic_blocks.size(); i ++ ) {
        BasicBlock *bb = this->basic_blocks.at(i);
        std::vector<TSNode> nodes = bb->get_contained_nodes();
        if (nodes.empty()) {
            // 删除空基本块
            std::vector<CFGEdges*> out_edges = bb->get_out_edges();
            if (out_edges.size() == 1 && out_edges.at(0)->get_condition() == JMP) {
                BasicBlock *des_bb = out_edges.at(0)->get_destination();
                des_bb->delete_in_edge(out_edges.at(0));
                std::vector<CFGEdges*> in_edges = bb->get_in_edges();
                for (int j = 0; j < in_edges.size(); j ++ ) {
                    BasicBlock *src_bb = in_edges.at(j)->get_source();
                    CONDITION con = in_edges.at(j)->get_condition();
                    src_bb->delete_out_edge(in_edges.at(j));
                    CFGEdges *edge = new CFGEdges(src_bb, des_bb, con);
                    if (src_bb->add_out_edges(edge))
                        des_bb->add_in_edges(edge);
                }
                std::vector<BasicBlock*>::iterator it = this->basic_blocks.begin() + i;
                this->basic_blocks.erase(it);
                i -- ;
            }
        } else {
            // 寻找是否存在return节点，存在则删除出边
            for (int j = 0; j < nodes.size(); j ++ ) {
                if (strcmp(ts_node_type(nodes.at(j)), "return_statement") == 0) {
                    std::vector<CFGEdges*> out_edges = bb->get_out_edges();
                    while (!out_edges.empty()) {
                        BasicBlock *des_bb = out_edges.at(0)->get_destination();
                        bb->delete_out_edge(out_edges.at(0));
                        des_bb->delete_in_edge(out_edges.at(0));
                        out_edges = bb->get_out_edges();
                    }
                    CFGEdges *edge = new CFGEdges(bb, this->exit, JMP);
                    bb->add_out_edges(edge);
                    this->exit->add_in_edges(edge);
                    break;
                }
            }
        }
    }

    this->first_bb = NULL;
    for (auto bb: this->basic_blocks) {
        std::vector<TSNode> nodes = bb->get_contained_nodes();
        for (auto n: nodes) {
            std::string cnt = get_content(n, source);
            if (cnt.find("rand") != std::string::npos) {
                this->first_bb = bb;
                break;
            }
        }
        if (this->first_bb == bb) break;
    }
}

void CFG::print_cfg()
{
    /*
    for (int i = 0; i < this->all_nodes.size(); i ++ ) {
        std::string type = ts_node_type(this->all_nodes.at(i));
        printf("%s\n%s\n\n", type.c_str(), get_content(all_nodes.at(i), this->source));
    }
    */
    for (int i = 0; i < this->basic_blocks.size(); i ++ ) {
        BasicBlock *bb = this->basic_blocks.at(i);
        std::vector<TSNode> nodes = bb->get_contained_nodes();
        std::vector<CFGEdges*> in_edges = bb->get_in_edges();
        std::vector<CFGEdges*> out_edges = bb->get_out_edges();
        std::cout << "[B" << i << "]" << std::endl;
        for (int j = 0; j < nodes.size(); j ++ ) {
            std::cout << j + 1 << ": " << get_content(nodes.at(j), this->source) << std::endl;
        }
        printf("Preds (%zu): ", in_edges.size());
        for (int j = 0; j < in_edges.size(); j ++ ) {
            BasicBlock *src = in_edges.at(j)->get_source();
            std::vector<BasicBlock*>::iterator it = std::find(basic_blocks.begin(), basic_blocks.end(), src);
            std::cout << "B" << (it - basic_blocks.begin()) << " ";
        }
        std::cout << std::endl;
        printf("Succs (%zu): ", out_edges.size());
        for (int j = 0; j < out_edges.size(); j ++ ) {
            BasicBlock *des = out_edges.at(j)->get_destination();
            int con = out_edges.at(j)->get_condition();
            std::vector<BasicBlock*>::iterator it = std::find(basic_blocks.begin(), basic_blocks.end(), des);
            std::cout << con << ' ' << "B" << (it - basic_blocks.begin()) << " ";
        }
        std::cout << std::endl;
        std::cout << std::endl;
    }
    
}

BasicBlock *CFG::get_entry()
{
    return this->entry;
}

BasicBlock *CFG::get_exit()
{
    return this->exit;
}

std::vector<BasicBlock*> CFG::get_bbs()
{
    return this->basic_blocks;
}

BasicBlock::BasicBlock() 
{ 
    is_entry = false;
    is_exit = false;
}

void BasicBlock::set_entry()
{
    this->is_entry = true;
}

void BasicBlock::set_exit()
{
    this->is_exit = true;
}

void BasicBlock::add_nodes(TSNode node)
{
    this->nodes.push_back(node);
}

void BasicBlock::add_in_edges(CFGEdges *in_edge)
{
    this->in_edges.push_back(in_edge);
}

bool BasicBlock::add_out_edges(CFGEdges *out_edge)
{
    if (!this->nodes.empty() && strcmp(ts_node_type(this->nodes.back()), "switch_statement") == 0) {
        // Switch can have multiple JMP edges
        if (out_edge->get_condition() == JMP) {
            this->out_edges.push_back(out_edge);
            return true;
        }
    }
    for (int i = 0; i < this->out_edges.size(); i ++ ) {
        // Only one edge in the same condition
        if (this->out_edges.at(i)->get_condition() == out_edge->get_condition()) {
            return false;
        }
    }
    this->out_edges.push_back(out_edge);
    return true;
}

bool BasicBlock::delete_node(TSNode node)
{
    for(std::vector<TSNode>::iterator it = this->nodes.begin(); it != this->nodes.end(); it ++ ){
        if(ts_node_eq(*it, node)){
            this->nodes.erase(it);
            return true;
        }
    }
    return false;
}

bool BasicBlock::delete_last_node()
{
    if (this->nodes.empty()) {
        return false;
    } else {
        this->nodes.pop_back();
        return true;
    }
}

bool BasicBlock::delete_edge(CFGEdges *edge)
{
    bool is_in = delete_in_edge(edge);
    bool is_out = delete_out_edge(edge);
    return is_in || is_out;
}

bool BasicBlock::delete_in_edge(CFGEdges *edge)
{
    std::vector<CFGEdges*>::iterator it = std::find(this->in_edges.begin(), this->in_edges.end(), edge);
    if (it == this->in_edges.end())
        return false;
    this->in_edges.erase(it);
    return true;
}

bool BasicBlock::delete_out_edge(CFGEdges *edge)
{
    std::vector<CFGEdges*>::iterator it = std::find(this->out_edges.begin(), this->out_edges.end(), edge);
    if (it == this->out_edges.end())
        return false;
    this->out_edges.erase(it);
    return true;
}

std::vector<TSNode> BasicBlock::get_contained_nodes()
{
    return this->nodes;
}

std::vector<CFGEdges*> BasicBlock::get_in_edges()
{
    return this->in_edges;
}

std::vector<CFGEdges*> BasicBlock::get_out_edges()
{
    return this->out_edges;
}

CFGEdges::CFGEdges(BasicBlock *source, BasicBlock *destination, CONDITION condition): 
    source(source), destination(destination), condition(condition) { }

BasicBlock *CFGEdges::get_source()
{
    return this->source;
}

BasicBlock *CFGEdges::get_destination()
{
    return this->destination;
}

CONDITION CFGEdges::get_condition()
{
    return this->condition;
}

void CFGEdges::set_condition(CONDITION con)
{
    this->condition = con;
}

void CFGEdges::set_source(BasicBlock *src)
{
    this->source = src;
}

void CFGEdges::set_destination(BasicBlock *des)
{
    this->destination = des;
}

/*
int main()
{
    char *source = read_source("../t.c");
    // source = read_source("test.c");
    // printf("%s\n", source);
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
    
    CFG cfg(tree, source);
    // cfg.get_ast_nodes();
    cfg.cfg_build();
    cfg.print_cfg();
    
    // NodeList *all_nodes = cfg.get_ast_nodes();

    // Node *tmp = all_nodes->head;
    // for (int i = 0; i < all_nodes->listLen; i++) {
	    // tmp = tmp->next;
        // const char * type = ts_node_type(tmp->data);
        // std::cout << type << std::endl;
    // }
    
    ts_tree_delete(tree);
    ts_parser_delete(parser);
    free(source);
    return 0;
}
*/