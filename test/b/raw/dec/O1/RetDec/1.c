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

int32_t g1; // 0x356
int32_t g2 = 0x1000; // 0x37f
int64_t g3 = 0; // 0x3ff8
int64_t g4 = 0; // 0x4038
int32_t g5;

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
        result = &g5;
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
    __libc_start_main(0x12e0, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
    __asm_hlt();
    // UNREACHABLE
}

// Address range: 0x1090 - 0x10b9
int64_t deregister_tm_clones(void) {
    // 0x1090
    return &g4;
}

// Address range: 0x10c0 - 0x10f9
int64_t register_tm_clones(void) {
    // 0x10c0
    return 0;
}

// Address range: 0x1100 - 0x1139
int64_t __do_global_dtors_aux(void) {
    // 0x1100
    if (*(char *)&g4 != 0) {
        // 0x1138
        int64_t result; // 0x1100
        return result;
    }
    // 0x110d
    if (g3 != 0) {
        // 0x111b
        __cxa_finalize((int64_t *)*(int64_t *)0x4030);
    }
    int64_t result2 = deregister_tm_clones(); // 0x1127
    *(char *)&g4 = 1;
    return result2;
}

// Address range: 0x1140 - 0x1149
int64_t frame_dummy(void) {
    // 0x1140
    return register_tm_clones();
}

// Address range: 0x1150 - 0x12dd
int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_2(); // 0x115b
    int64_t v2 = f_rand_1(); // 0x1163
    int64_t v3 = f_rand_0(a1, a2); // 0x116b
    printf("BB: %d", 0);
    int64_t v4 = 0x100000000 * v3; // 0x1182
    int32_t v5 = (int32_t)(-0x6a5fda97 * (v4 + 0x5b00000000 >> 32) / 0x100000000 + v3) + 91; // 0x1197
    uint32_t v6 = (int32_t)v1; // 0x11ae
    if ((int32_t)v3 + 91 + -219 * ((v5 >> 7) + (int32_t)(v5 < 0)) == v6) {
        // 0x11b3
        printf("BB: %d", 1);
        int64_t v7 = 0x100000000 * ((v4 >> 32) * v4 / 0x100000000 * (0x100000000 * (v3 + (int64_t)(int32_t)&g2) >> 32) - v1) / 0x100000000 * (0x100000000 * v1 >> 32) & 0xffffffff; // 0x11d9
        // 0x12a4
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return (v7 | v1) & 0xffffffff;
    }
    // 0x11de
    printf("BB: %d", 3);
    if (v6 >= 556) {
        printf("BB: %d", 4);
        while (true) {
            // 0x1210
            printf("BB: %d", 4);
        }
    }
    int64_t v8 = v3 & 0xffffffff; // 0x1170
    printf("BB: %d", 5);
    int64_t v9 = v8; // 0x123d
    if ((v2 & 0xffffffff) < v8) {
        printf("BB: %d", 6);
        v9 = 0;
        while ((int32_t)v2 < 0) {
            // 0x1250
            printf("BB: %d", 6);
            v9 = 0;
        }
    }
    // 0x1266
    printf("BB: %d", 7);
    int32_t v10 = v9; // 0x127e
    int32_t v11 = v10 - (int32_t)&g1; // 0x127e
    printf("BB: %d", (int64_t)(v11 < 0 == ((v11 ^ v10) & (v10 ^ (int32_t)&g1)) < 0) ^ 9);
    printf("BB: %d", 10);
    // 0x12a4
    printf("BB: %d", 11);
    printf("BB: %d", 12);
    return (v9 | v1) & 0xffffffff;
}

// Address range: 0x12e0 - 0x12fa
int main(int argc, char ** argv) {
    // 0x12e0
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x1300 - 0x131c
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1301
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x1320 - 0x133f
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x1321
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x1340 - 0x135f
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1341
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x1360 - 0x137f
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x1361
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x1380 - 0x139f
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x1381
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x13a0 - 0x13ad
int64_t _fini(void) {
    // 0x13a0
    int64_t result; // 0x13a0
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

