int64_t func0(int64_t a1, int64_t a2, int64_t a3) {
    int64_t v1 = f_rand_0(a1, a2); // 0x1157
    int64_t v2 = f_rand_1(); // 0x115e
    int64_t v3 = f_rand_2(); // 0x1166
    int64_t v4 = v3 & 0xffffffff; // 0x116b
    printf("BB: %d", 0);
    int64_t v5; // 0x114c
    int64_t v6; // 0x114c
    int32_t v7; // 0x114c
    if ((int32_t)v1 != (int32_t)&g1) {
        // 0x11ba
        v7 = 40;
        v5 = v2 & 0xffffffff;
        v6 = v4;
    } else {
        // 0x1186
        printf("BB: %d", 1);
        if ((int32_t)v3 <= 311) {
            while (true) {
                // 0x11a9
                printf("BB: %d", 2);
            }
        }
        int64_t v8 = (0x100000000 * (40 * (v4 ^ v1 & 0xffffffff) + v3) >> 32) * (0x100000000 * v2 >> 32); // 0x11cf
        printf("BB: %d", 3);
        int64_t v9 = (v8 ^ 0xffffffff | v4) + 40; // 0x11f2
        int64_t v10 = v9 & 0xffffffff; // 0x11f2
        printf("BB: %d", 4);
        int64_t v11 = ((v9 & (int64_t)(int32_t)&g1) % v10 ^ 40) - v8; // 0x1217
        int64_t v12 = v11 & 0xffffffff ^ 0xffffffff; // 0x121c
        int64_t v13 = 0x100000000 * v8;
        int64_t v14 = ((0x100000000 * ((0x100000000 * (int64_t)((int32_t)v9 >> 31) | v10) / v4 & (0x100000000 * (int64_t)((int32_t)v12 >> 31) | v12) % v10) ^ -0x100000000) >> 32) * (v13 >> 32) & 0xffffffff ^ 40; // 0x1235
        printf("BB: %d", 6);
        v7 = v14;
        v5 = v10;
        v6 = (0x100000000 * v14 >> 32) * (0x100000000 * v11 >> 32) * v13 / 0x100000000 & 0xffffffff;
    }
    // 0x1251
    printf("BB: %d", 7);
    if (v6 == 42) {
        // 0x126a
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return 0xffffffd5;
    }
    // 0x12a3
    printf("BB: %d", 8);
    if (v7 == (int32_t)v5) {
        while (true) {
            // 0x12f6
            printf("BB: %d", 9);
        }
    }
    while (true) {
        // 0x12c8
        printf("BB: %d", 10);
        printf("BB: %d", 8);
    }
}
