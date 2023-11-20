int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_4(); // 0x115e
    int64_t v2 = f_rand_0(a1, a2) & 0xffffffff; // 0x116a
    int64_t v3 = f_rand_1(); // 0x116d
    int64_t v4 = f_rand_3(); // 0x1175
    int32_t v5 = v4; // 0x117a
    int64_t v6 = f_rand_2(); // 0x117e
    printf("BB: %d", 0);
    int32_t v7 = v6; // 0x1198
    int32_t v8; // 0x1150
    int64_t v9; // 0x1150
    int32_t v10; // 0x1150
    if (v2 > (v6 & 0xffffffff)) {
        // 0x1150
        v8 = v3;
        v10 = v7;
        v9 = v2;
    } else {
        int32_t v11 = v3;
        int64_t v12 = 0x100000000 * (int64_t)(v11 >> 31) | v3 & 0xffffffff;
        int64_t v13 = v1 & 0xffffffff; // 0x1298
        int64_t v14 = v2;
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        int64_t v15 = 0x100000000 * v14 >> 32; // 0x12f5
        int64_t v16 = 0x749cb29 * v15;
        int32_t v17 = (int32_t)(v16 >> 36) + (int32_t)(v16 >> 63) | v5; // 0x130c
        int64_t v18 = (0x100000000 * (int64_t)(v17 >> 31) | (int64_t)v17) % (v15 & 0xffffffff) - v15 & v13; // 0x1317
        int32_t v19 = v7; // 0x1323
        int64_t v20; // 0x1150
        int32_t v21; // 0x1150
        if (v11 <= 561) {
            v20 = 1;
            printf("BB: %d", 4);
            while (v20 != 0) {
                // 0x1330
                v20 = v11 < 562 != (561 - v11 & v11) < 0;
                printf("BB: %d", 4);
            }
            // 0x1347
            v21 = v14;
            v19 = (v21 + 562 | (int32_t)v18) - v21;
        }
        int32_t v22 = v19;
        printf("BB: %d", 5);
        int64_t v23 = v12 % v14 + v14 & 300; // 0x12bf
        v8 = v11;
        v10 = v22;
        v9 = v23;
        v13 = v18;
        while (v22 >= (int32_t)v23) {
            // 0x12d4
            v14 = v23;
            printf("BB: %d", 1);
            printf("BB: %d", 3);
            v15 = 0x100000000 * v14 >> 32;
            v16 = 0x749cb29 * v15;
            v17 = (int32_t)(v16 >> 36) + (int32_t)(v16 >> 63) | v5;
            v18 = (0x100000000 * (int64_t)(v17 >> 31) | (int64_t)v17) % (v15 & 0xffffffff) - v15 & v13;
            v19 = v22;
            if (v11 <= 561) {
                v20 = 1;
                printf("BB: %d", 4);
                while (v20 != 0) {
                    // 0x1330
                    v20 = v11 < 562 != (561 - v11 & v11) < 0;
                    printf("BB: %d", 4);
                }
                // 0x1347
                v21 = v14;
                v19 = (v21 + 562 | (int32_t)v18) - v21;
            }
            // 0x12a0
            v22 = v19;
            printf("BB: %d", 5);
            v23 = v12 % v14 + v14 & 300;
            v8 = v11;
            v10 = v22;
            v9 = v23;
            v13 = v18;
        }
    }
    // 0x11a8
    printf("BB: %d", 6);
    if (v5 > 961) {
        // 0x135c
        printf("BB: %d", 12);
        // 0x136e
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -v9 & 0xffffffff ^ 0xffffffff;
    }
    // 0x11d8
    printf("BB: %d", 7);
    if (v5 >= 545) {
        while (true) {
            // 0x1200
            printf("BB: %d", 8);
        }
    }
    // 0x1227
    printf("BB: %d", 9);
    if (v10 >= v8) {
        printf("BB: %d", 10);
        while (true) {
            // 0x1250
            printf("BB: %d", 10);
        }
    }
    // 0x1268
    printf("BB: %d", 11);
    // 0x136e
    printf("BB: %d", 13);
    printf("BB: %d", 14);
    return (v4 & 0xffffffff) - (int64_t)v10 & 0xffffffff ^ 0xffffffff;
}
