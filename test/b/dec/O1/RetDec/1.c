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
