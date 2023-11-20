int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x115b
    int64_t v2 = f_rand_4(); // 0x1162
    int64_t v3 = f_rand_2(); // 0x116a
    int64_t v4 = v3 & 0xffffffff; // 0x116f
    int64_t v5 = f_rand_1(); // 0x1171
    int64_t v6 = v5 & 0xffffffff; // 0x1176
    int64_t v7 = f_rand_3(); // 0x1179
    uint64_t v8 = v7 & 0xffffffff; // 0x117e
    printf("BB: %d", 0);
    int64_t v9 = 0x100000000 * v7 >> 32; // 0x1191
    int64_t v10 = 0xdbeb61f * v9;
    int64_t v11 = v7 + 298 + 0xfffffed6 * ((v10 >> 36) + (v10 >> 63)); // 0x11b4
    int64_t v12 = v11 & 0xffffffff; // 0x11b4
    int64_t v13; // 0x1150
    int64_t v14; // 0x1150
    int64_t v15; // 0x1150
    if (v12 < (v2 & 0xffffffff)) {
        // 0x11c4
        printf("BB: %d", 5);
        int32_t v16 = v7; // 0x11db
        int32_t v17 = v16 - (int32_t)v3; // 0x11db
        if (v8 < v4) {
            int64_t v18 = 1;
            printf("BB: %d", 6);
            while (v18 != 0) {
                // 0x11f0
                v18 = v17 < 0 != ((v17 ^ v16) & (int32_t)(v7 ^ v3)) < 0;
                printf("BB: %d", 6);
            }
        }
        // 0x1207
        printf("BB: %d", 7);
        if ((int32_t)v5 < 407) {
            // 0x130d
            v13 = v12;
            v14 = v6;
            v15 = (0x100000000 * v11 >> 32) * v9 & 0x100000000 * v1 >> 32;
        } else {
            int64_t v19 = v12 ^ v6;
            int64_t v20 = v19 * v1 ^ v7; // 0x122a
            int64_t v21 = v20 & 0xffffffff; // 0x122a
            int64_t v22 = 0x100000000 * (int64_t)(v16 >> 31) | v8; // 0x1231
            int64_t v23 = 0x100000000 * v20 >> 32; // 0x1249
            int64_t v24 = v23 * v23; // 0x1249
            printf("BB: %d", 8);
            while ((int32_t)v24 >= 407) {
                // 0x1260
                printf("BB: %d", 8);
            }
            // 0x1278
            v13 = v12;
            v14 = v24 & 0xffffffff;
            v15 = (0x100000000 * (v22 / v21 | v7) >> 32) * (0x100000000 * v19 >> 32) ^ 0xffffffff | v21;
        }
    } else {
        int64_t v25 = v1 & 0xffffffff; // 0x1160
        printf("BB: %d", 1);
        int64_t v26; // 0x1150
        int64_t v27; // 0x1150
        int64_t v28; // 0x1150
        int64_t v29; // 0x1150
        if ((int32_t)v5 < 686) {
            // 0x1316
            v29 = v25;
            v28 = v8 + v4 + (v12 ^ v8);
            v26 = v12;
            v27 = v6;
        } else {
            int64_t v30 = (0x100000000 * (v2 + v1) >> 32) * (0x100000000 * v2 >> 32) & 0xffffffff; // 0x12ad
            printf("BB: %d", 2);
            int64_t v31 = 298 % v12 - v4; // 0x12dc
            uint32_t v32 = (int32_t)v4;
            int64_t v33 = 298 / v32 % v32;
            int64_t v34 = v33; // 0x12f7
            int64_t v35 = v30; // 0x12f7
            while ((int32_t)v31 > 685) {
                // 0x12c0
                printf("BB: %d", 2);
                v31 = 298 % v35 - v34;
                v32 = (int32_t)v34;
                v33 = 298 / v32 % v32;
                v34 = v33;
                v35 = v30;
            }
            int64_t v36 = v31 & 0xffffffff; // 0x12dc
            v29 = 0x100000000 * v1 >> 32;
            v28 = (0x100000000 * (int64_t)((int32_t)v1 >> 31) | v25) % v36 + v33;
            v26 = v30;
            v27 = v36;
        }
        int64_t v37 = v27;
        printf("BB: %d", 3);
        if (v37 != 298) {
            // 0x138a
            v13 = v26;
            v14 = v37;
            v15 = (v26 ^ 0xffffffff) + v37;
        } else {
            int64_t v38 = (v28 & 0xffffffff) + v26; // 0x1334
            int64_t v39 = 298 * ((0x100000000 * (int64_t)((int32_t)v38 >> 31) | v38 & 0xffffffff) % (v29 & 0xffffffff)); // 0x133c
            int64_t v40 = ((0x100000000 * (int64_t)((int32_t)v39 >> 31) | v39 & 0xfffffffe) % v37 & 0xffffffff) + v37; // 0x1352
            int64_t v41 = 1 - v29 + v26 + v40; // 0x135e
            printf("BB: %d", 4);
            while ((int32_t)v41 == 298) {
                // 0x1370
                printf("BB: %d", 4);
            }
            // 0x1393
            v13 = v26;
            v14 = v41 & 0xffffffff;
            v15 = v40;
        }
    }
    int64_t v42 = v15 & 0xffffffff;
    printf("BB: %d", 9);
    int64_t v43 = v13 + 298;
    int64_t v44 = v42 - v14 ^ v42; // 0x13be
    printf("BB: %d", 10);
    return ((0x100000000 * (int64_t)((int32_t)v44 >> 31) | v44 & 0xffffffff) / ((v43 | 1) + v15 & 0xffffffff) + v43 | v43) & 0xffffffff ^ 298;
}
