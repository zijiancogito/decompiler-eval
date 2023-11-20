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
        // 0x11cd
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
            // 0x121d
            printf("BB: %d", 4);
            while (true) {
                // 0x1240
                printf("BB: %d", 4);
            }
        }
        // 0x1251
        v10 = v6 ^ 0xffffffff;
    }
    // 0x1256
    printf("BB: %d", 5);
    int32_t v11 = v10; // 0x1269
    if (v11 == 627) {
        // 0x1271
        printf("BB: %d", 11);
        int64_t v12 = v6 & (v3 + 0xfffffd31 ^ v4); // 0x1291
        return (0x100000000 * (int64_t)((int32_t)v12 >> 31) | v12) % (v2 & 0xffffffff & v9) & 0xffffffff;
    }
    // 0x12ab
    printf("BB: %d", 6);
    if (v11 < 352) {
        // 0x1335
        printf("BB: %d", 7);
        while (true) {
            // 0x1350
            printf("BB: %d", 7);
        }
    }
    // 0x12c6
    printf("BB: %d", 8);
    printf("BB: %d", 10);
    printf("BB: %d", 6);
    while (true) {
        // 0x1300
        printf("BB: %d", 8);
        printf("BB: %d", 10);
        printf("BB: %d", 6);
    }
}
