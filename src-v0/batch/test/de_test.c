/* This file was generated by the Hex-Rays decompiler version 8.2.0.221215.
   Copyright (c) 2007-2021 Hex-Rays <info@hex-rays.com>

   Detected compiler: GNU C++
*/

#include <defs.h>


//-------------------------------------------------------------------------
// Function declarations

__int64 (**init_proc())(void);
void sub_1020();
// int printf(const char *format, ...);
// int __fastcall _cxa_finalize(void *);
void __fastcall __noreturn start(__int64 a1, __int64 a2, void (*a3)(void));
void *deregister_tm_clones();
__int64 register_tm_clones();
void *_do_global_dtors_aux();
__int64 __fastcall frame_dummy(); // weak
int __cdecl main(int argc, const char **argv, const char **envp);
void platform_main_begin();
__int64 crc32_gentab();
__int64 func_1();
int __fastcall platform_main_end(unsigned int a1);
__int64 __fastcall func_4(int a1);
float __fastcall func_29(unsigned __int16 a1, int i, signed __int16 a3, unsigned __int16 a4);
float __fastcall func_50(unsigned __int16 a1);
__int64 __fastcall func_58(unsigned int a1);
__int64 __fastcall func_72(__int16 a1, __int16 a2);
__int64 __fastcall func_77(unsigned __int16 a1);
int __fastcall func_97(__int64 a1, __int64 a2, __int64 a3, __int64 a4, __int16 a5);
__int64 __fastcall func_115(int a1, unsigned int a2, unsigned int a3, int a4);
__int64 func_124();
void term_proc();
// int __fastcall _libc_start_main(int (__fastcall *main)(int, char **, char **), int argc, char **ubp_av, void (*init)(void), void (*fini)(void), void (*rtld_fini)(void), void *stack_end);
// int __fastcall __cxa_finalize(void *);
// __int64 _gmon_start__(void); weak

//-------------------------------------------------------------------------
// Data declarations

void *_dso_handle = &_dso_handle; // idb
int crc32_context = -1; // weak
_UNKNOWN _TMC_END__; // weak
char completed_0; // weak
_DWORD crc32_tab[256]; // weak


//----- (0000000000001000) ----------------------------------------------------
__int64 (**init_proc())(void)
{
  __int64 (**result)(void); // rax

  result = &_gmon_start__;
  if ( &_gmon_start__ )
    return (__int64 (**)(void))_gmon_start__();
  return result;
}
// B478: using guessed type __int64 _gmon_start__(void);

//----- (0000000000001020) ----------------------------------------------------
void sub_1020()
{
  JUMPOUT(0LL);
}
// 1026: control flows out of bounds to 0

//----- (0000000000001050) ----------------------------------------------------
// positive sp value has been detected, the output may be wrong!
void __fastcall __noreturn start(__int64 a1, __int64 a2, void (*a3)(void))
{
  __int64 v3; // rax
  int v4; // esi
  __int64 v5; // [rsp-8h] [rbp-8h] BYREF
  char *retaddr; // [rsp+0h] [rbp+0h] BYREF

  v4 = v5;
  v5 = v3;
  _libc_start_main((int (__fastcall *)(int, char **, char **))main, v4, &retaddr, 0LL, 0LL, a3, &v5);
  __halt();
}
// 105A: positive sp value 8 has been found
// 1061: variable 'v3' is possibly undefined

//----- (0000000000001080) ----------------------------------------------------
void *deregister_tm_clones()
{
  return &_TMC_END__;
}

//----- (00000000000010B0) ----------------------------------------------------
__int64 register_tm_clones()
{
  return 0LL;
}

//----- (00000000000010F0) ----------------------------------------------------
void *_do_global_dtors_aux()
{
  void *result; // rax

  if ( !completed_0 )
  {
    if ( &__cxa_finalize )
      _cxa_finalize(_dso_handle);
    result = deregister_tm_clones();
    completed_0 = 1;
  }
  return result;
}
// B040: using guessed type char completed_0;

