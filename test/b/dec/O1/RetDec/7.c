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
