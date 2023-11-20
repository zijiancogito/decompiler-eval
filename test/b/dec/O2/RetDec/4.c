int64_t func0(int64_t a1, int64_t a2) {
    // 0x1150
    f_rand_4();
    int64_t v1 = f_rand_0(a1, a2) & 0xffffffff; // 0x1165
    int64_t v2 = f_rand_1(); // 0x1167
    uint64_t v3 = v2 & 0xffffffff; // 0x116c
    int64_t v4 = f_rand_3(); // 0x116f
    uint64_t v5 = f_rand_2() & 0xffffffff; // 0x117c
    printf("BB: %d", 0);
    int64_t v6 = v1; // 0x1192
    if (v1 <= v5) {
        int64_t v7 = v1; // 0x11e4
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        while ((int32_t)v2 >= 562) {
            uint64_t v8 = v7;
            printf("BB: %d", 5);
            v7 = (2 * v2 % 0x100000001 | v3) % v8 + v8 & 300;
            v6 = v7;
            if (v7 > v5) {
                goto lab_0x11f1;
            }
            printf("BB: %d", 1);
            printf("BB: %d", 3);
        }
        // 0x129c
        printf("BB: %d", 4);
        while (true) {
            // 0x12c0
            printf("BB: %d", 4);
        }
    }
  lab_0x11f1:
    // 0x11f1
    printf("BB: %d", 6);
    int32_t v9 = v4; // 0x1212
    if (v9 > 961) {
        // 0x1251
        printf("BB: %d", 12);
        // 0x1262
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -v6 & 0xffffffff ^ 0xffffffff;
    }
    // 0x1214
    printf("BB: %d", 7);
    if (v9 >= 545) {
        while (true) {
            // 0x1240
            printf("BB: %d", 8);
        }
    }
    // 0x12d1
    printf("BB: %d", 9);
    if (v5 < v3) {
        // 0x12e9
        printf("BB: %d", 11);
        // 0x1262
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return (v4 & 0xffffffff) - v5 & 0xffffffff ^ 0xffffffff;
    }
    // 0x1304
    printf("BB: %d", 10);
    while (true) {
        // 0x1320
        printf("BB: %d", 10);
    }
}
