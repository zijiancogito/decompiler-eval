int64_t func0() __noreturn
{
    int32_t rbp = f_rand_0();
    int32_t rax_1 = f_rand_2();
    int32_t rax_2 = f_rand_1();
    printf("BB: %d", 0);
    int64_t r13;
    r13 = rax_2 < 0x18b;
    int32_t r14_1 = (rax_1 & 0xfffffcd3);
    int32_t r14_2 = 0x160;
    int32_t rbx_1 = 0x28f;
    while (true)
    {
        printf("BB: %d", 1);
        int64_t r15_2 = ((int64_t)rbx_1);
        int32_t rax_13 = (((int32_t)((r15_2 * -0x76e538c5) >> 0x20)) + r15_2);
        int32_t r15_3 = (r15_2 - (((rax_13 >> 7) + (rax_13 >> 0x1f)) * 0xef));
        int32_t rbp_3 = (r15_3 ^ 0x29b);
        if (rax_2 <= 0x18a)
        {
            rbx_1 = 1;
            bool cond:0_1;
            do
            {
                printf("BB: %d", 2);
                cond:0_1 = (rbx_1 & 1) != 0;
                rbx_1 = r13;
            } while (cond:0_1);
            int32_t temp8_1;
            int32_t temp9_1;
            temp8_1 = ((int64_t)rax_2);
            temp9_1 = ((int64_t)rax_2);
            int32_t rbx_4 = (((temp9_1 % rax_1) & rbp_3) ^ 0xef);
            r14_2 = (rbx_4 + 0xef);
            rbx_1 = ((rbx_4 - 0x1ac) & rax_1);
        }
        printf("BB: %d", 3);
        int32_t rbp_1;
        if (r14_2 > 0x16e)
        {
            rbp_1 = rbp;
        }
        else
        {
            int64_t rbp_4 = ((int64_t)((((rbp_3 & r14_2) & 0x300) | 0xef) * rbp_3));
            int32_t rbp_5 = (rbp_4 + ((int32_t)((rbp_4 * -0x5e94ced1) >> 0x20)));
            rbp_1 = ((rbp_5 >> 9) + (rbp_5 >> 0x1f));
            do
            {
                printf("BB: %d", 4);
            } while (r14_2 < 0x16f);
            rbx_1 = (rbp + r14_1);
        }
        printf("BB: %d", 5);
        int64_t rax_6 = ((int64_t)rbp_1);
        int32_t rcx_3 = (((int32_t)((rax_6 * -0x3b7d8157) >> 0x20)) + rax_6);
        int32_t temp2_1;
        int32_t temp3_1;
        temp2_1 = ((int64_t)(rax_6 - (((rcx_3 >> 9) + (rcx_3 >> 0x1f)) * 0x29b)));
        temp3_1 = ((int64_t)(rax_6 - (((rcx_3 >> 9) + (rcx_3 >> 0x1f)) * 0x29b)));
        rbp = (temp3_1 / (r15_3 ^ 0xfffffd64));
    }
}