//----- (0000000000001130) ----------------------------------------------------
__int64 frame_dummy()
{
  return register_tm_clones();
}
// 1130: using guessed type __int64 __fastcall frame_dummy();

//----- (0000000000001140) ----------------------------------------------------
int __cdecl main(int argc, const char **argv, const char **envp)
{
  platform_main_begin();
  crc32_gentab();
  func_1();
  platform_main_end(~crc32_context);
  return 0;
}
// B030: using guessed type int crc32_context;

//----- (0000000000001190) ----------------------------------------------------
void platform_main_begin()
{
  ;
}

//----- (00000000000011A0) ----------------------------------------------------
__int64 crc32_gentab()
{
  __int64 result; // rax
  int j; // [rsp+0h] [rbp-10h]
  int i; // [rsp+4h] [rbp-Ch]
  unsigned int v3; // [rsp+Ch] [rbp-4h]

  for ( i = 0; i < 256; ++i )
  {
    v3 = i;
    for ( j = 8; j > 0; --j )
    {
      if ( (v3 & 1) != 0 )
        v3 = (v3 >> 1) ^ 0xEDB88320;
      else
        v3 >>= 1;
    }
    crc32_tab[i] = v3;
    result = (unsigned int)(i + 1);
  }
  return result;
}
// B050: using guessed type _DWORD crc32_tab[256];

//----- (0000000000001240) ----------------------------------------------------
__int64 func_1()
{
  __int16 i; // [rsp+102h] [rbp-1Eh]

  if ( (unsigned int)func_4(4) - 300894646 <= 0xBDA77607 )
  {
    for ( i = 0; i >= 10; ++i )
      ;
  }
  return 22129LL;
}
// 1BC6: conditional instruction was optimized away because %var_30.4==B871F3A1

//----- (0000000000002120) ----------------------------------------------------
int __fastcall platform_main_end(unsigned int a1)
{
  return printf("checksum = %X\n", a1);
}

//----- (0000000000002150) ----------------------------------------------------
__int64 __fastcall func_4(int a1)
{
  __int16 i; // [rsp+2Ah] [rbp-36h]
  unsigned __int16 v3[3]; // [rsp+56h] [rbp-Ah]

  *(_DWORD *)&v3[1] = a1;
LABEL_2:
  while ( *(_DWORD *)&v3[1] )
  {
    for ( v3[0] = 1; (__int16)v3[0] < 18; *(_DWORD *)v3 = (unsigned __int16)(v3[0] + 1) )
      v3[2] = 0;
  }
  for ( v3[0] = -28; ; v3[0] += 4 )
  {
    if ( (__int16)v3[0] >= 15 )
      goto LABEL_2;
    if ( (__int16)v3[0] / (__int16)v3[0] )
      break;
    for ( i = 1; i != 28; i += 9 )
      ;
    *(_DWORD *)&v3[1] = v3[0] << SLOBYTE(v3[0]);
  }
  return (unsigned int)(__int16)v3[0];
}
// 2266: conditional instruction was optimized away because %var_24.4==ABEFA025
// 22A4: conditional instruction was optimized away because %var_24.4==0
// 26AD: conditional instruction was optimized away because %var_18.4==FFFFFFFE
// 2150: using guessed type unsigned __int16 var_A[3];

