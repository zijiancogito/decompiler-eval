int64_t func0(int64_t a1, int64_t a2) {
    // 0x1150
    f_rand_4();
    int32_t v1 = f_rand_0(a1, a2); // 0x1165
    int64_t v2 = f_rand_1(); // 0x1168
    int32_t v3 = v2; // 0x116d
    int64_t v4 = f_rand_3(); // 0x1170
    int32_t v5 = f_rand_2(); // 0x118b
    printf("BB: %d", 0);
    int32_t v6 = v1; // 0x11a4
    if (v1 <= v5) {
        int64_t v7 = 0x100000000 * (int64_t)(v3 >> 31) | v2 & 0xffffffff;
        int32_t v8 = v1; // 0x12c5
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        while (v3 >= 562) {
            uint32_t v9 = v8;
            printf("BB: %d", 5);
            v8 = v9 + (int32_t)(v7 % (int64_t)v9) & 300;
            v6 = v8;
            if (v8 > v5) {
                goto lab_0x12dd;
            }
            printf("BB: %d", 1);
            printf("BB: %d", 3);
        }
        while (true) {
            // 0x124e
            printf("BB: %d", 4);
        }
    }
  lab_0x12dd:;
    int32_t v10 = v4; // 0x1175
    printf("BB: %d", 6);
    if (v10 > 961) {
        // 0x1433
        printf("BB: %d", 12);
        // 0x149a
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return v6 - 1;
    }
    // 0x12fd
    printf("BB: %d", 7);
    if (v10 >= 545) {
        while (true) {
            // 0x131d
            printf("BB: %d", 8);
        }
    }
    // 0x137c
    printf("BB: %d", 9);
    if (v5 < v3) {
        // 0x13f5
        printf("BB: %d", 11);
        // 0x149a
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -1 - (-1 * v5 + v10);
    }
    while (true) {
        // 0x139b
        printf("BB: %d", 10);
    }
}
