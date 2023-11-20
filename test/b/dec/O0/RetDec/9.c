int64_t func0(int64_t a1, int64_t a2) {
    int32_t v1 = f_rand_0(a1, a2); // 0x1164
    int64_t v2 = f_rand_1(); // 0x1167
    uint32_t v3 = (int32_t)v2; // 0x116c
    int32_t v4 = f_rand_2(); // 0x1174
    printf("BB: %d", 0);
    int32_t v5 = 78; // 0x119a
    int32_t v6 = v1; // 0x119a
    int32_t v7 = v4; // 0x119a
    if (v4 == 547) {
        int32_t v8 = -1 - v3;
        int64_t v9 = v2 & 0xffffffff;
        int64_t v10 = 0x100000000 * (int64_t)(v3 / 0x80000000) | v9;
        int64_t v11 = v2 + 0xffffffff & 0xffffffff;
        int32_t v12 = -v3;
        int32_t v13 = 78;
        uint32_t v14 = 78;
        printf("BB: %d", 1);
        int32_t v15 = v1; // 0x11b9
        int32_t v16 = v4; // 0x11b9
        int32_t v17 = v14; // 0x11b9
        int32_t v18; // 0x11e4
        if (v14 >= v3) {
            printf("BB: %d", 2);
            while (v8 >= v3) {
                // 0x11bf
                printf("BB: %d", 2);
            }
            // 0x11b3
            v18 = (v13 ^ v14) + v14;
            v15 = v13 & (int32_t)((0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / (int64_t)v14 | v2) ^ v8;
            v16 = -1 - v13;
            v17 = v8;
        }
        int32_t v19 = v16;
        printf("BB: %d", 3);
        int64_t v20 = v10 / (int64_t)v17; // 0x122b
        int32_t v21 = v13; // 0x1254
        int32_t v22 = v15; // 0x1254
        int64_t v23 = (0x100000000 * (int64_t)((int32_t)v20 >> 31) | v20 & 0xffffffff) / (int64_t)v19; // 0x1254
        int32_t v24; // 0x1285
        int32_t v25; // 0x129e
        if (v3 >= 287) {
            // 0x125a
            printf("BB: %d", 4);
            v24 = v19 ^ v3;
            v25 = v19 * v12;
            v21 = (0x100000000 * (int64_t)(v24 >> 31) | (int64_t)v24) / v11;
            v22 = v12;
            v23 = (0x100000000 * (int64_t)(v25 >> 31) | (int64_t)v25) % v9;
        }
        int32_t v26 = v22;
        int32_t v27 = v21;
        int32_t v28 = v19; // 0x119a
        v5 = v27;
        v6 = v26;
        v7 = v19;
        while (v19 == 547) {
            // 0x11a0
            v13 = v27;
            v14 = (int32_t)v23;
            printf("BB: %d", 1);
            v15 = v26;
            v16 = v28;
            v17 = v14;
            if (v14 >= v3) {
                printf("BB: %d", 2);
                while (v8 >= v3) {
                    // 0x11bf
                    printf("BB: %d", 2);
                }
                // 0x11b3
                v18 = (v13 ^ v14) + v14;
                v15 = v13 & (int32_t)((0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / (int64_t)v14 | v2) ^ v8;
                v16 = -1 - v13;
                v17 = v8;
            }
            // 0x1214
            v19 = v16;
            printf("BB: %d", 3);
            v20 = v10 / (int64_t)v17;
            v21 = v13;
            v22 = v15;
            v23 = (0x100000000 * (int64_t)((int32_t)v20 >> 31) | v20 & 0xffffffff) / (int64_t)v19;
            if (v3 >= 287) {
                // 0x125a
                printf("BB: %d", 4);
                v24 = v19 ^ v3;
                v25 = v19 * v12;
                v21 = (0x100000000 * (int64_t)(v24 >> 31) | (int64_t)v24) / v11;
                v22 = v12;
                v23 = (0x100000000 * (int64_t)(v25 >> 31) | (int64_t)v25) % v9;
            }
            // 0x12a9
            v26 = v22;
            v27 = v21;
            v28 = v19;
            v5 = v27;
            v6 = v26;
            v7 = v19;
        }
    }
    // 0x12ae
    printf("BB: %d", 5);
    int32_t v29 = -1 - v6;
    int32_t v30; // 0x1150
    if (v7 == v29) {
        // 0x149e
        v30 = v6;
        printf("BB: %d", 12);
        return (0x100000000 * (int64_t)(v30 >> 31) | (int64_t)v30) / (int64_t)v5 & 0xffffffff;
    }
    // 0x12e2
    printf("BB: %d", 6);
    int32_t v31 = v6; // 0x131e
    if (v6 >= v3) {
        // 0x1324
        printf("BB: %d", 7);
        v31 = v5 + 1 + v6 + v7;
    }
    int32_t v32 = v5 ^ v3; // 0x12f8
    int64_t v33 = v6; // 0x12fc
    int32_t v34 = -1 * v5 * (int32_t)((0x100000000 * (int64_t)(v32 >> 31) | (int64_t)v32) % v33) | v29; // 0x1305
    printf("BB: %d", 8);
    if (v7 < (int32_t)((0x100000000 * (int64_t)(v34 >> 31) | (int64_t)v34) % v33)) {
        // 0x13a5
        printf("BB: %d", 9);
    } else {
        // 0x1406
        printf("BB: %d", 10);
    }
    // 0x1477
    printf("BB: %d", 11);
    // 0x149e
    v30 = v31;
    printf("BB: %d", 12);
    return (0x100000000 * (int64_t)(v30 >> 31) | (int64_t)v30) / (int64_t)v5 & 0xffffffff;
}
