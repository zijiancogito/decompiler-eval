int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2); // 0x1158
    int32_t v2 = v1; // 0x115d
    int32_t v3 = f_rand_4(); // 0x116c
    int32_t v4 = f_rand_2(); // 0x1174
    int64_t v5 = f_rand_1(); // 0x1177
    int32_t v6 = v5; // 0x117c
    int64_t v7 = f_rand_3(); // 0x117f
    int32_t v8 = v7; // 0x1184
    printf("BB: %d", 0);
    int64_t v9 = 0x100000000 * (int64_t)(v8 >> 31) | v7 & 0xffffffff; // 0x119b
    int32_t v10 = (int32_t)(v9 % 298) + 298; // 0x119e
    int32_t v11; // 0x1150
    int32_t v12; // 0x1150
    int32_t v13; // 0x1150
    if (v10 < v3) {
        // 0x12d6
        printf("BB: %d", 5);
        if (v8 < v4) {
            while (true) {
                // 0x12f5
                printf("BB: %d", 6);
            }
        }
        // 0x1350
        printf("BB: %d", 7);
        v11 = v10 * v8 & v2;
        v12 = v6;
        v13 = v10;
        if (v6 >= 407) {
            int32_t v14 = v10 ^ v6;
            uint32_t v15 = v14 * v2 ^ v8; // 0x137a
            int32_t v16 = v9 / (int64_t)v15 | v7; // 0x1387
            int32_t v17 = v15 * v15;
            printf("BB: %d", 8);
            while (v17 >= 407) {
                // 0x139a
                printf("BB: %d", 8);
            }
            // 0x138d
            v11 = v15 | -1 - v14 * v16;
            v12 = v17;
            v13 = v10;
        }
    } else {
        // 0x11b0
        printf("BB: %d", 1);
        int64_t v18; // 0x1150
        int64_t v19; // 0x1150
        int32_t v20; // 0x1150
        int32_t v21; // 0x1150
        int32_t v22; // 0x1150
        if (v6 < 686) {
            // 0x11b0
            v18 = v5 & 0xffffffff;
            v19 = v1 & 0xffffffff;
            v20 = v6;
            v21 = v8 + v4 + (v10 ^ v8);
            v22 = v10;
        } else {
            int32_t v23 = (v3 + v2) * v3;
            uint32_t v24 = v4;
            printf("BB: %d", 2);
            int32_t v25 = 298 % v10 - v24; // 0x11f9
            int32_t v26 = 298 / v24 % v24;
            int32_t v27 = v23; // 0x11d9
            while (v25 >= 686) {
                // 0x11df
                v24 = v26;
                printf("BB: %d", 2);
                v25 = 298 % v27 - v24;
                v26 = 298 / v24 % v24;
                v27 = v23;
            }
            int64_t v28 = v1 & 0xffffffff;
            int64_t v29 = v25;
            v18 = v29;
            v19 = v28;
            v20 = v25;
            v21 = v26 + (int32_t)((0x100000000 * (int64_t)(v2 >> 31) | v28) % v29);
            v22 = v23;
        }
        // 0x1238
        printf("BB: %d", 3);
        v11 = v20 + -1 - v22;
        v12 = v20;
        v13 = v22;
        if (v20 == 298) {
            int32_t v30 = v22 + v21; // 0x124e
            int32_t v31 = 298 * (int32_t)((0x100000000 * (int64_t)(v30 >> 31) | (int64_t)v30) % v19); // 0x1257
            int32_t v32 = v20 + (int32_t)((0x100000000 * (int64_t)(v31 >> 31) | (int64_t)v31) % v18); // 0x125f
            int32_t v33 = 1 - v2 + v22 + v32;
            printf("BB: %d", 4);
            int32_t v34 = v21 * v32; // 0x1293
            int32_t v35 = (0x100000000 * (int64_t)(v34 >> 31) | (int64_t)v34) / (int64_t)v21;
            int32_t v36 = v22 + v35; // 0x12c2
            int32_t v37 = (0x100000000 * (int64_t)(v36 >> 31) | (int64_t)v36) / v19; // 0x1277
            v11 = v35;
            v12 = v33;
            v13 = v22;
            while (v33 == 298) {
                // 0x127d
                printf("BB: %d", 4);
                v34 = v37 * v32;
                v35 = (0x100000000 * (int64_t)(v34 >> 31) | (int64_t)v34) / (int64_t)v37;
                v36 = v22 + v35;
                v37 = (0x100000000 * (int64_t)(v36 >> 31) | (int64_t)v36) / v19;
                v11 = v35;
                v12 = v33;
                v13 = v22;
            }
        }
    }
    int32_t v38 = v11;
    printf("BB: %d", 9);
    int32_t v39 = v13 + 298; // 0x1416
    int64_t v40 = v39; // 0x1420
    int32_t v41 = v38 - v12 ^ v38; // 0x1432
    printf("BB: %d", 10);
    return (v39 + (int32_t)((0x100000000 * (int64_t)(v41 >> 31) | (int64_t)v41) / (int64_t)((v39 | (int32_t)((0x100000000 * (int64_t)(v39 >> 31) | v40) / v40)) + v38)) | v39) ^ 298;
}
