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
int64_t func0(int64_t a1, int64_t a2, int64_t a3);
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
    __libc_start_main(0x1370, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x1150 - 0x136b
int64_t func0(int64_t a1, int64_t a2, int64_t a3) {
    int64_t v1 = f_rand_0(a1, a2); // 0x115e
    int64_t v2 = f_rand_1(); // 0x1165
    int64_t v3 = f_rand_2(); // 0x116d
    int64_t v4 = v3 & 0xffffffff; // 0x1172
    printf("BB: %d", 0);
    int64_t v5; // 0x1150
    int64_t v6; // 0x1150
    int32_t v7; // 0x1150
    if ((int32_t)v1 != (int32_t)&g1) {
        // 0x1278
        v7 = 40;
        v5 = v2 & 0xffffffff;
        v6 = v4;
    } else {
        // 0x11a1
        printf("BB: %d", 1);
        uint32_t v8 = (int32_t)v3; // 0x11b4
        int64_t v9 = (0x100000000 * (40 * (v3 ^ v1) + v3) >> 32) * (0x100000000 * v2 >> 32) & 0xffffffff; // 0x11bf
        if (v8 <= 311) {
            int64_t v10 = 1;
            printf("BB: %d", 2);
            v9 = 0xfffffc18;
            while (v10 != 0) {
                // 0x11d0
                v10 = v8 < 312 != (311 - v8 & v8) < 0;
                printf("BB: %d", 2);
                v9 = 0xfffffc18;
            }
        }
        // 0x11ec
        printf("BB: %d", 3);
        int64_t v11 = (v9 ^ 0xffffffff | v4) + 40; // 0x120d
        int64_t v12 = v11 & 0xffffffff; // 0x120d
        printf("BB: %d", 4);
        int64_t v13 = ((v11 & (int64_t)(int32_t)&g1) % v12 ^ 40) - v9; // 0x1232
        int64_t v14 = v13 & 0xffffffff ^ 0xffffffff; // 0x1237
        int64_t v15 = 0x100000000 * v9;
        int64_t v16 = ((0x100000000 * ((0x100000000 * (int64_t)((int32_t)v11 >> 31) | v12) / v4 & (0x100000000 * (int64_t)((int32_t)v14 >> 31) | v14) % v12) ^ -0x100000000) >> 32) * (v15 >> 32) & 0xffffffff ^ 40; // 0x1250
        printf("BB: %d", 6);
        v7 = v16;
        v5 = v12;
        v6 = (0x100000000 * v16 >> 32) * (0x100000000 * v13 >> 32) * v15 / 0x100000000 & 0xffffffff;
    }
    // 0x1285
    printf("BB: %d", 7);
    if (v6 == 42) {
        // 0x129e
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return 0xffffffd5;
    }
    printf("BB: %d", 8);
    // 0x12d7
    while (v7 != (int32_t)v5) {
        // 0x1300
        printf("BB: %d", 10);
        if (v6 == 42) {
            // 0x129e
            printf("BB: %d", 11);
            printf("BB: %d", 12);
            return 0xffffffd5;
        }
        printf("BB: %d", 8);
    }
    while (true) {
        // 0x1340
        printf("BB: %d", 9);
    }
}

// Address range: 0x1370 - 0x138d
int main(int argc, char ** argv) {
    // 0x1370
    int64_t v1; // 0x1370
    func0(argc, (int64_t)argv, v1);
    printf("%d", 0xffffffd5);
    return 0;
}

// Address range: 0x1390 - 0x13ac
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1391
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x13b0 - 0x13cf
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x13b1
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x13d0 - 0x13ef
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x13d1
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x13f0 - 0x140f
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x13f1
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x1410 - 0x142f
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x1411
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x1430 - 0x143d
int64_t _fini(void) {
    // 0x1430
    int64_t result; // 0x1430
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17
