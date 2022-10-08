void  FUN_00101189(int param_1, int param_2)
{
    int v1;
    v1 = 1;
    v2 = 2;
    for (; param_1 > param_2; param_1 = param_1 + 1, param_2 = param_2 + 1)
    {
        param_1 = F(v1, param_2);
        if (param_1 > v1 || param_2 > v1)
        {
            param_2 = F(v1, param_1);
            printf("1: %d\n", param_2);
        }
        if (!param_1)
            param_2 = F(param_1, v1);
    }
    param_1 = param_2;
    printf("2: %d\n", param_2);
}