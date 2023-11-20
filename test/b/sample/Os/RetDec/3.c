int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_4(); // 0x1157
    uint64_t v2 = v1 & 0xffffffff; // 0x115c
    int64_t v3 = f_rand_0(a1, a2); // 0x115f
    int64_t v4 = f_rand_2(); // 0x1166
    int64_t v5 = f_rand_1(); // 0x116e
    int64_t v6 = f_rand_3(); // 0x1176
    printf("BB: %d", 0);
    int32_t v7 = v1;
    int64_t v8 = 0x100000000 * (int64_t)((int32_t)v6 >> 31) | v6 & 0xffffffff;
    int64_t v9 = v4 & 0xffffffff;
    int64_t v10 = v3; // 0x119e
    int64_t v11 = -0x36562 % (v5 & 0xffffffff) & 0xffffffff; // 0x119e
    int64_t v12 = 0; // 0x119e
    printf("BB: %d", 1);
    while (v7 <= 256) {
        int64_t v13 = v10;
        printf("BB: %d", 3);
        int64_t v14 = v11; // 0x11da
        if (v12 == 0) {
            printf("BB: %d", 4);
            // 0x11dc
            while ((int32_t)v13 != -452) {
                // 0x11e6
                printf("BB: %d", 4);
            }
            int64_t v15 = v8 % (256 / v2 + (int64_t)(int32_t)&g1 & 0xffffffff); // 0x1202
            v14 = (0x100000000 * (int64_t)((int32_t)v15 >> 31) | v15 & 0xffffffff) / v9 & 0xffffffff;
        }
        // 0x120e
        v11 = v14;
        printf("BB: %d", 5);
        int64_t v16 = 0x48a8048b * (0x100000000 * v13 >> 32);
        v10 = (v13 & 0xffffffff) + 256 + 0xfffffe3d * ((v16 >> 39) + (v16 >> 63));
        v12 = 1;
        if ((int32_t)v11 >= 452) {
            // 0x1254
            printf("BB: %d", 6);
            if (v7 > 648) {
                // 0x12af
                printf("BB: %d", 12);
                printf("BB: %d", 13);
                return v9 ^ 256;
            }
            // 0x127a
            printf("BB: %d", 7);
            // 0x1286
            printf("BB: %d", 8);
            goto lab_0x1286;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x129e
        printf("BB: %d", 2);
    }
}