//----- (00000000000026E0) ----------------------------------------------------
float __fastcall func_29(unsigned __int16 a1, int i, signed __int16 a3, unsigned __int16 a4)
{
  int n; // [rsp+C8h] [rbp-D8h]
  __int16 m; // [rsp+EAh] [rbp-B6h]
  int v7; // [rsp+11Ch] [rbp-84h]
  int v8; // [rsp+12Ch] [rbp-74h]
  int v9; // [rsp+130h] [rbp-70h]
  unsigned __int16 j; // [rsp+190h] [rbp-10h]
  unsigned __int16 v12; // [rsp+19Ah] [rbp-6h]
  unsigned __int16 k; // [rsp+19Ah] [rbp-6h]
  unsigned __int16 ii; // [rsp+19Ah] [rbp-6h]

  v12 = a1;
LABEL_2:
  if ( a4 == 357743051 )
  {
    v9 = 998681458;
    v8 = -330512617;
    for ( i = 0; (unsigned int)i <= 0x21 && !a1; ++i )
    {
      v7 = (float)((float)-9 / (float)0) == (float)-9;
      if ( !(v7 / v9) )
      {
        if ( a4 == 4 || !a4 )
          return (float)v8;
        goto LABEL_2;
      }
      v9 = (float)((float)v9 + (float)v7) > 4.524298624e10;
      if ( !((1u >> v9 == 0) >> 5) )
        v9 = -247961600;
      v8 = 0;
    }
  }
  else
  {
    for ( j = 0; j >= 0x15u; ++j )
    {
      if ( !(i % i) )
      {
        if ( !a3 )
          break;
        return (float)v12;
      }
      v12 = 0;
    }
  }
  if ( a3 && a4 > a3 )
  {
    for ( k = 19; k >= 0x16u; ++k )
      ;
    for ( m = -15; m != 10; ++m )
    {
      for ( n = 24; n < 25; n += 9 )
        ;
      for ( ii = 0; ii > 7u; ++ii )
        ;
    }
  }
  return (float)i;
}
// 2965: conditional instruction was optimized away because %var_38.4==2E5A3298
// 29B3: conditional instruction was optimized away because %var_38.4==2E5A3298
// 2DEF: conditional instruction was optimized away because %var_80.4==0
// 2E69: conditional instruction was optimized away because %var_1C.2==0
// 2EBD: conditional instruction was optimized away because %var_8C.4 is in (==1|==52FF1B7A)
// 30C9: conditional instruction was optimized away because %var_6.2==0
// 3A96: conditional instruction was optimized away because %var_E.2!=0

//----- (0000000000003F20) ----------------------------------------------------
float __fastcall func_50(unsigned __int16 a1)
{
  return (float)a1;
}

//----- (0000000000003F40) ----------------------------------------------------
__int64 __fastcall func_58(unsigned int a1)
{
  return a1;
}

//----- (0000000000003F70) ----------------------------------------------------
__int64 __fastcall func_72(__int16 a1, __int16 a2)
{
  unsigned __int16 v2; // ax
  unsigned int v4; // [rsp+D8h] [rbp-18h]
  int i; // [rsp+E0h] [rbp-10h]
  int v6; // [rsp+E4h] [rbp-Ch]

  v4 = -131730986;
  v2 = func_77(1 - a2);
  func_50(v2);
  v6 = (__int16)((int)func_58(0xFFFFFFFF) % a1) / -3897;
  for ( i = 11; i != 24; ++i )
    v4 = (int)(float)((float)((((float)((float)1 - (float)i) != 2.33547168219136e17) < v6 != a1) == a1) / 1.25);
  return v4;
}
// 4046: conditional instruction was optimized away because %var_14.4==0

//----- (0000000000004D50) ----------------------------------------------------
__int64 __fastcall func_77(unsigned __int16 a1)
{
  return a1;
}

//----- (0000000000005B50) ----------------------------------------------------
int __fastcall func_97(__int64 a1, __int64 a2, __int64 a3, __int64 a4, __int16 a5)
{
  return a5;
}

//----- (0000000000005B80) ----------------------------------------------------
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
// 66F3: conditional instruction was optimized away because %var_20.4==0
// 67C1: conditional instruction was optimized away because %var_D0.4==B
// 6B08: conditional instruction was optimized away because %var_A8.4==A88BD34
// 6BA7: conditional instruction was optimized away because %var_AC.4==14
// 6F97: conditional instruction was optimized away because %var_1A.2==2
// 874B: conditional instruction was optimized away because %var_28.4==0

//----- (00000000000088B0) ----------------------------------------------------
__int64 func_124()
{
  return 422816821LL;
}

//----- (00000000000089A8) ----------------------------------------------------
void term_proc()
{
  ;
}

// nfuncs=28 queued=22 decompiled=22 lumina nreq=0 worse=0 better=0
// ALL OK, 22 function(s) have been successfully decompiled
