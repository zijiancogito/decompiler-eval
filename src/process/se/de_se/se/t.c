int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x115b
    int64_t v2 = f_rand_0(a1, a2); // 0x1163
    int64_t v3 = v2 & 0xffffffff; // 0x1168
    int64_t v4 = f_rand_2(); // 0x116b
    printf("BB: %d", 0);
    printf("BB: %d", 5);
    int64_t v5 = v3 ^ 0xffffffff; // 0x119e
    int64_t v6 = (0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5) / (v1 & 0xffffffff) ^ v4;
    uint32_t v7 = (int32_t)v4; // 0x11ae
    int64_t v8 = v2 & 40; // 0x11b9
    while (true) {
        // 0x11e3
        printf("BB: %d", 6);
        if (v7 <= 205) {
            int64_t v9 = 1;
            printf("BB: %d", 7);
            while (v9 != 0) {
                // 0x1220
                v9 = v7 < 206 != (205 - v7 & v7) < 0;
                printf("BB: %d", 7);
            }
        }
        int64_t v10 = (0x100000000 * (int64_t)((int32_t)v6 >> 31) | v6 & 0xffffffff) % v8; // 0x11f7
        int64_t v11 = ((0x100000000 * (int64_t)((int32_t)v10 >> 31) | v10 & 0xffffffff) ^ 688) % v3 & 0xffffffff; // 0x1204
        printf("BB: %d", 8);
        v8 = v11;
        int64_t v12 = v11; // 0x11d2
        if ((int32_t)v2 < 0) {
            printf("BB: %d", 9);
            int64_t v13 = v12 & 0xffffffff ^ 0xffffffff; // 0x124f
            v8 = v13;
            v12 = v13;
            while (v3 <= v13) {
                // 0x1240
                printf("BB: %d", 9);
                v13 = v12 & 0xffffffff ^ 0xffffffff;
                v8 = v13;
                v12 = v13;
            }
        }
        // 0x11d4
        printf("BB: %d", 10);
    }
}


