//
// This file was generated by the Retargetable Decompiler
// Website: https://retdec.com
//

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
    __libc_start_main(0x1380, (int32_t)a6, (char **)&v1, NULL, NULL, (void (*)())a3);
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

// Address range: 0x1150 - 0x1379
int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2) & 0xffffffff; // 0x1163
    int64_t v2 = f_rand_1(); // 0x1166
    uint64_t v3 = v2 & 0xffffffff; // 0x116b
    int64_t v4 = f_rand_2(); // 0x116d
    printf("BB: %d", 0);
    int64_t v5; // 0x1150
    int64_t v6; // 0x1150
    int32_t v7; // 0x1150
    if ((int32_t)v4 != 547) {
        // 0x1290
        v7 = 78;
        v5 = v4 & 0xffffffff;
        v6 = v1;
    } else {
        int64_t v8 = v3 ^ 0xffffffff; // 0x1195
        int32_t v9 = v2; // 0x1198
        uint32_t v10 = -v9; // 0x119a
        int64_t v11 = v2 + 0xffffffff & 0xffffffff;
        int64_t v12 = v10;
        int32_t v13 = 78;
        int64_t v14 = -1 - v13;
        int64_t v15 = 78;
        printf("BB: %d", 1);
        int64_t v16 = 547; // 0x1214
        int64_t v17 = v15; // 0x1214
        int64_t v18 = v1; // 0x1214
        int32_t v19; // 0x1234
        int32_t v20; // 0x123d
        if (v15 >= v3) {
            printf("BB: %d", 2);
            while (v3 <= v8) {
                // 0x1220
                printf("BB: %d", 2);
            }
            // 0x1234
            v19 = v15;
            v20 = (v13 ^ v19) + v19;
            v16 = v14;
            v17 = v8;
            v18 = v13 & (int32_t)((0x100000000 * (int64_t)(v20 >> 31) | (int64_t)v20) / v15 | v2) ^ (int32_t)v8;
        }
        int64_t v21 = v16;
        printf("BB: %d", 3);
        int64_t v22; // 0x1150
        int64_t v23; // 0x126b
        while (v9 <= 286) {
            // 0x127e
            v23 = (0x100000000 * (int64_t)(v9 >> 31) | v3) / (v17 & 0xffffffff);
            v22 = (0x100000000 * (int64_t)((int32_t)v23 >> 31) | v23 & 0xffffffff) / v21 & 0xffffffff;
            v7 = v13;
            v5 = v21;
            v6 = v18;
            if (v21 != 547) {
                // break (via goto) -> 0x1298
                goto lab_0x1298;
            }
            v15 = v22;
            printf("BB: %d", 1);
            v16 = 547;
            v17 = v15;
            if (v15 >= v3) {
                printf("BB: %d", 2);
                while (v3 <= v8) {
                    // 0x1220
                    printf("BB: %d", 2);
                }
                // 0x1234
                v19 = v15;
                v20 = (v13 ^ v19) + v19;
                v16 = v14;
                v17 = v8;
                v18 = v13 & (int32_t)((0x100000000 * (int64_t)(v20 >> 31) | (int64_t)v20) / v15 | v2) ^ (int32_t)v8;
            }
            // 0x1259
            v21 = v16;
            printf("BB: %d", 3);
        }
        // 0x11c0
        printf("BB: %d", 4);
        int64_t v24 = v21 ^ v3;
        int32_t v25 = (0x100000000 * (int64_t)((int32_t)v24 >> 31) | v24) / v11;
        int32_t v26 = (int32_t)v21 * v10; // 0x11e5
        v7 = v25;
        v5 = v21;
        v6 = v12;
        while (v21 == 547) {
            // 0x11fc
            v13 = v25;
            v14 = -1 - v13;
            v15 = (0x100000000 * (int64_t)(v26 >> 31) | (int64_t)v26) % v3 & 0xffffffff;
            printf("BB: %d", 1);
            v16 = 547;
            v17 = v15;
            v18 = v12;
            if (v15 >= v3) {
                printf("BB: %d", 2);
                while (v3 <= v8) {
                    // 0x1220
                    printf("BB: %d", 2);
                }
                // 0x1234
                v19 = v15;
                v20 = (v13 ^ v19) + v19;
                v16 = v14;
                v17 = v8;
                v18 = v13 & (int32_t)((0x100000000 * (int64_t)(v20 >> 31) | (int64_t)v20) / v15 | v2) ^ (int32_t)v8;
            }
            // 0x1259
            v21 = v16;
            printf("BB: %d", 3);
            while (v9 <= 286) {
                // 0x127e
                v23 = (0x100000000 * (int64_t)(v9 >> 31) | v3) / (v17 & 0xffffffff);
                v22 = (0x100000000 * (int64_t)((int32_t)v23 >> 31) | v23 & 0xffffffff) / v21 & 0xffffffff;
                v7 = v13;
                v5 = v21;
                v6 = v18;
                if (v21 != 547) {
                    // break (via goto) -> 0x1298
                    goto lab_0x1298;
                }
                v15 = v22;
                printf("BB: %d", 1);
                v16 = 547;
                v17 = v15;
                if (v15 >= v3) {
                    printf("BB: %d", 2);
                    while (v3 <= v8) {
                        // 0x1220
                        printf("BB: %d", 2);
                    }
                    // 0x1234
                    v19 = v15;
                    v20 = (v13 ^ v19) + v19;
                    v16 = v14;
                    v17 = v8;
                    v18 = v13 & (int32_t)((0x100000000 * (int64_t)(v20 >> 31) | (int64_t)v20) / v15 | v2) ^ (int32_t)v8;
                }
                // 0x1259
                v21 = v16;
                printf("BB: %d", 3);
            }
            // 0x11c0
            printf("BB: %d", 4);
            v24 = v21 ^ v3;
            v25 = (0x100000000 * (int64_t)((int32_t)v24 >> 31) | v24) / v11;
            v26 = (int32_t)v21 * v10;
            v7 = v25;
            v5 = v21;
            v6 = v12;
        }
    }
  lab_0x1298:
    // 0x1298
    printf("BB: %d", 5);
    int64_t v27 = v6 & 0xffffffff;
    int32_t v28 = v5; // 0x12b0
    int32_t v29 = v6;
    int32_t v30 = -1 - v29;
    if (v28 == v30) {
        // 0x1350
        printf("BB: %d", 12);
        return (0x100000000 * (int64_t)(v29 >> 31) | v27) / (int64_t)v7 & 0xffffffff;
    }
    // 0x12bf
    printf("BB: %d", 6);
    int64_t v31 = v7; // 0x12d2
    int64_t v32 = v27; // 0x12f3
    int32_t v33 = v29; // 0x12f3
    if (v3 <= v6) {
        // 0x12f5
        printf("BB: %d", 7);
        int64_t v34 = v5 + 1 + v31 + v6; // 0x130f
        v32 = v34 & 0xffffffff;
        v33 = v34;
    }
    int32_t v35 = v7 ^ (int32_t)v2; // 0x12da
    int32_t v36 = -1 * v7 * (int32_t)((0x100000000 * (int64_t)(v35 >> 31) | (int64_t)v35) % v27) | v30; // 0x12e6
    int64_t v37 = (0x100000000 * (int64_t)(v36 >> 31) | (int64_t)v36) % v27; // 0x12eb
    printf("BB: %d", 8);
    int32_t v38 = v37; // 0x132a
    int32_t v39 = v38 - v28; // 0x132a
    int64_t v40 = v39 < 0 == ((v39 ^ v38) & (int32_t)(v37 ^ v5)) < 0 == (v39 != 0) ? 9 : 10; // 0x1335
    printf("BB: %d", v40);
    printf("BB: %d", 11);
    // 0x1350
    printf("BB: %d", 12);
    return (0x100000000 * (int64_t)(v33 >> 31) | v32) / v31 & 0xffffffff;
}

