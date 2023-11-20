int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x1157
    int64_t v2 = f_rand_2(); // 0x115f
    int64_t v3 = f_rand_0(a1, a2); // 0x1166
    int64_t v4 = f_rand_4(); // 0x116e
    int64_t v5 = f_rand_3(); // 0x1176
    printf("BB: %d", 0);
    int32_t v6 = v2; // 0x118d
    if ((int32_t)v5 == v6) {
      lab_0x1206:;
        int64_t v7 = v4 & 0xffffffff; // 0x1173
        printf("BB: %d", 9);
        int64_t v8; // 0x114c
        int64_t v9; // 0x114c
        if ((v3 & 0xffffffff) > v7) {
            // 0x1225
            printf("BB: %d", 10);
            v8 = (0x100000000 * (v2 - v4) >> 32) * (0x100000000 * v2 >> 32);
            v9 = 0xffffffff;
        } else {
            // 0x1243
            printf("BB: %d", 11);
            v8 = v1;
            v9 = v7;
        }
        // 0x124f
        printf("BB: %d", 12);
        printf("BB: %d", 13);
        return (2 * v2 - v9 ^ v3 | v8) & 0xffffffff;
    }
    printf("BB: %d", 1);
    while (v6 <= 594) {
        // 0x11b9
        printf("BB: %d", 3);
        if (v6 > 580) {
            // 0x12af
            printf("BB: %d", 4);
            // 0x12af
            printf("BB: %d", 4);
            // 0x12af
            printf("BB: %d", 4);
            goto lab_0x12af;
        }
        // 0x11d4
        printf("BB: %d", 5);
        printf("BB: %d", 6);
        printf("BB: %d", 8);
        if (v6 == -1 - (int32_t)v1) {
            goto lab_0x1206;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x1297
        printf("BB: %d", 2);
    }
}
