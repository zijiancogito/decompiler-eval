int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_0(a1, a2) & 0xffffffff; // 0x115f
    int64_t v2 = f_rand_1(); // 0x1162
    uint64_t v3 = v2 & 0xffffffff; // 0x1167
    int64_t v4 = f_rand_2(); // 0x1169
    printf("BB: %d", 0);
    int64_t v5; // 0x114c
    int64_t v6; // 0x114c
    int32_t v7; // 0x114c
    if ((int32_t)v4 != 547) {
        // 0x126f
        v7 = 78;
        v5 = v4 & 0xffffffff;
        v6 = v1;
    } else {
        int64_t v8 = v3 ^ 0xffffffff; // 0x1191
        int32_t v9 = v2; // 0x1194
        uint32_t v10 = -v9; // 0x1196
        int64_t v11 = v2 + 0xffffffff & 0xffffffff;
        int64_t v12 = 78;
        int32_t v13 = 78;
        printf("BB: %d", 1);
        int64_t v14 = 547; // 0x11d0
        int64_t v15 = v12; // 0x11d0
        int64_t v16 = v1; // 0x11d0
        int32_t v17; // 0x11e6
        int32_t v18; // 0x11ef
        if (v12 >= v3) {
            printf("BB: %d", 2);
            while (v3 <= v8) {
                // 0x11d2
                printf("BB: %d", 2);
            }
            // 0x11e6
            v17 = v12;
            v18 = (v13 ^ v17) + v17;
            v14 = -1 - v13;
            v15 = v8;
            v16 = v13 & (int32_t)((0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / v12 | v2) ^ (int32_t)v8;
        }
        int64_t v19 = v14;
        printf("BB: %d", 3);
        int64_t v20; // 0x114c
        int32_t v21; // 0x114c
        int64_t v22; // 0x114c
        int64_t v23; // 0x121d
        int64_t v24; // 0x114c
        int32_t v25; // 0x1251
        if (v9 < 287) {
            // 0x125d
            v23 = (0x100000000 * (int64_t)(v9 >> 31) | v3) / (v15 & 0xffffffff);
            v21 = v13;
            v20 = v16;
            v22 = (0x100000000 * (int64_t)((int32_t)v23 >> 31) | v23 & 0xffffffff) / v19 & 0xffffffff;
        } else {
            // 0x122c
            printf("BB: %d", 4);
            v24 = v19 ^ v3;
            v25 = (int32_t)v19 * v10;
            v21 = (0x100000000 * (int64_t)((int32_t)v24 >> 31) | v24) / v11;
            v20 = v10;
            v22 = (0x100000000 * (int64_t)(v25 >> 31) | (int64_t)v25) % v3;
        }
        int64_t v26 = v20;
        int32_t v27 = v21;
        v7 = v27;
        v5 = v19;
        v6 = v26;
        while (v19 == 547) {
            // 0x11b8
            v12 = v22 & 0xffffffff;
            v13 = v27;
            printf("BB: %d", 1);
            v14 = 547;
            v15 = v12;
            v16 = v26;
            if (v12 >= v3) {
                printf("BB: %d", 2);
                while (v3 <= v8) {
                    // 0x11d2
                    printf("BB: %d", 2);
                }
                // 0x11e6
                v17 = v12;
                v18 = (v13 ^ v17) + v17;
                v14 = -1 - v13;
                v15 = v8;
                v16 = v13 & (int32_t)((0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / v12 | v2) ^ (int32_t)v8;
            }
            // 0x120b
            v19 = v14;
            printf("BB: %d", 3);
            if (v9 < 287) {
                // 0x125d
                v23 = (0x100000000 * (int64_t)(v9 >> 31) | v3) / (v15 & 0xffffffff);
                v21 = v13;
                v20 = v16;
                v22 = (0x100000000 * (int64_t)((int32_t)v23 >> 31) | v23 & 0xffffffff) / v19 & 0xffffffff;
            } else {
                // 0x122c
                printf("BB: %d", 4);
                v24 = v19 ^ v3;
                v25 = (int32_t)v19 * v10;
                v21 = (0x100000000 * (int64_t)((int32_t)v24 >> 31) | v24) / v11;
                v20 = v10;
                v22 = (0x100000000 * (int64_t)(v25 >> 31) | (int64_t)v25) % v3;
            }
            // 0x1260
            v26 = v20;
            v27 = v21;
            v7 = v27;
            v5 = v19;
            v6 = v26;
        }
    }
    // 0x1277
    printf("BB: %d", 5);
    int64_t v28 = v6 & 0xffffffff;
    int32_t v29 = v5; // 0x128f
    int32_t v30 = v6;
    int32_t v31 = -1 - v30;
    if (v29 == v31) {
        // 0x132e
        printf("BB: %d", 12);
        return (0x100000000 * (int64_t)(v30 >> 31) | v28) / (int64_t)v7 & 0xffffffff;
    }
    // 0x129e
    printf("BB: %d", 6);
    int64_t v32 = v7; // 0x12b1
    int64_t v33 = v28; // 0x12d2
    int32_t v34 = v30; // 0x12d2
    if (v3 <= v6) {
        // 0x12d4
        printf("BB: %d", 7);
        int64_t v35 = v5 + 1 + v32 + v6; // 0x12ed
        v33 = v35 & 0xffffffff;
        v34 = v35;
    }
    int32_t v36 = v7 ^ (int32_t)v2; // 0x12b9
    int32_t v37 = -1 * v7 * (int32_t)((0x100000000 * (int64_t)(v36 >> 31) | (int64_t)v36) % v28) | v31; // 0x12c5
    int64_t v38 = (0x100000000 * (int64_t)(v37 >> 31) | (int64_t)v37) % v28; // 0x12ca
    printf("BB: %d", 8);
    int32_t v39 = v38; // 0x1308
    int32_t v40 = v39 - v29; // 0x1308
    int64_t v41 = v40 < 0 == ((v40 ^ v39) & (int32_t)(v38 ^ v5)) < 0 == (v40 != 0) ? 9 : 10; // 0x1313
    printf("BB: %d", v41);
    printf("BB: %d", 11);
    // 0x132e
    printf("BB: %d", 12);
    return (0x100000000 * (int64_t)(v34 >> 31) | v33) / v32 & 0xffffffff;
}
