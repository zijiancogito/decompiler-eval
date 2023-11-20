int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_2(); // 0x1158
    int32_t v2 = v1; // 0x115d
    int64_t v3 = f_rand_1(); // 0x1160
    int64_t v4 = f_rand_0(a1, a2); // 0x1176
    printf("BB: %d", 0);
    int64_t v5 = v4 + (int64_t)((int32_t)&g1 & 219); // 0x1194
    if ((int32_t)((0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5 & 0xffffffff) % 219) == v2) {
        // 0x11b7
        printf("BB: %d", 1);
        int64_t v6 = ((0x100000000 * v4 >> 32) * v4 * (0x100000000 * (v4 + (int64_t)(int32_t)&g1) >> 32) - v1) * v1; // 0x1215
        if (v2 < 734) {
            // 0x1487
            printf("BB: %d", 11);
            printf("BB: %d", 12);
            return (v6 | v1) & 0xffffffff;
        }
        while (true) {
            // 0x121b
            printf("BB: %d", 2);
        }
    }
    // 0x1287
    printf("BB: %d", 3);
    if (v2 >= 556) {
        while (true) {
            // 0x12b9
            printf("BB: %d", 4);
        }
    }
    int32_t v7 = v3; // 0x1165
    int32_t v8 = v4; // 0x117b
    printf("BB: %d", 5);
    int64_t v9; // 0x1150
    int64_t v10; // 0x1150
    if (v8 > v7) {
        printf("BB: %d", 6);
        while (v7 < 0) {
            // 0x133e
            printf("BB: %d", 6);
        }
        // 0x139e
        printf("BB: %d", 7);
        v10 = 0;
        goto lab_0x140f;
    } else {
        // 0x139e
        printf("BB: %d", 7);
        v10 = v4;
        if (v8 < 854) {
            goto lab_0x140f;
        } else {
            // 0x13be
            printf("BB: %d", 8);
            v9 = v4;
            goto lab_0x1463;
        }
    }
  lab_0x140f:
    // 0x140f
    printf("BB: %d", 9);
    v9 = v10;
    goto lab_0x1463;
  lab_0x1463:
    // 0x1463
    printf("BB: %d", 10);
    // 0x1487
    printf("BB: %d", 11);
    printf("BB: %d", 12);
    return (v9 | v1) & 0xffffffff;
}
