int func4(unsigned long a0)
{
    char v0;  // [bp-0x54]
    unsigned int v1;  // [bp-0x4c]
    unsigned int v2;  // [bp-0x48]
    unsigned int v3;  // [bp-0x44]
    unsigned long v4;  // [bp-0x40]
    unsigned int v5;  // [bp-0x38]
    unsigned int v6;  // [bp-0x34]
    unsigned int v10;  // r12d
    unsigned long long v12;  // rbp
    unsigned long long v15;  // rax
    unsigned long long v18;  // r13
    unsigned int v20;  // r12d
    unsigned long v23;  // r12
    unsigned long long v24;  // rbx
    unsigned int v27;  // r14d
    unsigned int v29;  // r15d
    unsigned int v31;  // ebx
    unsigned long v32;  // r14
    unsigned int v33;  // ebp
    unsigned int v35;  // r12d
    unsigned int v37;  // ebx
    unsigned int v38;  // esi
    unsigned long long v40;  // r14
    unsigned int v43;  // ebx
    unsigned int v45;  // r15d

    __isoc99_scanf("%d", &v0);
    v1 = *(&v0);
    __isoc99_scanf("%d", &v0);
    v10 = rand();
    __isoc99_scanf("%d", &v0);
    v12 = *(&v0) & v10;
    __isoc99_scanf("%d", &v0);
    rand();
    v15 = rand();
    v4 = v15;
    __isoc99_scanf("%d", &v0);
    v18 = (v15 - 10 ^ rand()) & v10 & *(&v0);
    __isoc99_scanf("%d", &v0);
    v20 = *(&v0);
    printf("%d", v18);
    printf("%d", *(&v0));
    v3 = *(&v0) ^ a0;
    v24 = v20 * (v23 ^ a0) | v23;
    printf("%d", (v20 * (v23 ^ a0) | v23) - 2);
    v2 = v24 - 3;
    v6 = v24 + v18 - 3;
    v27 = (v24 - 2 & v23) + a0;
    printf("%d", (v24 >> 31 CONCAT v24) % v1);
    v29 = (0 - ((v12 >> 31 & 1 ^ 1? v12 : v12 + 7) >> 3)) * 2;
    printf("%d", v29);
    v31 = v1;
    v33 = ((rbx<8> ^ r14d<4>) + v32 >> 31 CONCAT (rbx<8> ^ r14d<4>) + v32) % v1 & v23;
    *(&v5) = ((rbx<8> ^ r14d<4>) + v32 >> 31 CONCAT (rbx<8> ^ r14d<4>) + v32) % v33 & v23;
    printf("%d", ((rbx<8> ^ r14d<4>) + v32 >> 31 CONCAT (rbx<8> ^ r14d<4>) + v32) % v33 & v23);
    v35 = v18 & v31;
    printf("%d", v18 & v31);
    v37 = ((v33 & v31) + 2 >> 31 CONCAT (v33 & v31) + 2) % v2 & a0 ^ v29;
    v38 = ((v4 ^ v18) * 2 ^ 4) & v32;
    v4 = ((v4 ^ v18) * 2 ^ 4) & v32;
    printf("%d", v38);
    v40 = v32 & -8;
    printf("%d", v40);
    v43 = v37 + ((v35 >> 31 CONCAT v35) % v1 & v6) - 10;
    printf("%d", v43);
    v45 = ((v40 | v3) * (v18 | v5 | 2) >> 31 CONCAT (v40 | v3) * (v18 | v5 | 2)) % v5 | v43;
    printf("%d", v29);
    printf("%d", v2 ^ ((v4 & v3) + v3 >> 31 CONCAT (v4 & v3) + v3) % v4);
    return;
}
