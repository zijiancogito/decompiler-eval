int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_4(); // 0x115b
    uint64_t v2 = v1 & 0xffffffff; // 0x1160
    int64_t v3 = f_rand_0(a1, a2); // 0x1163
    int64_t v4 = f_rand_2(); // 0x116a
    int64_t v5 = f_rand_1(); // 0x1173
    int64_t v6 = f_rand_3(); // 0x117a
    printf("BB: %d", 0);
    int64_t v7 = 0x100000000 * (int64_t)((int32_t)v6 >> 31) | v6 & 0xffffffff;
    int64_t v8 = v4 & 0xffffffff;
    int64_t v9 = v3; // 0x11a2
    int64_t v10 = -0x36562 % (v5 & 0xffffffff) & 0xffffffff; // 0x11a2
    int64_t v11 = 0; // 0x11a2
    printf("BB: %d", 1);
    while ((int32_t)v1 <= 256) {
        int64_t v12 = v9;
        printf("BB: %d", 3);
        int64_t v13 = v10; // 0x122a
        if (v11 == 0) {
            if ((int32_t)v12 != -452) {
                // 0x12d0
                printf("BB: %d", 4);
                // 0x12d0
                printf("BB: %d", 4);
                // 0x12d0
                printf("BB: %d", 4);
                // 0x12d0
                printf("BB: %d", 4);
                goto lab_0x12d0;
            }
            // 0x1238
            printf("BB: %d", 4);
            int64_t v14 = v7 % (256 / v2 + (int64_t)(int32_t)&g1 & 0xffffffff); // 0x1255
            v13 = (0x100000000 * (int64_t)((int32_t)v14 >> 31) | v14 & 0xffffffff) / v8 & 0xffffffff;
        }
        // 0x11b0
        v10 = v13;
        printf("BB: %d", 5);
        int64_t v15 = 0x48a8048b * (0x100000000 * v12 >> 32);
        v9 = (v12 & 0xffffffff) + 256 + 0xfffffe3d * ((v15 >> 39) + (v15 >> 63));
        v11 = 1;
        if ((int32_t)v10 > 451) {
            // 0x1281
            printf("BB: %d", 6);
            printf("BB: %d", 7);
            // 0x12b0
            printf("BB: %d", 8);
            goto lab_0x12b0;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x1270
        printf("BB: %d", 2);
    }
}
