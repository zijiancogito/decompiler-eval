__int64 __fastcall func6(int a1)
{
  __int64 v1; // r13
  unsigned int v2; // ebp
  int v3; // r14d
  int v4; // r12d
  int v5; // ebp
  __int64 v6; // r15
  int v7; // ebx
  int v8; // eax
  int v9; // r14d
  __int64 v10; // r13
  unsigned int v11; // ebx
  int v12; // ebp
  unsigned int v13; // ebx
  int v14; // r14d
  int v15; // r12d
  int v16; // ebp
  unsigned int v17; // ebx
  int v18; // ecx
  int v19; // r12d
  int v20; // r14d
  int v21; // ebp
  int v23; // [rsp+4h] [rbp-64h]
  int v24; // [rsp+4h] [rbp-64h]
  signed int v25; // [rsp+4h] [rbp-64h]
  unsigned int v26; // [rsp+8h] [rbp-60h] BYREF
  int v27; // [rsp+Ch] [rbp-5Ch]
  int v28; // [rsp+10h] [rbp-58h]
  int v29; // [rsp+14h] [rbp-54h]
  __int64 v30; // [rsp+18h] [rbp-50h]
  int v31; // [rsp+20h] [rbp-48h]
  int v32; // [rsp+24h] [rbp-44h]
  __int64 v33; // [rsp+28h] [rbp-40h]
  __int64 v34; // [rsp+30h] [rbp-38h]

  v29 = a1;
  __isoc99_scanf("%d", &v26);
  v1 = v26;
  __isoc99_scanf("%d", &v26);
  v2 = v26;
  v30 = v26;
  v3 = rand();
  __isoc99_scanf("%d", &v26);
  v4 = v2 & v26;
  v28 = rand();
  v23 = rand();
  v5 = rand();
  v27 = v5;
  __isoc99_scanf("%d", &v26);
  v6 = (unsigned int)rand();
  __isoc99_scanf("%d", &v26);
  v32 = v3 * v5;
  v31 = 3 * v1;
  printf("%d", (unsigned int)(3 * v1));
  v34 = v6;
  v7 = v6 - v23;
  printf("%d", (unsigned int)(v6 - v23));
  printf("%d", (unsigned int)v4);
  v8 = v3 * (v6 - 4);
  v9 = v28;
  v33 = v1;
  v24 = (int)(v1 ^ (v28 + v8)) / v4;
  LODWORD(v6) = v27 ^ 3;
  printf("%d", (unsigned int)v1 ^ v27 ^ 3);
  v10 = (unsigned int)v6 & (unsigned int)v30;
  printf("%d", v10);
  v25 = v6 & v24;
  printf("%d", (unsigned int)v25);
  v11 = v7 - v4;
  printf("%d", v11);
  v12 = v29;
  v13 = (v6 | v11) - v29;
  printf("%d", v13);
  v14 = v13 + v9 - v31;
  v15 = (int)(v10 | v32 | v12 | v33) / v14;
  v16 = v27;
  v17 = v27 + (int)v13 / v25;
  printf("%d", v17);
  v18 = (int)v34 / v16;
  v30 = v10;
  v19 = ((int)(((int)v34 / v16) & (v17 ^ (-4 * v10))) / v14) & v15;
  v20 = v29;
  v21 = (v18 | (v33 * (v18 ^ ((v17 ^ ((int)(v33 | v28) / v29)) + 4)))) - v6;
  LODWORD(v10) = ((_BYTE)v6
                - (_BYTE)v28
                + ((unsigned __int8)v10 & (unsigned __int8)-((unsigned int)(v19 / v25 + (v19 / v25 < 0 ? 3 : 0)) >> 2))) | 0xFFFFFFFC;
  printf("%d", (v29 / v18) & (unsigned int)(v6 + v19));
  printf("%d", (unsigned int)(v27 + v30));
  return v25 & ((unsigned int)v10 ^ v21 ^ (v20 + v17));
}