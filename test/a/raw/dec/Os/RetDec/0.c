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

int64_t g1 = 0; // 0x3ff8
int64_t g2 = 0; // 0x4038
int32_t g3;

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
        result = &g3;
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
    __libc_start_main(0x1281, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
    __asm_hlt();
    // UNREACHABLE
}

// Address range: 0x1090 - 0x10b9
int64_t deregister_tm_clones(void) {
    // 0x1090
    return &g2;
}

// Address range: 0x10c0 - 0x10f9
int64_t register_tm_clones(void) {
    // 0x10c0
    return 0;
}

// Address range: 0x1100 - 0x1139
int64_t __do_global_dtors_aux(void) {
    // 0x1100
    if (*(char *)&g2 != 0) {
        // 0x1138
        int64_t result; // 0x1100
        return result;
    }
    // 0x110d
    if (g1 != 0) {
        // 0x111b
        __cxa_finalize((int64_t *)*(int64_t *)0x4030);
    }
    int64_t result2 = deregister_tm_clones(); // 0x1127
    *(char *)&g2 = 1;
    return result2;
}

// Address range: 0x1140 - 0x1149
int64_t frame_dummy(void) {
    // 0x1140
    return register_tm_clones();
}

// Address range: 0x114c - 0x1281
int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_3(); // 0x1157
    int64_t v2 = f_rand_2(); // 0x115f
    int64_t v3 = f_rand_1(); // 0x1168
    int64_t v4 = v3 & 0xffffffff; // 0x116d
    int64_t v5 = f_rand_4(); // 0x1170
    int64_t v6 = f_rand_0(a1, a2); // 0x1178
    printf("BB: %d", 0);
    int64_t v7 = (v6 | 777) & v5; // 0x119f
    int64_t v8 = (v7 + 0xfffffc2a ^ v1) & 0xffffffff;
    int64_t v9 = v6 & 0xffffffff;
    printf("BB: %d", 1);
    uint32_t v10 = (int32_t)v6; // 0x11c3
    int64_t v11; // 0x114c
    int64_t v12; // 0x114c
    int64_t v13; // 0x114c
    int64_t v14; // 0x11d7
    if ((int32_t)v3 != v10) {
        // 0x11e3
        printf("BB: %d", 2);
        v13 = v9 & v1;
        v11 = (0x100000000 * (int64_t)((int32_t)v13 >> 31) | v13) / (v8 & 0xffffffff) & 0xffffffff;
        v12 = v8;
    } else {
        // 0x11c8
        printf("BB: %d", 3);
        v14 = v8 & 0xffffffff ^ 0xffffffff;
        v11 = v7 & 0xffffffff;
        v12 = (0x100000000 * (int64_t)((int32_t)v14 >> 31) | v14) / v4 & 0xffffffff;
    }
    // 0x11fb
    printf("BB: %d", 4);
    while ((int32_t)v2 <= 817) {
        int64_t v15 = v12;
        printf("BB: %d", 6);
        int64_t v16 = v9; // 0x1229
        if (v10 <= 222) {
            int64_t v17 = v15 & (v5 ^ 0xffffffff); // 0x122e
            printf("BB: %d", 7);
            while ((int32_t)v17 < 223) {
                // 0x1231
                printf("BB: %d", 7);
            }
            // 0x1248
            v16 = v17 & 0xffffffff;
        }
        // 0x1248
        printf("BB: %d", 8);
        int64_t v18 = v15 + (v1 & 0xffffffff); // 0x1257
        int64_t v19 = (0x100000000 * (int64_t)((int32_t)v18 >> 31) | v18 & 0xffffffff) / (v11 & 0xffffffff); // 0x125c
        int64_t v20 = (0x100000000 * (int64_t)((int32_t)v19 >> 31) | v19 & 0xffffffff) / v16; // 0x1264
        int64_t v21 = v11; // 0x1264
        v8 = v15;
        v9 = v20 & 0xffffffff;
        printf("BB: %d", 1);
        v10 = (int32_t)v20;
        if ((int32_t)v3 != v10) {
            // 0x11e3
            printf("BB: %d", 2);
            v13 = v9 & v1;
            v11 = (0x100000000 * (int64_t)((int32_t)v13 >> 31) | v13) / (v8 & 0xffffffff) & 0xffffffff;
            v12 = v8;
        } else {
            // 0x11c8
            printf("BB: %d", 3);
            v14 = v8 & 0xffffffff ^ 0xffffffff;
            v11 = v21;
            v12 = (0x100000000 * (int64_t)((int32_t)v14 >> 31) | v14) / v4 & 0xffffffff;
        }
        // 0x11fb
        printf("BB: %d", 4);
    }
    while (true) {
        // 0x1270
        printf("BB: %d", 5);
    }
}

// Address range: 0x1281 - 0x1287
int main(int argc, char ** argv) {
    // 0x1281
    return func0(argc, (int64_t)argv);
}

// Address range: 0x1287 - 0x12a3
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1288
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x12a3 - 0x12c2
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x12a4
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x12c2 - 0x12e1
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x12c3
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x12e1 - 0x1300
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x12e2
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x1300 - 0x131f
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x1301
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x1320 - 0x132d
int64_t _fini(void) {
    // 0x1320
    int64_t result; // 0x1320
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

