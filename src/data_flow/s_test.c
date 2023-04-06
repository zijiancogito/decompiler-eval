void __cdecl func0( int32_t p1, int32_t p2, int64_t p3, int64_t p4 )
{
    int64_t v13;
    int64_t v12;
    uint32_t local_0x64; // [rsp-100]
    uint32_t local_0x60; // [rsp-96]
    uint32_t local_0x58; // [rsp-88]
    uint32_t local_0x54; // [rsp-84]
    uint32_t local_0x4C; // [rsp-76]
    uint32_t local_0x48; // [rsp-72]
    uint32_t local_0x44; // [rsp-68]
    int64_t v6; // rbx
    int64_t v7; // rbx
    int v1; // rax
    int64_t v9; // r12
    int64_t v5; // r14
    int v2; // rax
    int64_t v10; // rbx
    int64_t v11; // r14
    int v3; // rax
    int v4; // rax
    int64_t v8; // rax

    local_0x60 = (uint32_t)p2;
    local_0x44 = (uint32_t)p1;
    __isoc99_scanf_2( "%d", &local_0x64 );
    local_0x54 = local_0x64;
    v1 = rand_2();
    local_0x58 = (uint32_t)v1;
    v2 = rand_2();
    local_0x4C = (uint32_t)v2;
    __isoc99_scanf_2( "%d", &local_0x64 );
    __isoc99_scanf_2( "%d", &local_0x64 );
    rand_2();
    v3 = rand_2();
    v4 = rand_2();
    local_0x48 = (uint32_t)v4;
    __isoc99_scanf_2( "%d", &local_0x64 );
    __isoc99_scanf_2( "%d", &local_0x64 );
    v5 = local_0x58 * ((v3 * 954437177 >> 33) + (v3 * 954437177 >> 63)) - local_0x64;
    printf_2( "%d" );
    printf_2( "%d", local_0x48 | local_0x64 );
    v6 = local_0x4C & 0xFFFFFFFF00000000 | (local_0x4C | (uint32_t)(int32_t)local_0x4C >> 31 << 32) / local_0x64;
    printf_2( "%d", v6 );
    printf_2( "%d" );
    printf_2( "%d", 7 / local_0x64 & (local_0x64 ^ (uint32_t)v4) + local_0x64 );
    printf_2( "%d", (local_0x64 ^ (uint32_t)v4) + local_0x64 - (v5 ^ local_0x44) );
    v7 = ((v6 | local_0x54) ^ 0x6) & 0xFFFFFFFF00000000 | ((v6 | local_0x54) ^ 0x6 | (uint32_t)(int32_t)((v6 | local_0x54) ^ 0x6) >> 31 << 32) / v6;
    printf_2( "%d", v7 & local_0x48 | local_0x54 );
    printf_2( "%d" );
    printf_2( "%d" );
    v8 = local_0x44 - p4 + (local_0x4C * (local_0x60 + local_0x4C | 0x3) | 7 / local_0x64) + ((v7 & local_0x48 | local_0x54) ^ v5 ^ local_0x44);
    v9 = v8 + 6 & local_0x48 & 0xFFFFFFFF00000000 | (v8 + 6 & local_0x48 | (uint32_t)(int32_t)(v8 + 6 & local_0x48) >> 31 << 32) / (uint32_t)p4;
    v10 = (v5 ^ local_0x44) & 0xFFFFFFFF00000000 | (v5 ^ local_0x44 | (uint32_t)(int32_t)(v5 ^ local_0x44) >> 31 << 32) / (local_0x4C * local_0x54 + (v5 ^ local_0x44));
    printf_2( "%d", (uint32_t)v9 * v10 );
    printf_2( "%d", (local_0x4C & 0xFFFFFFFF00000000 | (local_0x4C | (uint32_t)(int32_t)local_0x4C >> 31 << 32) / (uint32_t)p4 * 3) & v9 );
    printf_2( "%d", (local_0x4C * local_0x54 + (v5 ^ local_0x44)) * v9 * v10 - (local_0x54 - p4 ^ local_0x58) | local_0x48 );
    printf_2( "%d", v9 | local_0x44 );
    v11 = (v5 ^ local_0x44) - (local_0x54 - p4 ^ local_0x58) * (v7 & local_0x48 | local_0x54);
    v12 = (v11 | (uint32_t)(int32_t)(v5 ^ local_0x44) - (local_0x54 - p4 ^ local_0x58) * (v7 & local_0x48 | local_0x54) >> 31 << 32) / (local_0x4C & 0xFFFFFFFF00000000 | (local_0x4C | (uint32_t)(int32_t)local_0x4C >> 31 << 32) / (uint32_t)p4 * 3);
    v13 = ((v11 & 0xFFFFFFFF00000000 | v12) + (uint32_t)p4 | (uint32_t)(int32_t)(v11 & 0xFFFFFFFF00000000 | v12) + (uint32_t)p4 >> 31 << 32) / (local_0x54 - p4 ^ local_0x58) * (v7 & local_0x48 | local_0x54);
    printf_2( "%d", (v11 & 0xFFFFFFFF00000000 | v12) + (uint32_t)p4 & 0xFFFFFFFF00000000 | v13 );
}