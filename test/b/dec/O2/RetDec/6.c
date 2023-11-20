int64_t func0(int64_t a1, int64_t a2, int64_t a3) {
    int64_t v1 = f_rand_0(a1, a2); // 0x115b
    int64_t v2 = f_rand_4(); // 0x1164
    int64_t v3 = f_rand_2(); // 0x116c
    uint64_t v4 = v3 & 0xffffffff; // 0x1171
    int64_t v5 = f_rand_1(); // 0x1173
    int64_t v6 = v5 & 0xffffffff; // 0x1178
    int64_t v7 = f_rand_3(); // 0x117a
    uint64_t v8 = v7 & 0xffffffff; // 0x117f
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
            // 0x11dd
            printf("BB: %d", 6);
            while (true) {
                // 0x1200
                printf("BB: %d", 6);
            }
        }
        // 0x12ba
        printf("BB: %d", 7);
        if ((int32_t)v5 < 407) {
            // 0x13c4
            v15 = v6;
            v13 = v12;
            v14 = (0x100000000 * v11 >> 32) * v9 & 0x100000000 * v1 >> 32;
        } else {
            int64_t v16 = v12 ^ v6;
            int64_t v17 = v16 * v1 ^ v7; // 0x12de
            int64_t v18 = v17 & 0xffffffff; // 0x12de
            int64_t v19 = 0x100000000 * (int64_t)((int32_t)v7 >> 31) | v8; // 0x12e5
            int64_t v20 = 0x100000000 * v17 >> 32; // 0x12fd
            int64_t v21 = v20 * v20; // 0x12fd
            printf("BB: %d", 8);
            while ((int32_t)v21 >= 407) {
                // 0x1310
                printf("BB: %d", 8);
            }
            // 0x1327
            v15 = v21 & 0xffffffff;
            v13 = v12;
            v14 = (0x100000000 * (v19 / v18 | v7) >> 32) * (0x100000000 * v16 >> 32) ^ 0xffffffff | v18;
        }
    } else {
        // 0x1211
        printf("BB: %d", 1);
        int64_t v22; // 0x1150
        int64_t v23; // 0x1150
        int64_t v24; // 0x1150
        if ((int32_t)v5 < 686) {
            // 0x133c
            v24 = v6;
            v23 = v8 + v4 + (v12 ^ v8);
            v22 = v12;
        } else {
            int64_t v25 = (v2 + v1) * v2; // 0x1231
            printf("BB: %d", 2);
            int64_t v26 = (int64_t)(298 % (int16_t)v11) - v4; // 0x1255
            uint32_t v27 = (int32_t)v3;
            uint32_t v28 = 298 / v27 % v27;
            int64_t v29 = v28;
            int64_t v30 = v26; // 0x126c
            int64_t v31 = v29; // 0x126c
            if ((int32_t)v26 >= 686) {
                // 0x126e
                printf("BB: %d", 2);
                uint16_t v32 = (int16_t)v28; // 0x1287
                v30 = (int64_t)(298 % (int32_t)v25) - v29;
                v31 = 298 / v32 % v32;
            }
            int64_t v33 = v30 & 0xffffffff;
            v24 = v33;
            v23 = (0x100000000 * (int64_t)((int32_t)v1 >> 31) | v1 & 0xffffffff) % v33 + v31;
            v22 = v25 & 0xffffffff;
        }
        int64_t v34 = v24;
        printf("BB: %d", 3);
        if (v34 != 298) {
            // 0x13b9
            v15 = v34;
            v13 = v22;
            v14 = (v22 ^ 0xffffffff) + v34;
        } else {
            int64_t v35 = 0x100000000 * v1 >> 32;
            int64_t v36 = (v23 & 0xffffffff) + v22; // 0x1361
            int64_t v37 = 298 * ((0x100000000 * (int64_t)((int32_t)v36 >> 31) | v36 & 0xffffffff) % (v35 & 0xffffffff)); // 0x136a
            int64_t v38 = ((0x100000000 * (int64_t)((int32_t)v37 >> 31) | v37 & 0xfffffffe) % v34 & 0xffffffff) + v34; // 0x137e
            int64_t v39 = 1 - v35 + v22 + v38; // 0x138b
            printf("BB: %d", 4);
            while ((int32_t)v39 == 298) {
                // 0x13a0
                printf("BB: %d", 4);
            }
            // 0x13ce
            v15 = v39 & 0xffffffff;
            v13 = v22;
            v14 = v38;
        }
    }
    int64_t v40 = v14 & 0xffffffff;
    printf("BB: %d", 9);
    int64_t v41 = v13 + 298;
    int64_t v42 = v40 - v15 ^ v40; // 0x13f8
    printf("BB: %d", 10);
    return ((0x100000000 * (int64_t)((int32_t)v42 >> 31) | v42 & 0xffffffff) / ((v41 | 1) + v14 & 0xffffffff) + v41 | v41) & 0xffffffff ^ 298;
}
