int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_3(); // 0x1157
    int64_t v2 = f_rand_0(a1, a2); // 0x115f
    uint64_t v3 = v2 & 0xffffffff; // 0x1164
    f_rand_2();
    int64_t v4 = f_rand_4(); // 0x116c
    int64_t v5 = v4 & 0xffffffff; // 0x1171
    int64_t v6 = f_rand_1(); // 0x1174
    int64_t v7 = v6 & 0xffffffff; // 0x1179
    printf("BB: %d", 0);
    uint64_t v8 = v5 ^ 0xffffffff; // 0x118e
    int64_t v9 = v8 + v1; // 0x1190
    int64_t v10 = v9 ^ v1;
    int64_t v11 = v10 & 0xffffffff; // 0x1197
    int64_t v12; // 0x114c
    int64_t v13; // 0x114c
    int64_t v14; // 0x114c
    if ((int32_t)v9 == 0) {
        uint64_t v15 = v1 & 0xffffffff; // 0x115c
        printf("BB: %d", 8);
        int64_t v16; // 0x114c
        int64_t v17; // 0x114c
        int64_t v18; // 0x114c
        if (v15 > v3) {
            // 0x1217
            printf("BB: %d", 10);
            int64_t v19 = v7 ^ v15;
            v16 = v11;
            v17 = (0x100000000 * (int64_t)((int32_t)v19 >> 31) | v19) % (v15 ^ 0xffffffff) & 0xffffffff;
            v18 = v5;
        } else {
            // 0x1311
            printf("BB: %d", 9);
            int64_t v20 = v11 ^ 0xffffffff; // 0x131d
            int64_t v21 = v2 - v20 & v15; // 0x1323
            v16 = v20;
            v17 = v21;
            v18 = (0x100000000 * ((v21 ^ 0xffffffff) + v20) >> 32) * (0x100000000 * v6 >> 32) & 0xffffffff;
        }
        int64_t v22 = v17;
        printf("BB: %d", 11);
        v14 = v18 + v22 ^ v22;
        v12 = v16;
        v13 = v18;
    } else {
        // 0x11a5
        printf("BB: %d", 1);
        int64_t v23; // 0x114c
        int64_t v24; // 0x114c
        int64_t v25; // 0x114c
        int64_t v26; // 0x114c
        if (v3 < v8) {
            // 0x11c1
            printf("BB: %d", 2);
            int64_t v27 = v7 | v5;
            v26 = (0x100000000 * ((v27 | v2) + v10) >> 32) * (0x100000000 * v2 >> 32);
            v25 = ((0x100000000 * v10 >> 32) * (0x100000000 * ((v6 ^ v4) - v1) >> 32) ^ v8 | v7) + (v10 & v7);
            v23 = v27;
            v24 = v3;
        } else {
            // 0x1237
            printf("BB: %d", 3);
            int64_t v28 = (0x100000000 * v10 >> 32) * (0x100000000 * v1 >> 32) & v8;
            int64_t v29 = (0x100000000 * (int64_t)((int32_t)v28 >> 31) | v28) % v11; // 0x124e
            int64_t v30 = (0x100000000 * v6 >> 32) * (0x100000000 * v2 >> 32) + v8; // 0x1259
            v26 = v30;
            v25 = v29;
            v23 = v5;
            v24 = ((v29 | v30) ^ v4) & 0xffffffff;
        }
        int64_t v31 = v23;
        int64_t v32 = v26 & 0xffffffff;
        printf("BB: %d", 4);
        int64_t v33 = v32; // 0x128a
        int64_t v34 = v25; // 0x128a
        if ((int32_t)v25 >= 350) {
            int64_t v35 = 0x100000000 * v31 >> 32;
            int64_t v36 = v32;
            printf("BB: %d", 5);
            int64_t v37 = (0x100000000 * (int64_t)((int32_t)v36 >> 31) | v36) / v11 ^ v24;
            int64_t v38 = v37 & 0xffffffff; // 0x12b5
            int64_t v39 = (v7 ^ 0xffffffff ^ (v37 | (v24 ^ 0xffffffff) & v11)) - v31; // 0x12c2
            int64_t v40 = (0x100000000 * ((0x100000000 * (int64_t)((int32_t)v39 >> 31) | v39 & 0xffffffff) % v31) >> 32) * v35 ^ v31;
            v33 = v38;
            v34 = v40;
            while ((int32_t)v40 > 349) {
                // 0x129a
                v36 = v38;
                printf("BB: %d", 5);
                v37 = (0x100000000 * (int64_t)((int32_t)v36 >> 31) | v36) / v11 ^ v24;
                v38 = v37 & 0xffffffff;
                v39 = (v7 ^ 0xffffffff ^ (v37 | (v24 ^ 0xffffffff) & v11)) - v31;
                v40 = (0x100000000 * ((0x100000000 * (int64_t)((int32_t)v39 >> 31) | v39 & 0xffffffff) % v31) >> 32) * v35 ^ v31;
                v33 = v38;
                v34 = v40;
            }
        }
        // 0x12da
        printf("BB: %d", 6);
        v14 = v34;
        v12 = v11;
        v13 = v31;
        if ((int32_t)v33 >= 753) {
            while (true) {
                // 0x1300
                printf("BB: %d", 7);
            }
        }
    }
    int64_t v41 = v13;
    printf("BB: %d", 12);
    int64_t v42 = (-((v14 & 0xffffffff)) | 1) - v12; // 0x1368
    printf("BB: %d", 13);
    return ((0x100000000 * (int64_t)((int32_t)v42 >> 31) | v42 & 0xffffffff) % (v12 & 0xffffffff) + v41 | v41) & 0xffffffff;
}
