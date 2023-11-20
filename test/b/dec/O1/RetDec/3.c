int64_t func0(int64_t a1, int64_t a2) {
    uint32_t v1 = (int32_t)f_rand_4(); // 0x1163
    int64_t v2 = f_rand_0(a1, a2); // 0x1167
    int64_t v3 = f_rand_2(); // 0x116e
    int64_t v4 = f_rand_1(); // 0x1177
    int64_t v5 = f_rand_3(); // 0x117f
    printf("BB: %d", 0);
    int64_t v6 = 0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5 & 0xffffffff;
    int64_t v7 = v3 & 0xffffffff;
    int64_t v8 = 0; // 0x11b6
    int64_t v9 = v2; // 0x11b6
    int64_t v10 = -0x36562 % (v4 & 0xffffffff) & 0xffffffff; // 0x11b6
    printf("BB: %d");
    while (v1 < 257) {
        int64_t v11 = v9;
        printf("BB: %d");
        int64_t v12 = v10; // 0x12a2
        if (v8 == 0) {
            int64_t v13 = 256 / v1; // 0x1299
            printf("BB: %d");
            while ((int32_t)v11 != -452) {
                // 0x12b0
                printf("BB: %d");
            }
            int64_t v14 = v6 % (v13 + (int64_t)(int32_t)&g1 & 0xffffffff); // 0x12cc
            v12 = (0x100000000 * (int64_t)((int32_t)v14 >> 31) | v14 & 0xffffffff) / v7 & 0xffffffff;
        }
        // 0x11c0
        v10 = v12;
        printf("BB: %d");
        int64_t v15 = 0x48a8048b * (0x100000000 * v11 >> 32);
        v8 = 1;
        v9 = (v11 & 0xffffffff) + 256 + 0xfffffe3d * ((v15 >> 39) + (v15 >> 63));
        if ((int32_t)v10 > 451) {
            // 0x12dd
            printf("BB: %d", 6);
            if (v1 > 648) {
                // 0x1321
                printf("BB: %d", 12);
                printf("BB: %d", 13);
                return v7 ^ 256;
            }
            // 0x12fa
            printf("BB: %d", 7);
            // 0x1310
            printf("BB: %d", 8);
            goto lab_0x1310;
        }
        printf("BB: %d");
    }
    while (true) {
        // 0x1240
        printf("BB: %d", 2);
    }
}
