void  FUN_00101189(int param_1, int param_2)
{
    int v1;
    scanf("%d", v1);
    
    switch(v1){
        case 1:
            puts("1");
            break;
        case 2:
            puts("2");
        default:
            puts("3");
            break;
    }
    if (param_1 > param_2)
        printf("2: %d\n", param_2);
}