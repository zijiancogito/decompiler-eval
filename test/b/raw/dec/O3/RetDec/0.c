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
int64_t func0(int64_t a1, int64_t a2, int64_t a3, int64_t a4);
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
    __libc_start_main(0x1310, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x1150 - 0x130f
int64_t func0(int64_t a1, int64_t a2, int64_t a3, int64_t a4) {
    int64_t v1 = f_rand_4(); // 0x115b
    int64_t v2 = f_rand_3(); // 0x1162
    int64_t v3 = f_rand_2(); // 0x116a
    int64_t v4 = f_rand_1(); // 0x1172
    int64_t v5 = f_rand_0(a1, a2); // 0x117a
    int64_t v6 = v5 & 0xffffffff; // 0x117f
    printf("BB: %d", 0);
    int64_t v7 = (0x100000000 * v3 ^ -0x100000000) >> 32; // 0x1197
    int64_t v8 = 0x36406c81 * v7;
    int64_t v9 = v7 + 719 + 0xfffffed2 * ((v8 >> 38) + (v8 >> 63)) & v1; // 0x11be
    int64_t v10 = v1 & 0xffffffff; // 0x11c7
    if ((int32_t)v4 == 543) {
        // 0x11c9
        printf("BB: %d", 1);
        if ((int32_t)v9 == 925) {
            while (true) {
                // 0x11f0
                printf("BB: %d", 2);
            }
        }
        // 0x1201
        printf("BB: %d", 3);
        if ((int32_t)v5 <= 609) {
            while (true) {
                // 0x1230
                printf("BB: %d", 4);
            }
        }
        // 0x1241
        v10 = v6 ^ 0xffffffff;
    }
    // 0x1246
    printf("BB: %d", 5);
    int32_t v11 = v10; // 0x1259
    if (v11 == 627) {
        // 0x1261
        printf("BB: %d", 11);
        int64_t v12 = v6 & (v3 + 0xfffffd31 ^ v4); // 0x1281
        return (0x100000000 * (int64_t)((int32_t)v12 >> 31) | v12) % (v2 & 0xffffffff & v9) & 0xffffffff;
    }
    if (v11 > 351) {
        while (true) {
            // 0x12e0
            printf("BB: %d", 6);
            printf("BB: %d", 8);
            printf("BB: %d", 10);
        }
    }
    // 0x12a3
    printf("BB: %d", 6);
    while (true) {
        // 0x12c0
        printf("BB: %d", 7);
    }
}

// Address range: 0x1310 - 0x132a
int main(int argc, char ** argv) {
    // 0x1310
    int64_t v1; // 0x1310
    printf("%d", func0(argc, (int64_t)argv, v1, v1) & 0xffffffff);
    return 0;
}

// Address range: 0x1330 - 0x134c
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1331
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x1350 - 0x136f
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x1351
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x1370 - 0x138f
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1371
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x1390 - 0x13af
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x1391
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x13b0 - 0x13cf
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x13b1
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x13d0 - 0x13dd
int64_t _fini(void) {
    // 0x13d0
    int64_t result; // 0x13d0
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17
