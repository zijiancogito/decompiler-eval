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

int32_t g1 = 0x4e470000; // 0x362
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
    __libc_start_main(0x14d0, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x1150 - 0x14c4
int64_t func0(int64_t a1, int64_t a2) {
    int32_t v1 = f_rand_4();
    int64_t v2 = f_rand_0(a1, a2); // 0x1167
    int64_t v3 = f_rand_2(); // 0x1176
    int64_t v4 = f_rand_1(); // 0x117e
    int64_t v5 = f_rand_3(); // 0x1186
    printf("BB: %d", 0);
    int32_t v6 = (0x100000000 * (int64_t)((int32_t)(-257 * (int64_t)(int32_t)&g1) >> 31) | (int64_t)(int32_t)(-257 * (int64_t)(int32_t)&g1)) % (v4 & 0xffffffff); // 0x11b0
    if (v6 > 493) {
      lab_0x131d:
        // 0x131d
        printf("BB: %d", 6);
        if (v1 > 648) {
            // 0x1474
            printf("BB: %d", 12);
            printf("BB: %d", 13);
            return v3 & 0xffffffff ^ 256;
        }
        // 0x133d
        printf("BB: %d", 7);
        while (true) {
            // 0x136f
            printf("BB: %d", 8);
        }
    }
    int64_t v7 = 0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5 & 0xffffffff;
    int64_t v8 = v3 & 0xffffffff;
    int32_t v9 = v6;
    int32_t v10 = v2; // 0x1150
    int32_t v11 = 493; // 0x1150
    printf("BB: %d", 1);
    while (v1 <= 256) {
        int32_t v12 = v10;
        printf("BB: %d", 3);
        int32_t v13 = v9; // 0x1284
        if (v11 != 451) {
            int64_t v14 = (int64_t)(256 / v1) + (int64_t)(int32_t)&g1; // 0x1277
            printf("BB: %d", 4);
            while (v12 != -452) {
                // 0x128a
                printf("BB: %d", 4);
            }
            int64_t v15 = v7 % (v14 & 0xffffffff); // 0x12a1
            v13 = (0x100000000 * (int64_t)((int32_t)v15 >> 31) | v15 & 0xffffffff) / v8;
        }
        // 0x12f8
        v9 = v13;
        printf("BB: %d", 5);
        v10 = (int32_t)((0x100000000 * (int64_t)(v12 >> 31) | (int64_t)v12) % 451) + 256;
        v11 = 451;
        if (v9 > 451) {
            goto lab_0x131d;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x11e1
        printf("BB: %d", 2);
    }
}

// Address range: 0x14d0 - 0x1500
int main(int argc, char ** argv) {
    // 0x14d0
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x1500 - 0x1529
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1508
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x1530 - 0x155c
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x1538
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x1560 - 0x158c
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1568
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x1590 - 0x15bc
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x1598
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x15c0 - 0x15ec
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x15c8
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x15ec - 0x15f9
int64_t _fini(void) {
    // 0x15ec
    int64_t result; // 0x15ec
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

