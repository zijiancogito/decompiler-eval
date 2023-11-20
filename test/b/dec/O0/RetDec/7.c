int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x1158
    int32_t v2 = v1; // 0x115d
    int64_t v3 = f_rand_1(); // 0x1167
    int64_t v4 = f_rand_2(); // 0x116f
    int32_t v5 = v4; // 0x1174
    printf("BB: %d", 0);
    int32_t v6 = 40; // 0x11a2
    int32_t v7 = v3; // 0x11a2
    int32_t v8 = v5; // 0x11a2
    if (v2 == (int32_t)&g1) {
        // 0x11a8
        printf("BB: %d", 1);
        if (v5 <= 311) {
            while (true) {
                // 0x11c8
                printf("BB: %d", 2);
            }
        }
        int32_t v9 = (0x100000000 * (40 * (v4 ^ v1) + v4) >> 32) * (0x100000000 * v3 >> 32); // 0x1194
        printf("BB: %d", 3);
        v7 = (-1 - v9 | v5) + 40;
        printf("BB: %d", 4);
        int32_t v10 = v7 & v2; // 0x126a
        int64_t v11 = v7; // 0x126e
        int32_t v12 = ((int32_t)((0x100000000 * (int64_t)(v10 >> 31) | (int64_t)v10) % v11) ^ 40) - v9; // 0x1276
        int32_t v13 = -1 - v12;
        v6 = (-1 - (int32_t)((0x100000000 * (int64_t)(v7 >> 31) | v11) / (v4 & 0xffffffff) & (0x100000000 * (int64_t)(v13 >> 31) | (int64_t)v13) % v11)) * v9 ^ 40;
        printf("BB: %d", 6);
        v8 = v12 * v9 * v6;
    }
    // 0x1335
    printf("BB: %d", 7);
    if (v8 == 42) {
        // 0x1411
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return 0xffffffd5;
    }
    // 0x1352
    printf("BB: %d", 8);
    if (v7 != v6) {
        while (true) {
            // 0x13c4
            printf("BB: %d", 10);
            printf("BB: %d", 8);
        }
    }
    while (true) {
        // 0x1371
        printf("BB: %d", 9);
    }
}
