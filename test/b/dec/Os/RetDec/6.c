int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x1157
    int64_t v2 = v1 & 0xffffffff; // 0x115c
    int64_t v3 = f_rand_4(); // 0x115f
    int64_t v4 = f_rand_2() & 0xffffffff; // 0x116c
    int64_t v5 = f_rand_1(); // 0x116e
    int64_t v6 = v5 & 0xffffffff; // 0x1173
    int64_t v7 = f_rand_3(); // 0x1175
    uint64_t v8 = v7 & 0xffffffff; // 0x117a
    printf("BB: %d", 0);
    int64_t v9 = 0x100000000 * v7 >> 32; // 0x118d
    int64_t v10 = 0xdbeb61f * v9;
    int64_t v11 = v7 + 298 + -298 * ((v10 >> 36) + (v10 >> 63)); // 0x11b5
    int64_t v12 = v11 & 0xffffffff; // 0x11b5
    int64_t v13; // 0x114c
    int64_t v14; // 0x114c
    int64_t v15; // 0x114c
    if (v12 < (v3 & 0xffffffff)) {
        // 0x11c4
        printf("BB: %d", 5);
        if (v8 < v4) {
            while (true) {
                // 0x11e0
                printf("BB: %d", 6);
            }
        }
        // 0x1264
        printf("BB: %d", 7);
        if ((int32_t)v5 < 407) {
            // 0x134c
            v15 = v6;
            v13 = v12;
            v14 = (0x100000000 * v11 >> 32) * v9 & v2;
        } else {
            int64_t v16 = 0x100000000 * (v11 ^ v5) >> 32; // 0x1283
            int64_t v17 = v16 * (0x100000000 * v1 >> 32) ^ v7;
            int64_t v18 = v17 & 0xffffffff; // 0x1287
            int64_t v19 = 0x100000000 * (int64_t)((int32_t)v7 >> 31) | v8; // 0x128e
            int64_t v20 = 0x100000000 * v17 >> 32; // 0x12a6
            int64_t v21 = v20 * v20; // 0x12a6
            printf("BB: %d", 8);
            while ((int32_t)v21 >= 407) {
                // 0x12b1
                printf("BB: %d", 8);
            }
            // 0x12c8
            v15 = v21 & 0xffffffff;
            v13 = v12;
            v14 = (0x100000000 * (v19 / v18 | v7) >> 32) * v16 ^ 0xffffffff | v18;
        }
    } else {
        // 0x11f1
        printf("BB: %d", 1);
        int64_t v22; // 0x114c
        int64_t v23; // 0x114c
        int64_t v24; // 0x114c
        int64_t v25; // 0x114c
        if ((int32_t)v5 < 686) {
            // 0x12d7
            v25 = v6;
            v24 = v8 + v4 + (v12 ^ v8);
            v22 = v12;
            v23 = v2;
        } else {
            int64_t v26 = (0x100000000 * (v3 + v1) >> 32) * (0x100000000 * v3 >> 32) & 0xffffffff; // 0x1210
            printf("BB: %d", 2);
            int64_t v27 = 298 % v12 - v4; // 0x1236
            uint32_t v28 = (int32_t)v4;
            int64_t v29 = 298 / v28 % v28;
            int64_t v30 = v29; // 0x124f
            int64_t v31 = v26; // 0x124f
            while ((int32_t)v27 > 685) {
                // 0x121b
                printf("BB: %d", 2);
                v27 = 298 % v31 - v30;
                v28 = (int32_t)v30;
                v29 = 298 / v28 % v28;
                v30 = v29;
                v31 = v26;
            }
            int64_t v32 = v27 & 0xffffffff; // 0x1236
            v25 = v32;
            v24 = (0x100000000 * (int64_t)((int32_t)v1 >> 31) | v2) % v32 + v29;
            v22 = v26;
            v23 = 0x100000000 * v1 >> 32;
        }
        int64_t v33 = v25;
        printf("BB: %d", 3);
        if (v33 != 298) {
            // 0x1341
            v15 = v33;
            v13 = v22;
            v14 = (v22 ^ 0xffffffff) + v33;
        } else {
            int64_t v34 = (v24 & 0xffffffff) + v22; // 0x12f5
            int64_t v35 = 298 * ((0x100000000 * (int64_t)((int32_t)v34 >> 31) | v34 & 0xffffffff) % (v23 & 0xffffffff)); // 0x12fe
            int64_t v36 = ((0x100000000 * (int64_t)((int32_t)v35 >> 31) | v35 & 0xfffffffe) % v33 & 0xffffffff) + v33; // 0x1312
            int64_t v37 = v22 + 1 - v23 + v36; // 0x131f
            printf("BB: %d", 4);
            while ((int32_t)v37 == 298) {
                // 0x1328
                printf("BB: %d", 4);
            }
            // 0x1353
            v15 = v37 & 0xffffffff;
            v13 = v22;
            v14 = v36;
        }
    }
    int64_t v38 = v14 & 0xffffffff;
    printf("BB: %d", 9);
    int64_t v39 = v13 + 298;
    int64_t v40 = v38 - v15 ^ v38; // 0x1380
    printf("BB: %d", 10);
    return ((0x100000000 * (int64_t)((int32_t)v40 >> 31) | v40 & 0xffffffff) / ((v39 | 1) + v14 & 0xffffffff) + v39 | v39) & 0xffffffff ^ 298;
}
