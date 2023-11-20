int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_2(); // 0x1157
    int64_t v2 = f_rand_1(); // 0x115f
    int64_t v3 = f_rand_0(a1, a2); // 0x1167
    printf("BB: %d", 0);
    int64_t v4 = 0x100000000 * v3; // 0x117e
    int32_t v5 = (int32_t)(-0x6a5fda97 * (v4 + 0x5b00000000 >> 32) / 0x100000000 + v3) + 91; // 0x1193
    int32_t v6 = v3; // 0x11a5
    uint32_t v7 = (int32_t)v1; // 0x11aa
    if (v6 + 91 + -219 * ((v5 >> 7) + (int32_t)(v5 < 0)) == v7) {
        // 0x11af
        printf("BB: %d", 1);
        int64_t v8 = 0x100000000 * ((v4 >> 32) * v4 / 0x100000000 * (0x100000000 * (v3 + (int64_t)(int32_t)&g1) >> 32) - v1) / 0x100000000 * (0x100000000 * v1 >> 32) & 0xffffffff; // 0x11d5
        // 0x12a0
        printf("BB: %d", 11);
        printf("BB: %d", 12);
        return (v8 | v1) & 0xffffffff;
    }
    // 0x11da
    printf("BB: %d", 3);
    if (v7 >= 556) {
        while (true) {
            // 0x1200
            printf("BB: %d", 4);
        }
    }
    int64_t v9 = v3 & 0xffffffff; // 0x116c
    printf("BB: %d", 5);
    int64_t v10; // 0x1150
    int64_t v11; // 0x1150
    int64_t v12; // 0x1150
    if ((v2 & 0xffffffff) < v9) {
        if ((int32_t)v2 < 0) {
            while (true) {
                // 0x12e0
                printf("BB: %d", 6);
            }
        }
        // 0x1232
        printf("BB: %d", 6);
        printf("BB: %d", 7);
        v10 = 0;
        goto lab_0x127b;
    } else {
        // 0x125b
        printf("BB: %d", 7);
        v10 = v9;
        v11 = v9;
        v12 = 8;
        if (v6 > 853) {
            goto lab_0x1280;
        } else {
            goto lab_0x127b;
        }
    }
  lab_0x127b:
    // 0x127b
    v11 = v10;
    v12 = 9;
    goto lab_0x1280;
  lab_0x1280:
    // 0x1280
    printf("BB: %d", v12);
    printf("BB: %d", 10);
    // 0x12a0
    printf("BB: %d", 11);
    printf("BB: %d", 12);
    return (v11 | v1) & 0xffffffff;
}
