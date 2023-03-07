__int64 __fastcall func_115(int a1, unsigned int a2, unsigned int a3, int a4)
{
  __m128 v4; // xmm0
  bool v6; // [rsp+35h] [rbp-21Bh]
  bool v7; // [rsp+36h] [rbp-21Ah]
  int v8; // [rsp+228h] [rbp-28h]
  int v9; // [rsp+230h] [rbp-20h]
  int i; // [rsp+230h] [rbp-20h]

  v9 = func_124();
  if ( -1946351558 * v9 )
  {
    for ( i = 0; i >= -17; --i )
      ;
    return (unsigned int)a1;
  }
  v4 = (__m128)0x372A7172u;
  if ( -919989129 * a3 )
  {
    v4.m128_f32[0] = (float)a4 * (float)864771819;
    v8 = 176733492 - (_mm_cvtsi128_si32((__m128i)_mm_cmpeq_ss(v4, (__m128)0LL)) & 1);
    if ( (a4 != 1973960201) != 0x338B5EEB )
    {
      while ( v8 )
        ;
      return a3;
    }
    v9 = 0;
  }
  else if ( a1 % -1 )
  {
    return (unsigned int)a4;
  }
  if ( (unsigned __int16)(-2091 * ((unsigned int)a4 >= 0xA88BD34)) == 1 )
  {
    return 2;
  }
  else if ( a1 )
  {
    while ( 1 )
    {
      v7 = 0;
      if ( a1 < 1 )
        v7 = a1 != 0;
      v6 = 0;
      if ( a1 * v7 )
        v6 = a1 != 0;
      if ( v6 == 0x5026 )
        break;
      if ( !v9 )
        return a3;
    }
    return (unsigned int)a4;
  }
  else if ( a2 == 1 )
  {
    return a3;
  }
  else
  {
    return a2;
  }
}