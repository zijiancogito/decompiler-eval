int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_3(); // 0x115e
    int64_t v2 = f_rand_0(a1, a2); // 0x1166
    uint64_t v3 = v2 & 0xffffffff; // 0x116b
    f_rand_2();
    int64_t v4 = f_rand_4(); // 0x1173
    int64_t v5 = v4 & 0xffffffff; // 0x1178
    int64_t v6 = f_rand_1(); // 0x117b
    int64_t v7 = v6 & 0xffffffff; // 0x1180
    printf("BB: %d", 0);
    uint64_t v8 = v5 ^ 0xffffffff; // 0x1195
    int64_t v9 = v8 + v1; // 0x1197
    int64_t v10 = v9 ^ v1;
    int64_t v11 = v10 & 0xffffffff; // 0x119e
    int64_t v12; // 0x1150
    int64_t v13; // 0x1150
    int64_t v14; // 0x1150
    if ((int32_t)v9 == 0) {
        uint64_t v15 = v1 & 0xffffffff; // 0x1163
        printf("BB: %d", 8);
        int64_t v16; // 0x1150
        int64_t v17; // 0x1150
        int64_t v18; // 0x1150
        if (v15 > v3) {
            // 0x121b
            printf("BB: %d", 10);
            int64_t v19 = v7 ^ v15;
            v16 = v11;
            v17 = v5;
            v18 = (0x100000000 * (int64_t)((int32_t)v19 >> 31) | v19) % (v15 ^ 0xffffffff) & 0xffffffff;
        } else {
            // 0x1355
            printf("BB: %d", 9);
            int64_t v20 = v11 ^ 0xffffffff; // 0x1361
            int64_t v21 = v2 - v20 & v15; // 0x1367
            v16 = v20;
            v17 = (0x100000000 * ((v21 ^ 0xffffffff) + v20) >> 32) * (0x100000000 * v6 >> 32) & 0xffffffff;
            v18 = v21;
        }
        int64_t v22 = v18;
        printf("BB: %d", 11);
        v14 = (v22 + v17 ^ v22) & 0xffffffff;
        v12 = v16;
        v13 = v17;
    } else {
        // 0x11ac
        printf("BB: %d", 1);
        int64_t v23; // 0x1150
        int64_t v24; // 0x1150
        int64_t v25; // 0x1150
        int64_t v26; // 0x1150
        if (v3 < v8) {
            // 0x11c8
            printf("BB: %d", 2);
            int64_t v27 = v7 | v5;
            v26 = (0x100000000 * ((v27 | v2) + v10) >> 32) * (0x100000000 * v2 >> 32);
            v25 = ((0x100000000 * v10 >> 32) * (0x100000000 * ((v6 ^ v4) - v1) >> 32) ^ v8 | v7) + (v10 & v7);
            v23 = v27;
            v24 = v3;
        } else {
            // 0x123b
            printf("BB: %d", 3);
            int64_t v28 = (0x100000000 * v10 >> 32) * (0x100000000 * v1 >> 32) & v8;
            int64_t v29 = (0x100000000 * (int64_t)((int32_t)v28 >> 31) | v28) % v11; // 0x1252
            int64_t v30 = (0x100000000 * v6 >> 32) * (0x100000000 * v2 >> 32) + v8; // 0x125d
            v26 = v30;
            v25 = v29;
            v23 = v5;
            v24 = ((v29 | v30) ^ v4) & 0xffffffff;
        }
        int64_t v31 = v26 & 0xffffffff;
        printf("BB: %d", 4);
        int64_t v32; // 0x1150
        int64_t v33; // 0x1150
        int64_t v34; // 0x1150
        if ((int32_t)v25 < 350) {
            // 0x126e
            v34 = 0x100000000 * v23;
            v33 = v31;
            v32 = v25;
        } else {
            int32_t v35 = -1 - (int32_t)v24 & (int32_t)v10; // 0x12a3
            int64_t v36 = 0x100000000 * v23;
            int64_t v37 = v36 >> 32; // 0x12ab
            int64_t v38 = v37 & 0xffffffff;
            int64_t v39 = v31;
            printf("BB: %d", 5);
            int64_t v40 = (0x100000000 * (int64_t)((int32_t)v39 >> 31) | v39) / v11 ^ v24;
            int64_t v41 = v40 & 0xffffffff; // 0x12cb
            int32_t v42 = ((v35 | (int32_t)v40) ^ -1 - (int32_t)v6) - (int32_t)v37; // 0x12d9
            int64_t v43 = (0x100000000 * ((0x100000000 * (int64_t)(v42 >> 31) | (int64_t)v42) % v38) >> 32) * v37 ^ v37;
            v34 = v36;
            v33 = v41;
            v32 = v43;
            while ((int32_t)v43 > 349) {
                // 0x12b0
                v39 = v41;
                printf("BB: %d", 5);
                v40 = (0x100000000 * (int64_t)((int32_t)v39 >> 31) | v39) / v11 ^ v24;
                v41 = v40 & 0xffffffff;
                v42 = ((v35 | (int32_t)v40) ^ -1 - (int32_t)v6) - (int32_t)v37;
                v43 = (0x100000000 * ((0x100000000 * (int64_t)(v42 >> 31) | (int64_t)v42) % v38) >> 32) * v37 ^ v37;
                v34 = v36;
                v33 = v41;
                v32 = v43;
            }
        }
        int64_t v44 = v32 & 0xffffffff;
        printf("BB: %d", 6);
        int32_t v45 = v33; // 0x1304
        if (v45 < 753) {
            // 0x1349
            v14 = v44;
            v12 = v11;
            v13 = v34 >> 32;
        } else {
            int64_t v46 = 1;
            printf("BB: %d", 7);
            while (v46 != 0) {
                // 0x1330
                v46 = v45 < 753 == (752 - v45 & v45) < 0;
                printf("BB: %d", 7);
            }
            // 0x1391
            v14 = v44;
            v12 = v11;
            v13 = v34 >> 32;
        }
    }
    int64_t v47 = v13;
    printf("BB: %d", 12);
    int64_t v48 = (-v14 | 1) - v12; // 0x13ac
    printf("BB: %d", 13);
    return ((0x100000000 * (int64_t)((int32_t)v48 >> 31) | v48 & 0xffffffff) % (v12 & 0xffffffff) + v47 | v47) & 0xffffffff;
}
