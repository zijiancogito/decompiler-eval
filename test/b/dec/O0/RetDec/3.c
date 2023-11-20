int64_t func0(int64_t a1, int64_t a2) {
    int32_t v1 = f_rand_4();
    int64_t v2 = f_rand_0(a1, a2); // 0x1167
    int64_t v3 = f_rand_2(); // 0x1176
    int64_t v4 = f_rand_1(); // 0x117e
    int64_t v5 = f_rand_3(); // 0x1186
    printf("BB: %d", 0);
    int32_t v6 = (0x100000000 * (int64_t)((int32_t)(-257 * (int64_t)(int32_t)&g1) >> 31) | (int64_t)(int32_t)(-257 * (int64_t)(int32_t)&g1)) % (v4 & 0xffffffff); // 0x11b0
    if (v6 > 493) {
      lab_0x131d:
        // 0x131d
        printf("BB: %d", 6);
        if (v1 > 648) {
            // 0x1474
            printf("BB: %d", 12);
            printf("BB: %d", 13);
            return v3 & 0xffffffff ^ 256;
        }
        // 0x133d
        printf("BB: %d", 7);
        while (true) {
            // 0x136f
            printf("BB: %d", 8);
        }
    }
    int64_t v7 = 0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5 & 0xffffffff;
    int64_t v8 = v3 & 0xffffffff;
    int32_t v9 = v6;
    int32_t v10 = v2; // 0x1150
    int32_t v11 = 493; // 0x1150
    printf("BB: %d", 1);
    while (v1 <= 256) {
        int32_t v12 = v10;
        printf("BB: %d", 3);
        int32_t v13 = v9; // 0x1284
        if (v11 != 451) {
            int64_t v14 = (int64_t)(256 / v1) + (int64_t)(int32_t)&g1; // 0x1277
            printf("BB: %d", 4);
            while (v12 != -452) {
                // 0x128a
                printf("BB: %d", 4);
            }
            int64_t v15 = v7 % (v14 & 0xffffffff); // 0x12a1
            v13 = (0x100000000 * (int64_t)((int32_t)v15 >> 31) | v15 & 0xffffffff) / v8;
        }
        // 0x12f8
        v9 = v13;
        printf("BB: %d", 5);
        v10 = (int32_t)((0x100000000 * (int64_t)(v12 >> 31) | (int64_t)v12) % 451) + 256;
        v11 = 451;
        if (v9 > 451) {
            goto lab_0x131d;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x11e1
        printf("BB: %d", 2);
    }
}
