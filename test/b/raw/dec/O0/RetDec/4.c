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
    __libc_start_main(0x1500, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x1150 - 0x14fa
int64_t func0(int64_t a1, int64_t a2) {
    // 0x1150
    f_rand_4();
    int32_t v1 = f_rand_0(a1, a2); // 0x1165
    int64_t v2 = f_rand_1(); // 0x1168
    int32_t v3 = v2; // 0x116d
    int64_t v4 = f_rand_3(); // 0x1170
    int32_t v5 = f_rand_2(); // 0x118b
    printf("BB: %d", 0);
    int32_t v6 = v1; // 0x11a4
    if (v1 <= v5) {
        int64_t v7 = 0x100000000 * (int64_t)(v3 >> 31) | v2 & 0xffffffff;
        int32_t v8 = v1; // 0x12c5
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        while (v3 >= 562) {
            uint32_t v9 = v8;
            printf("BB: %d", 5);
            v8 = v9 + (int32_t)(v7 % (int64_t)v9) & 300;
            v6 = v8;
            if (v8 > v5) {
                goto lab_0x12dd;
            }
            printf("BB: %d", 1);
            printf("BB: %d", 3);
        }
        while (true) {
            // 0x124e
            printf("BB: %d", 4);
        }
    }
  lab_0x12dd:;
    int32_t v10 = v4; // 0x1175
    printf("BB: %d", 6);
    if (v10 > 961) {
        // 0x1433
        printf("BB: %d", 12);
        // 0x149a
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return v6 - 1;
    }
    // 0x12fd
    printf("BB: %d", 7);
    if (v10 >= 545) {
        while (true) {
            // 0x131d
            printf("BB: %d", 8);
        }
    }
    // 0x137c
    printf("BB: %d", 9);
    if (v5 < v3) {
        // 0x13f5
        printf("BB: %d", 11);
        // 0x149a
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -1 - (-1 * v5 + v10);
    }
    while (true) {
        // 0x139b
        printf("BB: %d", 10);
    }
}

// Address range: 0x1500 - 0x1530
int main(int argc, char ** argv) {
    // 0x1500
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x1530 - 0x1559
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x1538
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x1560 - 0x158c
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x1568
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x1590 - 0x15bc
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x1598
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x15c0 - 0x15ec
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x15c8
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x15f0 - 0x161c
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x15f8
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x161c - 0x1629
int64_t _fini(void) {
    // 0x161c
    int64_t result; // 0x161c
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17