// Address range: 0x1380 - 0x139a
int main(int argc, char ** argv) {
    // 0x1380
    printf("%d", func0(argc, (int64_t)argv) & 0xffffffff);
    return 0;
}

// Address range: 0x13a0 - 0x13bc
int64_t f_rand_0(int64_t a1, int64_t a2) {
    uint32_t result = rand(); // 0x13a1
    printf("f_rand_0: %d", 0);
    return result;
}

// Address range: 0x13c0 - 0x13df
int64_t f_rand_1(void) {
    uint32_t result = rand(); // 0x13c1
    printf("f_rand_1: %d", 1);
    return result;
}

// Address range: 0x13e0 - 0x13ff
int64_t f_rand_2(void) {
    uint32_t result = rand(); // 0x13e1
    printf("f_rand_2: %d", 2);
    return result;
}

// Address range: 0x1400 - 0x141f
int64_t f_rand_3(void) {
    uint32_t result = rand(); // 0x1401
    printf("f_rand_3: %d", 3);
    return result;
}

// Address range: 0x1420 - 0x143f
int64_t f_rand_4(void) {
    uint32_t result = rand(); // 0x1421
    printf("f_rand_4: %d", 4);
    return result;
}

// Address range: 0x1440 - 0x144d
int64_t _fini(void) {
    // 0x1440
    int64_t result; // 0x1440
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (11.4.0)
// Detected functions: 17
