int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x115b
    int64_t v2 = f_rand_2(); // 0x1163
    int64_t v3 = f_rand_0(a1, a2); // 0x116a
    int64_t v4 = f_rand_4(); // 0x1172
    int64_t v5 = f_rand_3(); // 0x117a
    printf("BB: %d", 0);
    uint32_t v6 = (int32_t)v2; // 0x1191
    if ((int32_t)v5 != v6) {
        if (v6 >= 595) {
            // 0x11da
            printf("BB: %d", 1);
            while (true) {
                // 0x11f0
                printf("BB: %d", 2);
            }
        }
        if (v6 >= 581) {
            // 0x1256
            printf("BB: %d", 1);
            printf("BB: %d", 3);
            while (true) {
                // 0x1280
                printf("BB: %d", 4);
            }
        }
        if (v6 != -1 - (int32_t)v1) {
            while (true) {
                // 0x1300
                printf("BB: %d", 1);
                printf("BB: %d", 3);
                printf("BB: %d", 5);
                printf("BB: %d", 6);
                printf("BB: %d", 8);
            }
        }
        // 0x129a
        printf("BB: %d", 1);
        printf("BB: %d", 3);
        printf("BB: %d", 5);
        printf("BB: %d", 6);
        printf("BB: %d", 8);
    }
    int64_t v7 = v4 & 0xffffffff; // 0x1177
    printf("BB: %d", 9);
    int64_t v8; // 0x1150
    int64_t v9; // 0x1150
    if ((v3 & 0xffffffff) > v7) {
        // 0x11b4
        printf("BB: %d", 10);
        v8 = (0x100000000 * (v2 - v4) >> 32) * (0x100000000 * v2 >> 32);
        v9 = 0xffffffff;
    } else {
        // 0x1201
        printf("BB: %d", 11);
        v8 = v1;
        v9 = v7;
    }
    // 0x120d
    printf("BB: %d", 12);
    printf("BB: %d", 13);
    return (2 * v2 - v9 ^ v3 | v8) & 0xffffffff;
}
