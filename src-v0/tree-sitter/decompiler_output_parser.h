#ifndef DECOMPILER_OUTPUT_PARSER_H_
#define DECOMPILER_OUTPUT_PARSER_H_

#include <tree_sitter/api.h>

#ifdef __cplusplus
extern "C"{
#endif

enum MOVE {
  UP,
  DOWN,
  LEFT,
  RIGHT
};

// TSNode
typedef struct Node {
  TSNode data;
  struct Node * next;
}Node;

// TSNodeList
typedef struct NodeList {
  struct Node * head;
  struct Node * tail;
  int listLen;
}NodeList;

const char *unnecessary[] = {
    "(int)",
    "(int *)",
    "(uint)",
    "(uint *)",
    "(long)",
    "(long *)",
    "(ulong)",
    "(ulong *)",
    "(char)",
    "(char *)",
    "(double)",
    "(double *)",
    "(float)",
    "(float *)",
    "(__int8)",
    "(__int16)",
    "(__int32)",
    "(__int64)",
    "(__int128)",
    "(undefined4)",
    "(undefined8)",
    "(signed int)",
    "(signed int *)",
    "(signed long)",
    "(signed long *)",
    "(signed __int8)",
    "(signed __int16)",
    "(signed __int32)",
    "(signed __int64)",
    "(signed __int128)",
    "(unsigned int)",
    "(unsigned int *)",
    "(unsigned long)",
    "(unsigned long *)",
    "(unsigned __int8)",
    "(unsigned __int16)",
    "(unsigned __int32)",
    "(unsigned __int64)",
    "(unsigned __int128)",
    "(_QWORD)",
    "(_QWORD *)",
    "(_DWORD)",
    "(_DWORD *)",
    "(_WORD)",
    "(_WORD *)",
    "(_BYTE)",
    "(_BYTE *)",
    "(__m128)",
    "(word32)",
    "(word64)",
    "DWORD1",
    "DWORD2",
    "LOBYTE",
    "HIBYTE",
    "LOWORD",
    "HIWORD",
    "HIGHW",
    "LOWW",
    "LODWORD",
    "HIDWORD",
    "LOQWORD",
    "HIQWORD",
    "  [8]",
    "  [16]",
    "  [32]",
    "  [64]",
    "  [128]",
    "(undefined)",
    // "& 0xffffffff",
    "__stdcall",
    "__fastcall",
    "__cdecl",
    "__thiscall",
    "__noreturn",
    "__spoils<rdx,rcx,r8,r9,r10,r11,xmm4,xmm5>",
};

const char *needchange[] = {
    "printf_2",
    "__isoc99_scanf_2",
    "rand_2",
};

void init_node_list(NodeList * node_list);

void append_node(NodeList *all_nodes, TSNode data);

void free_node_list(NodeList *list);

// node_filter can filter specific type of nodes.
void make_move(TSTreeCursor *cursor, enum MOVE move, NodeList *all_nodes, const char *node_filter);
void make_move_iter(TSTreeCursor *cursor, NodeList *all_nodes, const char *node_filter);

// void parse_decompiler_output(TSTree *tree, const char *source, const char *node_filter, NodeList *all_nodes);
void parse_decompiler_output(TSTree *tree, NodeList *all_nodes, const char *node_filter);

char *read_source(const char *filename);

void siplify_source(char *source);

char *get_content_in_source(int start, int end, const char *source);

char *get_content(TSNode node, const char *source);

#ifdef __cplusplus
}
#endif

#endif  // DECOMPILER_OUTPUT_PARSER_H_