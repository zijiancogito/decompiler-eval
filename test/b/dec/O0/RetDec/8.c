int64_t func0(int64_t a1, int64_t a2) {
    int32_t v1 = f_rand_1(); // 0x115d
    int64_t v2 = f_rand_2(); // 0x1160
    uint32_t v3 = (int32_t)v2; // 0x1165
    int64_t v4 = f_rand_0(a1, a2); // 0x1168
    int64_t v5 = f_rand_4(); // 0x1170
    int64_t v6 = f_rand_3(); // 0x1178
    printf("BB: %d", 0);
    if ((int32_t)v6 == v3) {
      lab_0x1393:;
        int32_t v7 = v4; // 0x116d
        int32_t v8 = v5; // 0x1175
        printf("BB: %d", 9);
        int32_t v9; // 0x1150
        int32_t v10; // 0x1150
        if (v7 > v8) {
            // 0x13b2
            printf("BB: %d", 10);
            int64_t v11 = v2 & 0xffffffff; // 0x13c9
            int32_t v12 = (int32_t)((0x100000000 * (int64_t)(v3 / 0x80000000) | v11) % v11) + v3; // 0x13cc
            v9 = ((v12 & v3) - v8) * v3;
            v10 = (v12 & v8 | v3) + -1 - v12;
        } else {
            // 0x140e
            printf("BB: %d", 11);
            v9 = v1;
            v10 = v8;
        }
        // 0x1458
        printf("BB: %d", 12);
        printf("BB: %d", 13);
        return 2 * v3 - v10 ^ v7 | v9;
    }
    printf("BB: %d", 1);
    while (v3 < 595) {
        // 0x1221
        printf("BB: %d", 3);
        if (v3 >= 581) {
            // 0x1241
            printf("BB: %d", 4);
            // 0x1241
            printf("BB: %d", 4);
            // 0x1241
            printf("BB: %d", 4);
            goto lab_0x1241;
        }
        // 0x136a
        printf("BB: %d", 5);
        printf("BB: %d", 6);
        printf("BB: %d", 8);
        if (-1 - v1 == v3) {
            goto lab_0x1393;
        }
        printf("BB: %d", 1);
    }
    while (true) {
        // 0x11bc
        printf("BB: %d", 2);
    }
}
