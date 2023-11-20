int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x115b
    int64_t v2 = f_rand_1(); // 0x1163
    uint64_t v3 = v2 & 0xffffffff; // 0x1168
    int64_t v4 = f_rand_2(); // 0x116b
    printf("BB: %d", 0);
    int64_t v5; // 0x1150
    int64_t v6; // 0x1150
    int64_t v7; // 0x1150
    if ((int32_t)v4 != 547) {
        // 0x1243
        v7 = v4 & 0xffffffff;
        v5 = v1 & 0xffffffff;
        v6 = 78;
    } else {
        uint64_t v8 = v3 ^ 0xffffffff; // 0x1191
        uint32_t v9 = (int32_t)v2; // 0x119b
        if (v9 < 287) {
            // 0x1320
            printf("BB: %d", 1);
            if (v3 <= v8) {
                if (v9 >= 79) {
                    // 0x1450
                    printf("BB: %d", 3);
                    int64_t v10 = 0x3be7a9e3 * 0x100000000 * (2 * v2 % 0x100000001 | v3) / 78 / 0x100000000;
                    int64_t v11 = (v10 >> 39) + (v10 >> 63) & 0xffffffff; // 0x1479
                    printf("BB: %d", 1);
                    while (v11 < v3) {
                        // 0x1450
                        printf("BB: %d", 3);
                        v10 = 0x3be7a9e3 * 0x100000000 * (2 * v2 % 0x100000001 | v3) / v11 / 0x100000000;
                        v11 = (v10 >> 39) + (v10 >> 63) & 0xffffffff;
                        printf("BB: %d", 1);
                    }
                }
                while (true) {
                    // 0x14a0
                    printf("BB: %d", 2);
                }
            }
            int64_t v12 = 78; // 0x134b
            if (v9 >= 79) {
                // 0x1360
                printf("BB: %d", 3);
                int64_t v13 = 0x3be7a9e3 * 0x100000000 * (2 * v2 % 0x100000001 | v3) / 78 / 0x100000000;
                int64_t v14 = (v13 >> 39) + (v13 >> 63) & 0xffffffff; // 0x1389
                printf("BB: %d", 1);
                v12 = v14;
                while (v14 < v3) {
                    // 0x1360
                    printf("BB: %d", 3);
                    v13 = 0x3be7a9e3 * 0x100000000 * (2 * v2 % 0x100000001 | v3) / v14 / 0x100000000;
                    v14 = (v13 >> 39) + (v13 >> 63) & 0xffffffff;
                    printf("BB: %d", 1);
                    v12 = v14;
                }
            }
            int64_t v15 = v12;
            printf("BB: %d", 2);
            int64_t v16 = (v15 ^ 78) + v15; // 0x13ba
            printf("BB: %d", 3);
            v7 = 0xffffffb1;
            v5 = ((0x100000000 * (int64_t)((int32_t)v16 >> 31) | v16 & 0xffffffff) / v15 | v2) & 78 ^ v8;
            v6 = 78;
        } else {
            if (v3 <= v8) {
                // 0x13e4
                printf("BB: %d", 1);
                while (true) {
                    // 0x1400
                    printf("BB: %d", 3);
                    printf("BB: %d", 4);
                    printf("BB: %d", 1);
                }
            }
            uint32_t v17 = -v9; // 0x11ad
            int64_t v18 = v2 + 0xffffffff & 0xffffffff; // 0x11b3
            printf("BB: %d", 1);
            int64_t v19 = 547; // 0x122a
            if (78 >= v3) {
                // 0x122c
                printf("BB: %d", 2);
                v19 = 0xffffffb1;
            }
            int64_t v20 = v19;
            printf("BB: %d", 3);
            printf("BB: %d", 4);
            int64_t v21 = v20 ^ v3;
            int64_t v22 = (0x100000000 * (int64_t)((int32_t)v21 >> 31) | v21 & 0xffffffff) / v18 & 0xffffffff; // 0x11f7
            int32_t v23 = v20;
            int32_t v24 = v23 * v17; // 0x11fc
            int64_t v25 = (0x100000000 * (int64_t)(v24 >> 31) | (int64_t)v24) % v3 & 0xffffffff; // 0x120d
            int64_t v26 = v22; // 0x120d
            while (v23 == 547) {
                // 0x1213
                printf("BB: %d", 1);
                v19 = 547;
                if (v25 >= v3) {
                    // 0x122c
                    printf("BB: %d", 2);
                    v19 = v26 ^ 0xffffffff;
                }
                // 0x11d0
                v20 = v19;
                printf("BB: %d", 3);
                printf("BB: %d", 4);
                v21 = v20 ^ v3;
                v22 = (0x100000000 * (int64_t)((int32_t)v21 >> 31) | v21 & 0xffffffff) / v18 & 0xffffffff;
                v23 = v20;
                v24 = v23 * v17;
                v25 = (0x100000000 * (int64_t)(v24 >> 31) | (int64_t)v24) % v3 & 0xffffffff;
                v26 = v22;
            }
            // 0x142f
            v7 = v20;
            v5 = v17;
            v6 = v22;
        }
    }
    // 0x1249
    printf("BB: %d", 5);
    int64_t v27 = v5 & 0xffffffff;
    int64_t v28 = v27 ^ 0xffffffff; // 0x125f
    int32_t v29 = v7; // 0x1261
    if (v29 == (int32_t)v28) {
        // 0x12f7
        printf("BB: %d", 12);
        return (0x100000000 * (int64_t)((int32_t)v5 >> 31) | v27) / v6 & 0xffffffff;
    }
    // 0x1269
    printf("BB: %d", 6);
    int64_t v30 = v5; // 0x129a
    if (v3 <= v5) {
        // 0x129c
        printf("BB: %d", 7);
        v30 = v7 + 1 + v5 + v6 & 0xffffffff;
    }
    int64_t v31 = v6 ^ v3;
    int64_t v32 = -1 * (0x100000000 * v6 >> 32) * (0x100000000 * ((0x100000000 * (int64_t)((int32_t)v31 >> 31) | v31) % v27) >> 32) | v28; // 0x128c
    int64_t v33 = (0x100000000 * (int64_t)((int32_t)v32 >> 31) | v32 & 0xffffffff) % v27; // 0x1291
    printf("BB: %d", 8);
    int32_t v34 = v33; // 0x12d1
    int32_t v35 = v34 - v29; // 0x12d1
    int64_t v36 = v35 < 0 == ((v35 ^ v34) & (int32_t)(v33 ^ v7)) < 0 == (v35 != 0) ? 9 : 10; // 0x12dc
    printf("BB: %d", v36);
    printf("BB: %d", 11);
    // 0x12f7
    printf("BB: %d", 12);
    return (0x100000000 * (int64_t)((int32_t)v30 >> 31) | v30) / v6 & 0xffffffff;
}
