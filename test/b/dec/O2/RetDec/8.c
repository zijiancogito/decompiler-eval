int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x115b
    int64_t v2 = f_rand_2(); // 0x1163
    int64_t v3 = f_rand_0(a1, a2); // 0x116a
    int64_t v4 = f_rand_4(); // 0x1172
    int64_t v5 = f_rand_3(); // 0x117a
    printf("BB: %d", 0);
    int32_t v6 = v2; // 0x1191
    if ((int32_t)v5 == v6) {
      lab_0x1218:;
        int64_t v7 = v4 & 0xffffffff; // 0x1177
        printf("BB: %d", 9);
        int64_t v8; // 0x1150
        int64_t v9; // 0x1150
        if ((v3 & 0xffffffff) > v7) {
            // 0x1237
            printf("BB: %d", 10);
            v8 = (0x100000000 * (v2 - v4) >> 32) * (0x100000000 * v2 >> 32);
            v9 = 0xffffffff;
        } else {
            // 0x1255
            printf("BB: %d", 11);
            v8 = v1;
            v9 = v7;
        }
        // 0x1261
        printf("BB: %d", 12);
        printf("BB: %d", 13);
        return (2 * v2 - v9 ^ v3 | v8) & 0xffffffff;
    }
    printf("BB: %d", 1);
    while (v6 <= 594) {
        // 0x11cb
        printf("BB: %d", 3);
        if (v6 > 580) {
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
        // 0x11e6
        printf("BB: %d", 5);
        printf("BB: %d", 6);
        printf("BB: %d", 8);
        if (v6 == -1 - (int32_t)v1) {
            goto lab_0x1218;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x12b0
        printf("BB: %d", 2);
    }
}
