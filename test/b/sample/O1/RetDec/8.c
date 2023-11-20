int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1() & 0xffffffff; // 0x1160
    int64_t v2 = f_rand_2(); // 0x1163
    int64_t v3 = f_rand_0(a1, a2); // 0x116b
    int64_t v4 = f_rand_4(); // 0x1172
    int64_t v5 = f_rand_3(); // 0x1179
    printf("BB: %d", 0);
    uint32_t v6 = (int32_t)v2; // 0x1191
    int64_t v7 = v5 & 0xffffffff; // 0x1194
    if ((int32_t)v5 != v6) {
        // 0x122c
        printf("BB: %d", 1);
        if (v6 >= 595) {
            while (true) {
                // 0x1250
                printf("BB: %d", 2);
            }
        }
        // 0x128b
        v7 = v1 ^ 0xffffffff;
        printf("BB: %d", 3);
        if (v6 >= 581) {
            while (true) {
                // 0x12b0
                printf("BB: %d", 4);
            }
        }
        printf("BB: %d", 5);
        printf("BB: %d", 6);
        printf("BB: %d", 8);
        while (v6 != (int32_t)v7) {
            // 0x122c
            printf("BB: %d", 1);
            printf("BB: %d", 3);
            printf("BB: %d", 5);
            printf("BB: %d", 6);
            printf("BB: %d", 8);
        }
    }
    int64_t v8 = v4 & 0xffffffff; // 0x1177
    printf("BB: %d", 9);
    int64_t v9; // 0x1150
    int64_t v10; // 0x1150
    if ((v3 & 0xffffffff) > v8) {
        // 0x11b8
        printf("BB: %d", 10);
        v10 = 0xffffffff;
        v9 = (0x100000000 * (v7 - v4) >> 32) * (0x100000000 * v2 >> 32) & 0xffffffff;
    } else {
        // 0x12f3
        printf("BB: %d", 11);
        v10 = v8;
        v9 = v1;
    }
    // 0x12ff
    printf("BB: %d", 12);
    printf("BB: %d", 13);
    return (2 * v2 - v10 ^ v3) & 0xffffffff | v9;
}
