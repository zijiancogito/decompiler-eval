int64_t func0(int64_t a1, int64_t a2) {
    int64_t v1 = f_rand_1(); // 0x1158
    int64_t v2 = f_rand_3(); // 0x1160
    f_rand_4();
    f_rand_0(a1, a2);
    int64_t v3 = f_rand_2(); // 0x1172
    printf("BB: %d", 0);
    int64_t v4 = v2 + v1 & v2;
    printf("BB: %d", 1);
    while ((int32_t)v4 < 967) {
        // 0x11a0
        printf("BB: %d", 1);
    }
    int64_t v5 = v4 & 0xffffffff & (v1 - v2 + v3 ^ 966) + 966; // 0x11ca
    printf("BB: %d", 2);
    printf("BB: %d", 3);
    return (((0x100000000 * ((0x100000000 * (int64_t)((int32_t)v5 >> 31) | v5) % (v1 & 0xffffffff)) >> 32) * (0x100000000 * v1 >> 32) | v1) ^ v2) & 0xffffffff;
}
