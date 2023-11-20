int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x1158
    int64_t v2 = f_rand_3(); // 0x1167
    f_rand_4();
    int64_t v3 = f_rand_0(a1, a2); // 0x117e
    int64_t v4 = f_rand_2(); // 0x1186
    printf("BB: %d", 0);
    if ((int32_t)"/lib64/ld-linux-x86-64.so.2" > 966) {
        // 0x122b
        printf("BB: %d", 2);
        printf("BB: %d", 3);
        return (v3 ^ v2) & 0xffffffff;
    }
    int32_t v5 = v1; // 0x115d
    int32_t v6 = v2; // 0x116c
    int32_t v7 = v6 + v5 & v6;
    printf("BB: %d", 1);
    while (v7 <= 966) {
        // 0x11c9
        printf("BB: %d", 1);
    }
    int32_t v8 = (v5 - v6 + (int32_t)v4 ^ 966) + 966 & v7; // 0x1204
    int64_t v9 = (0x100000000 * (int64_t)(v8 >> 31) | (int64_t)v8) % (v1 & 0xffffffff) * v1 | v1; // 0x1150
    // 0x122b
    printf("BB: %d", 2);
    printf("BB: %d", 3);
    return (v9 ^ v2) & 0xffffffff;
}
