int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_2(); // 0x1150
    int64_t v2 = f_rand_1(); // 0x1158
    int64_t v3 = f_rand_0(a1, a2); // 0x115f
    printf("BB: %d", 0);
    int64_t v4 = 0x100000000 * v3; // 0x1176
    int32_t v5 = (int32_t)(-0x6a5fda97 * (v4 + 0x5b00000000 >> 32) / 0x100000000 + v3) + 91; // 0x118b
    int32_t v6 = v3; // 0x119d
    uint32_t v7 = (int32_t)v1; // 0x11a2
    if (v6 + 91 + -219 * ((v5 >> 7) + (int32_t)(v5 < 0)) == v7) {
        // 0x11a7
        printf("BB: %d", 1);
        int64_t v8 = 0x100000000 * ((v4 >> 32) * v4 / 0x100000000 * (0x100000000 * (v3 + (int64_t)(int32_t)&g1) >> 32) - v1) / 0x100000000 * (0x100000000 * v1 >> 32) & 0xffffffff; // 0x11cd
        // 0x1293
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return (v8 | v1) & 0xffffffff;
    }
    // 0x11d2
    printf("BB: %d", 3);
    if (v7 >= 556) {
        while (true) {
            // 0x11f5
            printf("BB: %d", 4);
        }
    }
    int64_t v9 = v3 & 0xffffffff; // 0x1164
    printf("BB: %d", 5);
    int64_t v10; // 0x114c
    int64_t v11; // 0x114c
    int64_t v12; // 0x114c
    if ((v2 & 0xffffffff) < v9) {
        printf("BB: %d", 6);
        while ((int32_t)v2 < 0) {
            // 0x1224
            printf("BB: %d", 6);
        }
        // 0x1237
        printf("BB: %d", 7);
        v10 = 0;
        goto lab_0x126e;
    } else {
        // 0x124e
        printf("BB: %d", 7);
        v10 = v9;
        v11 = v9;
        v12 = 8;
        if (v6 > 853) {
            goto lab_0x1273;
        } else {
            goto lab_0x126e;
        }
    }
  lab_0x126e:
    // 0x126e
    v11 = v10;
    v12 = 9;
    goto lab_0x1273;
  lab_0x1273:
    // 0x1273
    printf("BB: %d", v12);
    printf("BB: %d", 10);
    // 0x1293
    printf("BB: %d", 11);
    printf("BB: %d", 12);
    return (v11 | v1) & 0xffffffff;
}
