int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_3(); // 0x1158
    int32_t v2 = v1; // 0x115d
    int64_t v3 = f_rand_0(a1, a2); // 0x1160
    int32_t v4 = v3; // 0x1165
    f_rand_2();
    int64_t v5 = f_rand_4(); // 0x1170
    int32_t v6 = v5; // 0x1175
    int64_t v7 = f_rand_1(); // 0x1178
    int32_t v8 = v7; // 0x117d
    printf("BB: %d", 0);
    int32_t v9 = -1 - v6;
    int32_t v10 = v9 + v2; // 0x1196
    int32_t v11 = v10 ^ v2; // 0x1199
    int32_t v12; // 0x1150
    int32_t v13; // 0x1150
    int32_t v14; // 0x1150
    if (v10 == 0) {
        // 0x13d3
        printf("BB: %d", 8);
        int32_t v15; // 0x1150
        int32_t v16; // 0x1150
        int32_t v17; // 0x1150
        if (v2 > v4) {
            // 0x1455
            printf("BB: %d", 10);
            int64_t v18 = v7 ^ v1;
            v15 = (0x100000000 * (int64_t)((int32_t)v18 >> 31) | v18 & 0xffffffff) % (v1 & 0xffffffff ^ 0xffffffff);
            v16 = v11;
            v17 = v6;
        } else {
            // 0x13f2
            printf("BB: %d", 9);
            int32_t v19 = -1 - v11;
            int32_t v20 = v4 - v19 & v2; // 0x1414
            v15 = v20;
            v16 = v19;
            v17 = (-1 - v20 + v19) * v8;
        }
        int32_t v21 = v15;
        printf("BB: %d", 11);
        v12 = v17 + v21 ^ v21;
        v13 = v16;
        v14 = v17;
    } else {
        // 0x11ab
        printf("BB: %d", 1);
        int32_t v22; // 0x1150
        int32_t v23; // 0x1150
        int32_t v24; // 0x1150
        int32_t v25; // 0x1150
        if (v4 < v9) {
            // 0x11d3
            printf("BB: %d", 2);
            int64_t v26 = v7 | v5;
            v22 = (((int32_t)(v7 ^ v5) - v2) * v11 ^ v9 | v8) + (v11 & v8);
            v23 = v4;
            v24 = v26;
            v25 = (v11 + (int32_t)(v26 | v3)) * v4;
        } else {
            // 0x1235
            printf("BB: %d", 3);
            int32_t v27 = v11 * v2 & v9; // 0x1252
            int32_t v28 = (0x100000000 * (int64_t)(v27 >> 31) | (int64_t)v27) % (int64_t)v11; // 0x1256
            int32_t v29 = v8 * v4 + v9; // 0x1263
            v22 = v28;
            v23 = (v29 | v28) ^ v6;
            v24 = v6;
            v25 = v29;
        }
        int32_t v30 = v24;
        printf("BB: %d", 4);
        int32_t v31 = v22; // 0x12b3
        int32_t v32 = v25; // 0x12b3
        if (v22 >= 350) {
            int32_t v33 = v25;
            printf("BB: %d", 5);
            int32_t v34 = v23 ^ (int32_t)((0x100000000 * (int64_t)(v33 >> 31) | (int64_t)v33) / (int64_t)v11); // 0x12d6
            int32_t v35 = ((v34 | v11 & -1 - v23) ^ -1 - v8) - v30; // 0x1311
            int32_t v36 = v30 * (int32_t)((0x100000000 * (int64_t)(v35 >> 31) | (int64_t)v35) % (int64_t)v30) ^ v30; // 0x131e
            v31 = v36;
            v32 = v34;
            while (v36 >= 350) {
                // 0x12b9
                v33 = v34;
                printf("BB: %d", 5);
                v34 = v23 ^ (int32_t)((0x100000000 * (int64_t)(v33 >> 31) | (int64_t)v33) / (int64_t)v11);
                v35 = ((v34 | v11 & -1 - v23) ^ -1 - v8) - v30;
                v36 = v30 * (int32_t)((0x100000000 * (int64_t)(v35 >> 31) | (int64_t)v35) % (int64_t)v30) ^ v30;
                v31 = v36;
                v32 = v34;
            }
        }
        // 0x1329
        printf("BB: %d", 6);
        v12 = v31;
        v13 = v11;
        v14 = v30;
        if (v32 >= 753) {
            while (true) {
                // 0x1360
                printf("BB: %d", 7);
            }
        }
    }
    int32_t v37 = v14;
    int32_t v38 = v12;
    printf("BB: %d", 12);
    int64_t v39 = v38; // 0x152f
    int32_t v40 = (-1 * v38 | (int32_t)((0x100000000 * (int64_t)(v38 >> 31) | v39) / v39)) - v13; // 0x1535
    printf("BB: %d", 13);
    return v37 + (int32_t)((0x100000000 * (int64_t)(v40 >> 31) | (int64_t)v40) % (int64_t)v13) | v37;
}
