int func(int p1, int p2){
        int v0;
        int v1;
        int v2;
        v0 = f_rand_0();
        v1 = f_rand_1();
        v2 = f_rand_2();
        printf("BB: %d", 0);

        int ret = 0;

        if(v1 > v2){
                printf("BB: %d", 1);
                ret = v0 + v1 + v2;
        }
        else {
                printf("BB: %d", 2);
                ret = v0 * v1 * v2;
        }
        printf("BB: %d", 3);
        return ret;
}