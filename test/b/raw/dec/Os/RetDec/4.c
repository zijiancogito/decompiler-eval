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
    __libc_start_main(0x12ea, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x114c - 0x12ea
int64_t func0(int64_t a1, int64_t a2) {
    // 0x114c
    f_rand_4();
    int64_t v1 = f_rand_0(a1, a2) & 0xffffffff; // 0x1161
    int64_t v2 = f_rand_1(); // 0x1163
    uint64_t v3 = v2 & 0xffffffff; // 0x1168
    int64_t v4 = f_rand_3(); // 0x116b
    uint64_t v5 = f_rand_2() & 0xffffffff; // 0x1178
    printf("BB: %d", 0);
    int64_t v6 = v1; // 0x118e
    if (v1 <= v5) {
        int64_t v7 = v1; // 0x11df
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        while ((int32_t)v2 >= 562) {
            uint64_t v8 = v7;
            printf("BB: %d", 5);
            v7 = (2 * v2 % 0x100000001 | v3) % v8 + v8 & 300;
            v6 = v7;
            if (v7 > v5) {
                goto lab_0x11ec;
            }
            printf("BB: %d", 1);
            printf("BB: %d", 3);
        }
        while (true) {
            // 0x128e
            printf("BB: %d", 4);
        }
    }
  lab_0x11ec:
    // 0x11ec
    printf("BB: %d", 6);
    int32_t v9 = v4; // 0x120d
    if (v9 > 961) {
        // 0x123c
        printf("BB: %d", 12);
        // 0x124d
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -v6 & 0xffffffff ^ 0xffffffff;
    }
    // 0x120f
    printf("BB: %d", 7);
    if (v9 >= 545) {
        while (true) {
            // 0x122b
            printf("BB: %d", 8);
        }
    }
    // 0x129f
    printf("BB: %d", 9);
    if (v5 < v3) {
        // 0x12b7
        printf("BB: %d", 11);
        // 0x124d
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return (v4 & 0xffffffff) - v5 & 0xffffffff ^ 0xffffffff;
    }
    while (true) {
        // 0x12d9
        printf("BB: %d", 10);
    }
}

// Address range: 0x12ea - 0x1304
int main(int argc, char ** argv) {
    // 0x12ea
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x1304 - 0x1320
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1305
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x1320 - 0x133f
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x1321
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x133f - 0x135e
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1340
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x135e - 0x137d
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x135f
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x137d - 0x139c
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x137e
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x139c - 0x13a9
int64_t _fini(void) {
    // 0x139c
    int64_t result; // 0x139c
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

