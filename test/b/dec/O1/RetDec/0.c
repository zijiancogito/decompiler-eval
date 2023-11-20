int64_t func0(int64_t a1, int64_t a2, int64_t a3, int64_t a4) {
    int64_t v1 = f_rand_4(); // 0x115e
    int64_t v2 = v1 & 0xffffffff; // 0x1163
    int64_t v3 = f_rand_3(); // 0x1166
    int64_t v4 = f_rand_2(); // 0x116e
    int64_t v5 = v4 & 0xffffffff; // 0x1173
    int64_t v6 = f_rand_1(); // 0x1176
    int64_t v7 = f_rand_0(a1, a2); // 0x117d
    printf("BB: %d", 0);
    int64_t v8 = (0x100000000 * v4 ^ -0x100000000) >> 32; // 0x1199
    int64_t v9 = 0x36406c81 * v8;
    int64_t v10 = v8 + 719 + 0xfffffed2 * ((v9 >> 38) + (v9 >> 63)) & v1; // 0x11be
    int64_t v11 = v3 & 0xffffffff & v10; // 0x11c4
    uint32_t v12 = (int32_t)v7; // 0x11cd
    int64_t v13; // 0x1150
    int64_t v14; // 0x1150
    int64_t v15; // 0x1150
    int64_t v16; // 0x1150
    if ((int32_t)v6 != 543) {
        // 0x1295
        v16 = 302;
        v15 = v6 & 0xffffffff;
        v13 = v5;
        v14 = v2;
    } else {
        int64_t v17 = v7 & 0xffffffff; // 0x1182
        printf("BB: %d", 1);
        int64_t v18 = v17 ^ 0xffffffff; // 0x11f0
        int64_t v19 = 302; // 0x11f8
        int64_t v20 = 543; // 0x11f8
        int64_t v21 = v5; // 0x11f8
        if ((int32_t)v10 == 925) {
            int64_t v22 = v4 + 0xfffffd30; // 0x1201
            int64_t v23 = v5; // 0x123b
            int64_t v24 = (v2 | v11 | 719) & v10; // 0x123b
            int64_t v25 = 543;
            printf("BB: %d", 2);
            int64_t v26 = (0x12e00000000 >> 32) * (0x100000000 * v18 >> 32) - v25; // 0x1257
            int64_t v27 = v26 & 0xffffffff; // 0x1257
            int64_t v28 = 925 - v24; // 0x1262
            int64_t v29 = v25 & v22 & (0x100000000 * (int64_t)((int32_t)v28 >> 31) | v28 & 0xffffffff) % v25; // 0x126c
            int64_t v30 = v24 ^ v11 ^ v26;
            int64_t v31 = (0x100000000 * (int64_t)((int32_t)v30 >> 31) | v30 & 0xffffffff) / v11 | v25 ^ 0xffffffff; // 0x127b
            v23 ^= (v18 & 719) * (0x100000000 * v7 >> 32) & 0xffffffff;
            v24 = (0x100000000 * (int64_t)((int32_t)v31 >> 31) | v31 & 0xffffffff) / v17 & 0xffffffff;
            v19 = v27;
            v20 = v29;
            v21 = v23;
            while ((int32_t)v10 == 925) {
                // 0x1240
                v25 = v29;
                printf("BB: %d", 2);
                v26 = (0x100000000 * v27 >> 32) * (0x100000000 * v18 >> 32) - v25;
                v27 = v26 & 0xffffffff;
                v28 = 925 - v24;
                v29 = v25 & v22 & (0x100000000 * (int64_t)((int32_t)v28 >> 31) | v28 & 0xffffffff) % v25;
                v30 = v24 ^ v11 ^ v26;
                v31 = (0x100000000 * (int64_t)((int32_t)v30 >> 31) | v30 & 0xffffffff) / v11 | v25 ^ 0xffffffff;
                v23 ^= (v18 & 719) * (0x100000000 * v7 >> 32) & 0xffffffff;
                v24 = (0x100000000 * (int64_t)((int32_t)v31 >> 31) | v31 & 0xffffffff) / v17 & 0xffffffff;
                v19 = v27;
                v20 = v29;
                v21 = v23;
            }
        }
        // 0x12a9
        printf("BB: %d", 3);
        v16 = v19;
        v15 = v20;
        v13 = v21;
        v14 = v18;
        if (v12 <= 609) {
            int64_t v32 = 1;
            printf("BB: %d", 4);
            v16 = v19;
            v15 = v20;
            v13 = v21;
            v14 = v18;
            while (v32 != 0) {
                // 0x12e0
                v32 = v12 < 610 != (609 - v12 & v12) < 0;
                printf("BB: %d", 4);
                v16 = v19;
                v15 = v20;
                v13 = v21;
                v14 = v18;
            }
        }
    }
    // 0x1301
    printf("BB: %d", 5);
    uint32_t v33 = (int32_t)v14; // 0x1314
    if (v33 == 627) {
        // 0x1322
        printf("BB: %d", 11);
        int32_t v34 = ((int32_t)v13 - 719 ^ (int32_t)v15) & v12; // 0x1340
        return (0x100000000 * (int64_t)(v34 >> 31) | (int64_t)v34) % v11 & 0xffffffff;
    }
    // 0x1359
    while (true) {
        // 0x1398
        printf("BB: %d", 6);
        if (v33 <= 351) {
            int64_t v35 = 1;
            printf("BB: %d", 7);
            while (v35 != 0) {
                // 0x13c0
                v35 = v33 < 352 != (351 - v33 & v33) < 0;
                printf("BB: %d", 7);
            }
        }
        // 0x13e9
        printf("BB: %d", 8);
        if ((int32_t)v16 >= 720) {
            // 0x1400
            printf("BB: %d", 9);
        }
        // 0x1380
        printf("BB: %d", 10);
    }
}
