int64_t func0(int64_t a1, int64_t a2, int64_t a3) {
    int64_t v1 = f_rand_0(a1, a2); // 0x115b
    int64_t v2 = f_rand_4(); // 0x1164
    int64_t v3 = f_rand_2(); // 0x116c
    uint64_t v4 = v3 & 0xffffffff; // 0x1171
    int64_t v5 = f_rand_1(); // 0x1173
    int64_t v6 = v5 & 0xffffffff; // 0x1178
    int64_t v7 = f_rand_3(); // 0x117b
    uint64_t v8 = v7 & 0xffffffff; // 0x1180
    printf("BB: %d", 0);
    int64_t v9 = 0x100000000 * v7 >> 32; // 0x1192
    int64_t v10 = 0xdbeb61f * v9;
    int64_t v11 = v7 + 298 + 0xfffffed6 * ((v10 >> 36) + (v10 >> 63)); // 0x11b5
    int64_t v12 = v11 & 0xffffffff; // 0x11b5
    int64_t v13; // 0x1150
    int64_t v14; // 0x1150
    int64_t v15; // 0x1150
    if (v12 < (v2 & 0xffffffff)) {
        // 0x11c8
        printf("BB: %d", 5);
        if (v8 < v4) {
            while (true) {
                // 0x11f0
                printf("BB: %d", 6);
            }
        }
        // 0x12a8
        printf("BB: %d", 7);
        if ((int32_t)v5 < 407) {
            // 0x139b
            v15 = (0x100000000 * v11 >> 32) * v9 & 0x100000000 * v1 >> 32;
            v13 = v12;
            v14 = v6;
        } else {
            int64_t v16 = v12 ^ v6;
            int64_t v17 = v16 * v1 ^ v7; // 0x12cb
            int64_t v18 = 0x100000000 * v17 >> 32; // 0x12e2
            int64_t v19 = v18 * v18; // 0x12e2
            if ((int32_t)v19 >= 407) {
                while (true) {
                    // 0x1300
                    printf("BB: %d", 8);
                }
            }
            int64_t v20 = v17 & 0xffffffff; // 0x12cb
            printf("BB: %d", 8);
            v15 = 0x100000000 * ((0x100000000 * (int64_t)((int32_t)v7 >> 31) | v8) / v20 | v7) / 0x100000000 * (0x100000000 * v16 >> 32) ^ 0xffffffff | v20;
            v13 = v12;
            v14 = v19 & 0xffffffff;
        }
    } else {
        // 0x1201
        printf("BB: %d", 1);
        int64_t v21; // 0x1150
        int64_t v22; // 0x1150
        int64_t v23; // 0x1150
        if ((int32_t)v5 < 686) {
            // 0x1311
            v23 = v8 + v4 + (v12 ^ v8);
            v21 = v12;
            v22 = v6;
        } else {
            int64_t v24 = (v2 + v1) * v2; // 0x1222
            printf("BB: %d", 2);
            int64_t v25 = (int64_t)(298 % (int16_t)v11) - v4; // 0x1247
            uint32_t v26 = (int32_t)v3;
            uint32_t v27 = 298 / v26 % v26;
            int64_t v28 = v27;
            int64_t v29 = v28; // 0x125f
            int64_t v30 = v25; // 0x125f
            if ((int32_t)v25 >= 686) {
                // 0x1261
                printf("BB: %d", 2);
                uint16_t v31 = (int16_t)v27; // 0x127a
                v29 = 298 / v31 % v31;
                v30 = (int64_t)(298 % (int32_t)v24) - v28;
            }
            int64_t v32 = v30 & 0xffffffff;
            v23 = (0x100000000 * (int64_t)((int32_t)v1 >> 31) | v1 & 0xffffffff) % v32 + v29;
            v21 = v24 & 0xffffffff;
            v22 = v32;
        }
        int64_t v33 = v22;
        printf("BB: %d", 3);
        if (v33 != 298) {
            // 0x1391
            v15 = (v21 ^ 0xffffffff) + v33;
            v13 = v21;
            v14 = v33;
        } else {
            int64_t v34 = 0x100000000 * v1 >> 32;
            int64_t v35 = (v23 & 0xffffffff) + v21; // 0x1334
            int64_t v36 = 298 * ((0x100000000 * (int64_t)((int32_t)v35 >> 31) | v35 & 0xffffffff) % (v34 & 0xffffffff)); // 0x133d
            int64_t v37 = ((0x100000000 * (int64_t)((int32_t)v36 >> 31) | v36 & 0xfffffffe) % v33 & 0xffffffff) + v33; // 0x1352
            int64_t v38 = 1 - v34 + v21 + v37; // 0x135f
            if ((int32_t)v38 == 298) {
                while (true) {
                    // 0x1380
                    printf("BB: %d", 4);
                }
            }
            // 0x13a6
            printf("BB: %d", 4);
            v15 = v37;
            v13 = v21;
            v14 = v38 & 0xffffffff;
        }
    }
    int64_t v39 = v15 & 0xffffffff;
    printf("BB: %d", 9);
    int64_t v40 = v13 + 298;
    int64_t v41 = v39 - v14 ^ v39; // 0x140c
    printf("BB: %d", 10);
    return ((0x100000000 * (int64_t)((int32_t)v41 >> 31) | v41 & 0xffffffff) / ((v40 | 1) + v15 & 0xffffffff) + v40 | v40) & 0xffffffff ^ 298;
}
