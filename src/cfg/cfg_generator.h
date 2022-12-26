#ifndef CFG_GENERATOR_H_
#define CFG_GENERATOR_H_

#include <iostream>
#include <vector>
#include <set>
#include <unordered_map>
#include <tree_sitter/api.h>
#include "decompiler_output_parser.h"

class CFG;
class BasicBlock;
class CFGEdges;

enum CONDITION {
  FALSE,
  TRUE,
  JMP
};

class CFG {
private:
    TSTree *tree;
    const char *source;
    BasicBlock *entry;
    BasicBlock *exit;
    std::vector<TSNode> all_nodes;
    std::vector<TSNode> parsed_nodes;
    std::vector<BasicBlock*> basic_blocks;
    std::unordered_map<int, BasicBlock*> jump_to_map;
    std::unordered_map<int, BasicBlock*> jump_out_map;
    std::unordered_map<BasicBlock*, std::string> goto_map;
    std::unordered_map<std::string, BasicBlock*> label_map;
    std::unordered_map<int, BasicBlock*> map;
    // Get all nodes of the AST
    void get_ast_nodes();
    void get_variables();
    bool in_all_nodes(TSNode node);
    bool is_node_parsed(TSNode node);
    TSNode find_node_in_all_nodes(TSNode node);
    BasicBlock *parse_node(BasicBlock *cur_bb, TSNode node);
    // Find the basic block of a given node
    BasicBlock *find_basic_block(TSNode node);
    BasicBlock *parse_loops(BasicBlock *cur_bb, TSNode loop_node);
    BasicBlock *parse_branches(BasicBlock *cur_bb, TSNode branch_node);
    BasicBlock *parse_jump(BasicBlock *cur_bb, TSNode jump_node);
    BasicBlock *parse_condition(BasicBlock *cur_bb, TSNode contidion_node, std::set<BasicBlock*> &record_bbs);
public:
    // construct function
    CFG(TSTree *tree, const char *source);
    void cfg_build();
    BasicBlock *get_entry();
    BasicBlock *get_exit();
    std::vector<BasicBlock*> get_bbs();
    void print_cfg();
};

class BasicBlock {
private:
    bool is_entry;
    bool is_exit;
    std::vector<TSNode> nodes;
    std::vector<CFGEdges*> in_edges;
    std::vector<CFGEdges*> out_edges;
public:
    // construct function
    BasicBlock();
    // Set this basic block as entry block
    void set_entry();
    // Set this basic block as exit block
    void set_exit();
    // Add node to the basic block
    void add_nodes(TSNode node);
    // Add in edge to the basic block
    void add_in_edges(CFGEdges *in_edge);
    // Add out edge to the basic block
    bool add_out_edges(CFGEdges *out_edge);
    //
    bool delete_node(TSNode node);
    //
    bool delete_last_node();
    bool delete_edge(CFGEdges *edge);
    bool delete_in_edge(CFGEdges *edge);
    bool delete_out_edge(CFGEdges *edge);
    // Get all nodes in the base block
    std::vector<TSNode> get_contained_nodes();
    // Get all in edges in the base block
    std::vector<CFGEdges*> get_in_edges();
    // Get all out edges in the base block
    std::vector<CFGEdges*> get_out_edges();
};

class CFGEdges {
private:
    BasicBlock *source;  // source basic block of the edge
    BasicBlock *destination;  // destination basic block of the edge
    CONDITION condition;  // condition for the edge 
public:
    // construct function
    CFGEdges(BasicBlock *source, BasicBlock *destination, CONDITION condition);
    // Get the condition of the edge
    CONDITION get_condition();
    // Get the source basic block of the edge
    BasicBlock *get_source();
    // Get the destination basic block of the edge
    BasicBlock *get_destination();
    void set_condition(CONDITION con);
    void set_source(BasicBlock *src);
    void set_destination(BasicBlock *des);
};

#endif  // CFG_GENERATOR_H_