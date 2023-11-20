int64_t func0(int64_t a1, int64_t a2) {
    // 0x114c
    f_rand_4();
    int64_t v1 = f_rand_0(a1, a2) & 0xffffffff; // 0x1161
    int64_t v2 = f_rand_1(); // 0x1163
    uint64_t v3 = v2 & 0xffffffff; // 0x1168
    int64_t v4 = f_rand_3(); // 0x116b
    uint64_t v5 = f_rand_2() & 0xffffffff; // 0x1178
    printf("BB: %d", 0);
    int64_t v6 = v1; // 0x118e
    if (v1 <= v5) {
        int64_t v7 = v1; // 0x11df
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        while ((int32_t)v2 >= 562) {
            uint64_t v8 = v7;
            printf("BB: %d", 5);
            v7 = (2 * v2 % 0x100000001 | v3) % v8 + v8 & 300;
            v6 = v7;
            if (v7 > v5) {
                goto lab_0x11ec;
            }
            printf("BB: %d", 1);
            printf("BB: %d", 3);
        }
        while (true) {
            // 0x128e
            printf("BB: %d", 4);
        }
    }
  lab_0x11ec:
    // 0x11ec
    printf("BB: %d", 6);
    int32_t v9 = v4; // 0x120d
    if (v9 > 961) {
        // 0x123c
        printf("BB: %d", 12);
        // 0x124d
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return -v6 & 0xffffffff ^ 0xffffffff;
    }
    // 0x120f
    printf("BB: %d", 7);
    if (v9 >= 545) {
        while (true) {
            // 0x122b
            printf("BB: %d", 8);
        }
    }
    // 0x129f
    printf("BB: %d", 9);
    if (v5 < v3) {
        // 0x12b7
        printf("BB: %d", 11);
        // 0x124d
        printf("BB: %d", 13);
        printf("BB: %d", 14);
        return (v4 & 0xffffffff) - v5 & 0xffffffff ^ 0xffffffff;
    }
    while (true) {
        // 0x12d9
        printf("BB: %d", 10);
    }
}
