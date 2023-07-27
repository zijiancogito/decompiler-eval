uint64_t func0()
{
    int32_t var_c = f_rand_1();
    int32_t var_14 = f_rand_4();
    int32_t var_18 = f_rand_0();
    int32_t var_1c = 0x3c0;
    int32_t var_20 = f_rand_3();
    int32_t var_24 = 0x1aa;
    int32_t var_28 = 0x12e;
    int32_t var_30 = f_rand_2();
    int32_t rax_4;
    rax_4 = 0;
    printf("BB: %d", 0);
    int64_t rax_5;
    while (0x39a == var_1c)
    {
        rax_5 = 0;
        printf("BB: %d", 1);
        int32_t rax_6;
        while (var_20 == var_24)
        {
            rax_6 = 0;
            printf("BB: %d", 2);
            int32_t temp44_1;
            int32_t temp45_1;
            temp44_1 = ((int64_t)var_30);
            temp45_1 = ((int64_t)var_30);
            int32_t var_34_1 = ((temp45_1 / var_18) - 0x39a);
            var_c = (0xfffffc65 * var_28);
            int32_t rax_14 = ((var_20 ^ 0xffffffff) - var_20);
            var_20 = (((((var_20 & var_c) & var_20) * 0x54) - var_1c) - var_1c);
            int32_t var_3c_1 = ((((rax_14 + var_20) + var_18) + var_28) - rax_14);
        }
        rax_6 = 0;
        printf("BB: %d", 3);
        int32_t temp38_1;
        int32_t temp39_1;
        temp38_1 = ((int64_t)((0xfffffc65 ^ var_c) + 0x54));
        temp39_1 = ((int64_t)((0xfffffc65 ^ var_c) + 0x54));
        int32_t temp0_2 = (temp39_1 / var_20);
        uint64_t rdx_3 = ((uint64_t)(temp39_1 % var_20));
        uint64_t rdx_15;
        int32_t rax_30;
        if (var_20 > temp0_2)
        {
            rax_30 = 0;
            printf("BB: %d", 5, rdx_3);
            int32_t temp50_1;
            int32_t temp51_1;
            temp50_1 = 0x54;
            temp51_1 = 0x54;
            int32_t temp56_1;
            int32_t temp57_1;
            temp56_1 = ((int64_t)var_20);
            temp57_1 = ((int64_t)var_20);
            int32_t rax_62 = (((((temp57_1 / var_c) * (((0x54 / var_30) + var_28) ^ var_1c)) ^ 0x39a) | var_18) | var_14);
            int32_t temp62_1;
            int32_t temp63_1;
            temp62_1 = ((int64_t)(rax_62 - var_24));
            temp63_1 = ((int64_t)(rax_62 - var_24));
            rdx_15 = ((uint64_t)(temp63_1 % rax_62));
            var_c = rdx_15;
            int32_t var_58_1 = (var_1c ^ 0xffffffff);
        }
        else
        {
            rax_30 = 0;
            printf("BB: %d", 4, rdx_3);
            int32_t temp68_1;
            int32_t temp69_1;
            temp68_1 = ((int64_t)var_14);
            temp69_1 = ((int64_t)var_14);
            int32_t temp74_1;
            int32_t temp75_1;
            temp74_1 = ((int64_t)var_20);
            temp75_1 = ((int64_t)var_20);
            var_24 = ((temp75_1 % var_24) + 0x54);
            int32_t temp80_1;
            int32_t temp81_1;
            temp80_1 = ((int64_t)(var_20 * var_14));
            temp81_1 = ((int64_t)(var_20 * var_14));
            int32_t var_48_1 = (temp81_1 / var_14);
            int32_t temp86_1;
            int32_t temp87_1;
            temp86_1 = ((int64_t)var_30);
            temp87_1 = ((int64_t)var_30);
            int32_t temp92_1;
            int32_t temp93_1;
            temp92_1 = ((int64_t)(((temp87_1 / var_c) | var_c) ^ (((temp69_1 % var_30) ^ 0x54) * var_20)));
            temp93_1 = ((int64_t)(((temp87_1 / var_c) | var_c) ^ (((temp69_1 % var_30) ^ 0x54) * var_20)));
            var_1c = ((temp93_1 % var_1c) & 0x39a);
            int32_t temp98_1;
            int32_t temp99_1;
            temp98_1 = ((int64_t)(var_14 & var_1c));
            temp99_1 = ((int64_t)(var_14 & var_1c));
            rdx_15 = ((uint64_t)(temp99_1 % var_1c));
            var_28 = rdx_15;
        }
        int32_t rax_51;
        rax_51 = 0;
        printf("BB: %d", 6, rdx_15);
        int32_t temp104_1;
        int32_t temp105_1;
        temp104_1 = ((int64_t)((var_c ^ 0xffffffff) ^ var_c));
        temp105_1 = ((int64_t)((var_c ^ 0xffffffff) ^ var_c));
        uint64_t rdx_19 = ((uint64_t)(temp105_1 % var_c));
        var_20 = (temp105_1 / var_c);
        while (var_24 == 0xfc)
        {
            int32_t rax_71;
            rax_71 = 0;
            printf("BB: %d", 7, rdx_19);
            int32_t temp110_1;
            int32_t temp111_1;
            temp110_1 = ((int64_t)(0x39a - var_28));
            temp111_1 = ((int64_t)(0x39a - var_28));
            int32_t temp0_9 = (temp111_1 / 0x39a);
            int32_t temp116_1;
            int32_t temp117_1;
            temp116_1 = ((int64_t)temp0_9);
            temp117_1 = ((int64_t)temp0_9);
            var_30 = (((temp117_1 % temp0_2) * temp0_9) * var_30);
            int32_t temp122_1;
            int32_t temp123_1;
            temp122_1 = ((int64_t)(var_24 ^ var_1c));
            temp123_1 = ((int64_t)(var_24 ^ var_1c));
            int32_t temp128_1;
            int32_t temp129_1;
            temp128_1 = ((int64_t)(temp123_1 % var_1c));
            temp129_1 = ((int64_t)(temp123_1 % var_1c));
            int32_t temp134_1;
            int32_t temp135_1;
            temp134_1 = ((int64_t)var_18);
            temp135_1 = ((int64_t)var_18);
            rdx_19 = ((uint64_t)((temp135_1 % var_1c) & var_30));
            int32_t var_60_1 = rdx_19;
            int32_t var_64_1 = ((var_20 - (temp129_1 / var_30)) + var_28);
        }
    }
    rax_5 = 0;
    printf("BB: %d", 8);
    uint64_t rdx_34;
    int32_t rax_90;
    if (var_1c != var_20)
    {
        rax_90 = 0;
        printf("BB: %d", 0xa);
        int32_t temp2_1;
        int32_t temp3_1;
        temp2_1 = ((int64_t)(var_30 - var_24));
        temp3_1 = ((int64_t)(var_30 - var_24));
        var_18 = (0xffffffab & var_24);
        int32_t var_70_1 = ((var_18 + (temp3_1 % var_1c)) | var_28);
        int32_t temp8_1;
        int32_t temp9_1;
        temp8_1 = ((int64_t)var_30);
        temp9_1 = ((int64_t)var_30);
        rdx_34 = ((uint64_t)(temp9_1 % var_18));
        int32_t var_28_1 = (((temp9_1 / var_18) | var_30) + 0x54);
        var_28 = ((0x54 ^ var_18) + var_c);
    }
    else
    {
        rax_90 = 0;
        printf("BB: %d", 9);
        int32_t rax_93 = ((var_14 & 0x54) ^ var_18);
        var_14 = (var_1c ^ 0xffffffff);
        int32_t temp14_1;
        int32_t temp15_1;
        temp14_1 = ((int64_t)var_1c);
        temp15_1 = ((int64_t)var_1c);
        int32_t temp20_1;
        int32_t temp21_1;
        temp20_1 = ((int64_t)(temp15_1 % rax_93));
        temp21_1 = ((int64_t)(temp15_1 % rax_93));
        int32_t var_6c_1 = ((temp21_1 % var_1c) ^ var_1c);
        int32_t temp26_1;
        int32_t temp27_1;
        temp26_1 = ((int64_t)((var_18 * var_20) * var_18));
        temp27_1 = ((int64_t)((var_18 * var_20) * var_18));
        rdx_34 = ((uint64_t)(temp27_1 % var_14));
        int32_t var_c_1 = rdx_34;
        int32_t var_6c_2 = ((((var_20 ^ var_1c) * var_14) ^ var_18) - 0x39a);
    }
    int32_t rax_108;
    rax_108 = 0;
    printf("BB: %d", 0xb, rdx_34);
    int32_t temp32;
    int32_t temp33;
    temp32 = ((int64_t)(var_18 - var_30));
    temp33 = ((int64_t)(var_18 - var_30));
    uint64_t rdx_39 = ((uint64_t)(temp33 % var_24));
    int32_t var_74 = rdx_39;
    int32_t rax_126 = (var_14 ^ 0xffffffff);
    int32_t var_30_1 = (((((var_20 ^ 0xffffffff) & rax_126) + var_28) & 0x54) & rax_126);
    int32_t rax_132;
    rax_132 = 0;
    printf("BB: %d", 0xc, rdx_39);
    return ((uint64_t)(var_28 * 0x54));
}


