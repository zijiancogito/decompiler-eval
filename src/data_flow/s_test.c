__int64 __fastcall func7(int a1, int a2, int a3, int a4)
{
  int v4; // r12d
  int v5; // r13d
  int v6; // ebp
  int v7; // r15d
  int v8; // r14d
  unsigned int v9; // r13d
  int v10; // r12d
  __int64 v11; // rdx
  int v12; // ebp
  int v14; // [rsp+Ch] [rbp-7Ch]
  int v15; // [rsp+10h] [rbp-78h]
  int v16; // [rsp+10h] [rbp-78h]
  unsigned int v18; // [rsp+14h] [rbp-74h]
  int v19; // [rsp+18h] [rbp-70h]
  unsigned int v20; // [rsp+1Ch] [rbp-6Ch]
  int v21; // [rsp+20h] [rbp-68h]
  int v22; // [rsp+24h] [rbp-64h]
  int v23; // [rsp+24h] [rbp-64h]
  int v25; // [rsp+2Ch] [rbp-5Ch]
  int v26; // [rsp+30h] [rbp-58h]
  __int128 v27; // [rsp+34h] [rbp-54h]
  int v28; // [rsp+44h] [rbp-44h] BYREF
  unsigned __int64 v29; // [rsp+48h] [rbp-40h]

  v29 = __readfsqword(0x28u);
  v4 = rand();
  __isoc99_scanf(&unk_4004, &v28);
  v5 = v28;
  v14 = rand();
  v22 = rand();
  rand();
  v6 = rand();
  __isoc99_scanf(&unk_4004, &v28);
  v26 = v28;
  __isoc99_scanf(&unk_4004, &v28);
  v25 = v28;
  v15 = rand();
  v7 = rand();
  v8 = v15 * (((-3 * v14) | 0xA) ^ a2);
  v20 = (v4 & v5) - 4;
  __printf_chk(1LL, &unk_4004, v20);
  v16 = v6 | (v22 + 10 * v7);
  __printf_chk(1LL, &unk_4004, (unsigned int)v16);
  v18 = v4 - a3;
  __printf_chk(1LL, &unk_4004, v18);
  v19 = (v6 + 3) / v7;
  DWORD1(v27) = a1 / v4 * v18;
  __printf_chk(1LL, &unk_4004, DWORD1(v27));
  __printf_chk(1LL, &unk_4004, (unsigned int)(v16 / v14));
  LODWORD(v27) = v8 * ((v7 ^ (3 / v14)) - 3);
  __printf_chk(1LL, &unk_4004, (unsigned int)v27);
  v21 = (v14 & (v8 * v16)) + v16;
  __printf_chk(1LL, &unk_4004, -3 * v16 / v14 * v16 / v14 * (v8 & (unsigned int)(v21 / v22)));
  *(_QWORD *)((char *)&v27 + 4) = v27;
  v9 = (((v22 + 10 * v7) & 0xFFFFFFFD) * v16 / v14 * v21) | v19;
  v10 = v27 * a1 / v4 * v18;
  LODWORD(v27) = v27 & v18;
  v23 = (v27 | v20 | (v9 * (v10 / (int)v27)) | 3) - v14;
  __printf_chk(1LL, &unk_4004, v9 & a4);
  __printf_chk(
    1LL,
    &unk_4004,
    v8 | DWORD1(v27) & (unsigned int)((int)((v10 * (DWORD2(v27) | v18)) | (v8
                                                                         * (v10 & ((v16 / v14) ^ v10 & (DWORD1(v27) + DWORD2(v27) * v19)))))
                                    / v21));
  v11 = (unsigned int)(a4 - v10);
  v12 = v11 - v10;
  __printf_chk(1LL, &unk_4004, v11);
  __printf_chk(1LL, &unk_4004, (unsigned int)(v12 + v23 - v8));
  __printf_chk(1LL, &unk_4004, v9 & ((v7 ^ (v25 + v14 - v16)) / v26 - v23));
  __printf_chk(1LL, &unk_4004, (unsigned int)v27 ^ (v10 * v9));
  return v20 * v19;
}
// __int64 __fastcall func_115(int a1, unsigned int a2, unsigned int a3, int a4)
// {
//   __m128 v4; // xmm0
//   bool v6; // [rsp+35h] [rbp-21Bh]
//   bool v7; // [rsp+36h] [rbp-21Ah]
//   int v8; // [rsp+228h] [rbp-28h]
//   int v9; // [rsp+230h] [rbp-20h]
//   int i; // [rsp+230h] [rbp-20h]

//   v9 = func_124();
//   if ( -1946351558 * v9 )
//   {
//     for ( i = 0; i >= -17; --i )
//       ;
//     return (unsigned int)a1;
//   }
//   v4 = (__m128)0x372A7172u;
//   if ( -919989129 * a3 )
//   {
//     v4.m128_f32[0] = (float)a4 * (float)864771819;
//     v8 = 176733492 - (_mm_cvtsi128_si32((__m128i)_mm_cmpeq_ss(v4, (__m128)0LL)) & 1);
//     if ( (a4 != 1973960201) != 0x338B5EEB )
//     {
//       while ( v8 )
//         ;
//       return a3;
//     }
//     v9 = 0;
//   }
//   else if ( a1 % -1 )
//   {
//     return (unsigned int)a4;
//   }
//   if ( (unsigned __int16)(-2091 * ((unsigned int)a4 >= 0xA88BD34)) == 1 )
//   {
//     return 2;
//   }
//   else if ( a1 )
//   {
//     while ( 1 )
//     {
//       v7 = 0;
//       if ( a1 < 1 )
//         v7 = a1 != 0;
//       v6 = 0;
//       if ( a1 * v7 )
//         v6 = a1 != 0;
//       if ( v6 == 0x5026 )
//         break;
//       if ( !v9 )
//         return a3;
//     }
//     return (unsigned int)a4;
//   }
//   else if ( a2 == 1 )
//   {
//     return a3;
//   }
//   else
//   {
//     return a2;
//   }
// }