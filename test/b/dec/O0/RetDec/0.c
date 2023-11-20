int64_t func0(int64_t a1, int64_t a2) {
    int32_t v1 = f_rand_4(); // 0x1164
    int64_t v2 = f_rand_3(); // 0x1167
    int64_t v3 = f_rand_2(); // 0x1176
    int32_t v4 = f_rand_1(); // 0x1183
    uint32_t v5 = (int32_t)f_rand_0(a1, a2); // 0x118b
    printf("BB: %d", 0);
    int64_t v6 = v3 & 0xffffffff ^ 0xffffffff; // 0x11b4
    int32_t v7 = (int32_t)((0x100000000 * (int64_t)((int32_t)v6 >> 31) | v6) % 302) + 719 & v1; // 0x11c0
    int32_t v8 = v1; // 0x11dc
    if (v4 == 543) {
        // 0x11e2
        printf("BB: %d", 1);
        if (v7 == 925) {
            while (true) {
                // 0x1226
                printf("BB: %d", 2);
            }
        }
        // 0x1293
        printf("BB: %d", 3);
        v8 = -1 - v5;
        if (v5 <= 609) {
            while (true) {
                // 0x12b3
                printf("BB: %d", 4);
            }
        }
    }
    // 0x1313
    printf("BB: %d", 5);
    if (v8 == 627) {
        // 0x146d
        printf("BB: %d", 11);
        int32_t v9 = ((int32_t)v3 - 719 ^ v4) & v5; // 0x1489
        return (0x100000000 * (int64_t)(v9 >> 31) | (int64_t)v9) % (int64_t)(v7 & (int32_t)v2) & 0xffffffff;
    }
    // 0x1333
    printf("BB: %d", 6);
    if (v8 > 351) {
        while (true) {
            // 0x1436
            printf("BB: %d", 8);
            printf("BB: %d", 10);
            printf("BB: %d", 6);
        }
    }
    while (true) {
        // 0x1353
        printf("BB: %d", 7);
    }
}
