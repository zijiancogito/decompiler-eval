//
// This file was generated by the Retargetable Decompiler
// Website: https://retdec.com
//

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// ------------------- Function Prototypes --------------------

int64_t __do_global_dtors_aux(void);
int64_t _fini(void);
int64_t _init(void);
int64_t _start(int64_t a1, int64_t a2, int64_t a3, int64_t a4, int64_t a5, int64_t a6);
int64_t deregister_tm_clones(void);
int64_t f_rand_0(int64_t a1, int64_t a2);
int64_t f_rand_1(void);
int64_t f_rand_2(void);
int64_t f_rand_3(void);
int64_t f_rand_4(void);
int64_t frame_dummy(void);
int64_t func0(int64_t a1, int64_t a2);
int32_t function_1030(char * format, ...);
int32_t function_1040(void);
void function_1050(int64_t * d);
int64_t register_tm_clones(void);

// --------------------- Global Variables ---------------------

int32_t g1 = 0; // 0x3e7
int64_t g2 = 0; // 0x3ff8
int64_t g3 = 0; // 0x4038
int32_t g4;

// ------- Dynamically Linked Functions Without Header --------

void __cxa_finalize(int64_t * a1);
void __gmon_start__(void);
int32_t __libc_start_main(int64_t a1, int32_t a2, char ** a3, void (*a4)(), void (*a5)(), void (*a6)());

// ------------------------ Functions -------------------------

// Address range: 0x1000 - 0x101b
int64_t _init(void) {
    int64_t result = 0; // 0x1012
    if (*(int64_t *)0x3fe8 != 0) {
        // 0x1014
        __gmon_start__();
        result = &g4;
    }
    // 0x1016
    return result;
}

// Address range: 0x1030 - 0x1036
int32_t function_1030(char * format, ...) {
    // 0x1030
    return printf(format);
}

// Address range: 0x1040 - 0x1046
int32_t function_1040(void) {
    // 0x1040
    return rand();
}

// Address range: 0x1050 - 0x1056
void function_1050(int64_t * d) {
    // 0x1050
    __cxa_finalize(d);
}

// Address range: 0x1060 - 0x1086
int64_t _start(int64_t a1, int64_t a2, int64_t a3, int64_t a4, int64_t a5, int64_t a6) {
    // 0x1060
    int64_t v1; // 0x1060
    __libc_start_main(0x1470, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
    __asm_hlt();
    // UNREACHABLE
}

// Address range: 0x1090 - 0x10b9
int64_t deregister_tm_clones(void) {
    // 0x1090
    return &g3;
}

// Address range: 0x10c0 - 0x10f9
int64_t register_tm_clones(void) {
    // 0x10c0
    return 0;
}

// Address range: 0x1100 - 0x1139
int64_t __do_global_dtors_aux(void) {
    // 0x1100
    if (*(char *)&g3 != 0) {
        // 0x1138
        int64_t result; // 0x1100
        return result;
    }
    // 0x110d
    if (g2 != 0) {
        // 0x111b
        __cxa_finalize((int64_t *)*(int64_t *)0x4030);
    }
    int64_t result2 = deregister_tm_clones(); // 0x1127
    *(char *)&g3 = 1;
    return result2;
}

// Address range: 0x1140 - 0x1149
int64_t frame_dummy(void) {
    // 0x1140
    return register_tm_clones();
}

// Address range: 0x1150 - 0x146d
int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x1158
    int32_t v2 = v1; // 0x115d
    int64_t v3 = f_rand_1(); // 0x1167
    int64_t v4 = f_rand_2(); // 0x116f
    int32_t v5 = v4; // 0x1174
    printf("BB: %d", 0);
    int32_t v6 = 40; // 0x11a2
    int32_t v7 = v3; // 0x11a2
    int32_t v8 = v5; // 0x11a2
    if (v2 == (int32_t)&g1) {
        // 0x11a8
        printf("BB: %d", 1);
        if (v5 <= 311) {
            while (true) {
                // 0x11c8
                printf("BB: %d", 2);
            }
        }
        int32_t v9 = (0x100000000 * (40 * (v4 ^ v1) + v4) >> 32) * (0x100000000 * v3 >> 32); // 0x1194
        printf("BB: %d", 3);
        v7 = (-1 - v9 | v5) + 40;
        printf("BB: %d", 4);
        int32_t v10 = v7 & v2; // 0x126a
        int64_t v11 = v7; // 0x126e
        int32_t v12 = ((int32_t)((0x100000000 * (int64_t)(v10 >> 31) | (int64_t)v10) % v11) ^ 40) - v9; // 0x1276
        int32_t v13 = -1 - v12;
        v6 = (-1 - (int32_t)((0x100000000 * (int64_t)(v7 >> 31) | v11) / (v4 & 0xffffffff) & (0x100000000 * (int64_t)(v13 >> 31) | (int64_t)v13) % v11)) * v9 ^ 40;
        printf("BB: %d", 6);
        v8 = v12 * v9 * v6;
    }
    // 0x1335
    printf("BB: %d", 7);
    if (v8 == 42) {
        // 0x1411
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return 0xffffffd5;
    }
    // 0x1352
    printf("BB: %d", 8);
    if (v7 != v6) {
        while (true) {
            // 0x13c4
            printf("BB: %d", 10);
            printf("BB: %d", 8);
        }
    }
    while (true) {
        // 0x1371
        printf("BB: %d", 9);
    }
}

// Address range: 0x1470 - 0x14a0
int main(int argc, char ** argv) {
    // 0x1470
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x14a0 - 0x14c9
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x14a8
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x14d0 - 0x14fc
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x14d8
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x1500 - 0x152c
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1508
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x1530 - 0x155c
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x1538
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x1560 - 0x158c
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x1568
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x158c - 0x1599
int64_t _fini(void) {
    // 0x158c
    int64_t result; // 0x158c
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

