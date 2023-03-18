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


/home/eval/DF/de/clang/Ghidra/o1/991.txt
uint func1(uint param_1,uint param_2,uint param_3)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  uint extraout_var;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint local_78;
  uint local_74;
  uint local_70;
  uint local_6c;
  uint local_68;
  uint local_64;
  ulong local_60;
  undefined8 local_58;
  ulong local_50;
  ulong local_48;
  uint local_3c;
  ulong local_38;
  
  local_70 = param_3;
  local_64 = param_2;
  local_3c = param_1;
  __isoc99_scanf(&DAT_00103004,&local_78);
  local_48 = (ulong)local_78;
  local_58._0_4_ = rand();
  local_58._4_4_ = extraout_var;
  __isoc99_scanf(&DAT_00103004,&local_78);
  rand();
  __isoc99_scanf(&DAT_00103004,&local_78);
  uVar3 = local_78;
  __isoc99_scanf(&DAT_00103004,&local_78);
  uVar6 = local_78;
  __isoc99_scanf(&DAT_00103004,&local_78);
  uVar4 = local_78;
  __isoc99_scanf(&DAT_00103004,&local_78);
  local_60 = (ulong)local_78;
  rand();
  uVar2 = rand();
  local_50 = (ulong)uVar2;
  local_6c = uVar2 + local_78 ^ uVar4 | 8;
  printf("%d");
  printf("%d",(ulong)((param_2 ^ 8) + uVar3 | 8));
  uVar4 = (uint)local_48;
  local_74 = (uVar4 & 7) * uVar3;
  local_68 = (uVar3 * uVar6 * 0x30 - uVar2) * uVar6;
  local_38 = (ulong)local_68;
  printf("%d");
  uVar2 = (uint)local_58;
  local_60._0_4_ = (uVar4 - (uint)local_58 ^ 8) + (uint)local_60;
  printf("%d",(ulong)(uint)local_60);
  uVar3 = local_6c;
  local_60._0_4_ = (uint)local_60 * (((int)uVar6 / 7) / (int)local_6c | local_68);
  local_68 = local_68 | 5;
  printf("%d",(ulong)local_68,(long)((int)uVar6 / 7) % (long)(int)local_6c & 0xffffffff);
  uVar4 = uVar2 ^ 6;
  printf("%d",(ulong)uVar4);
  uVar2 = uVar2 + 5;
  printf("%d",(ulong)uVar2);
  local_60 = local_60 & 0xffffffff00000000 | (ulong)uVar2;
  uVar5 = ((local_64 ^ 6) + (int)local_50 ^ uVar4) & uVar2;
  printf("%d",(ulong)uVar5);
  uVar4 = local_70;
  uVar7 = (uint)local_48;
  printf("%d",(ulong)((uVar2 | uVar7) & local_70));
  uVar6 = (uint)local_58;
  local_50 = local_50 & 0xffffffff00000000 |
             (long)(ulong)(local_74 & 5) / (long)(int)uVar3 & 0xffffffffU;
  uVar3 = uVar7 * 8 | (uint)local_58;
  uVar7 = (((int)uVar3 / (int)(uint)local_60) * 6 ^ uVar7) & local_3c;
  printf("%d",(ulong)uVar7,(long)(int)uVar3 % (long)(int)(uint)local_60 & 0xffffffff);
  local_70 = uVar4 - local_64;
  printf("%d",(ulong)(uVar7 + 8));
  uVar4 = local_68;
  uVar1 = 8 / (long)(int)uVar6;
  local_58 = uVar1 & 0xffffffff | (ulong)local_58._4_4_ << 0x20;
  uVar5 = ((uint)local_60 ^ local_68) * uVar5;
  printf("%d",(ulong)uVar5,8 % (long)(int)uVar6 & 0xffffffff);
  uVar3 = (uint)local_48;
  uVar2 = (uint)uVar1 & uVar3;
  uVar4 = (int)(uVar4 | local_74 | uVar2) / 5;
  printf("%d",(ulong)uVar4);
  printf("%d",(ulong)(((uVar5 - local_6c | 8) ^ (uint)local_60 | uVar3) ^ local_70));
  uVar6 = uVar7 - (uint)local_58;
  printf("%d",(ulong)uVar6);
  local_58._0_4_ = uVar2 ^ local_68 | (uint)local_58;
  printf("%d",(ulong)(uint)local_58);
  uVar3 = local_74;
  printf("%d",(ulong)((uint)local_58 ^ local_74 ^ uVar6 ^
                     ((uint)local_38 | uVar4 | 0xd) * (uint)local_60 + uVar7 + 8));
  uVar3 = (uint)local_60 * uVar6 + uVar3;
  printf("%d",(ulong)uVar3);
  printf("%d",(ulong)(uVar6 - uVar3));
  return uVar4 - (int)local_50 & uVar3;
}


/home/eval/DF/de/clang/Ghidra/o1/116.txt
uint func6(void)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint local_74;
  uint local_70;
  uint local_6c;
  uint local_68;
  int local_64;
  undefined8 local_60;
  ulong local_58;
  uint local_50;
  uint local_4c;
  uint local_48;
  int local_44;
  ulong local_40;
  ulong local_38;
  
  iVar3 = rand();
  local_60 = CONCAT44(local_60._4_4_,iVar3);
  local_70 = rand();
  local_4c = rand();
  __isoc99_scanf(&DAT_00103004,&local_74);
  local_48 = local_74;
  __isoc99_scanf(&DAT_00103004,&local_74);
  local_58 = (ulong)local_74;
  iVar4 = rand();
  __isoc99_scanf(&DAT_00103004,&local_74);
  uVar1 = local_74;
  local_40 = (ulong)local_74;
  local_6c = rand();
  iVar5 = rand();
  local_44 = iVar5;
  __isoc99_scanf(&DAT_00103004,&local_74);
  local_50 = local_74;
  iVar6 = (iVar4 / iVar3) / iVar5;
  iVar7 = iVar6 + -5;
  iVar6 = iVar6 + 2;
  if (-1 < iVar7) {
    iVar6 = iVar7;
  }
  printf("%d",(ulong)(uint)(iVar6 >> 3),(long)(iVar4 / iVar3) % (long)iVar5 & 0xffffffff);
  uVar2 = local_4c;
  local_74 = local_74 & local_70;
  uVar10 = uVar1 - local_70;
  uVar8 = uVar10 ^ local_4c;
  local_70 = uVar8;
  printf("%d",(ulong)uVar8);
  printf("%d",(ulong)((local_74 | (uint)local_58) + 8));
  local_38 = (ulong)(uVar2 * (uint)local_60);
  uVar9 = uVar2 * (uint)local_60 + 8;
  local_68 = uVar9;
  printf("%d");
  local_64 = (int)uVar8 / (int)uVar2;
  uVar8 = (int)local_50 / local_64;
  uVar1 = (uint)((ulong)((long)(int)((uVar8 & uVar9) + uVar1 + 8) * -0x66666667) >> 0x20);
  uVar12 = ((uVar1 >> 2) - ((int)uVar1 >> 0x1f)) - local_74 & 8;
  printf("%d",(ulong)uVar12,(long)(int)local_50 % (long)local_64 & 0xffffffff);
  local_6c = (local_6c - local_74 ^ uVar2) * local_48 | 8;
  iVar3 = (uint)local_60 - local_68;
  uVar11 = local_70 & (uint)local_40;
  printf("%d",(ulong)(((uint)local_40 ^ (uint)local_58) + uVar8));
  uVar10 = uVar10 | uVar2;
  local_60 = (long)(int)uVar10;
  iVar6 = (int)((ulong)(local_60 * -0x66666667) >> 0x20);
  printf("%d",(ulong)(uint)((iVar6 >> 2) - (iVar6 >> 0x1f)));
  uVar1 = local_64 / (int)local_40;
  printf("%d",(ulong)(uVar12 + uVar2),(long)local_64 % (long)(int)local_40 & 0xffffffff);
  printf("%d",(ulong)uVar10);
  printf("%d",(ulong)(local_68 * uVar2));
  uVar9 = ((uVar12 + uVar2) - uVar1) + (int)local_38 + 8;
  printf("%d",(ulong)uVar9);
  uVar8 = local_6c;
  uVar11 = (uVar11 & iVar3 * uVar12) + local_64;
  iVar6 = ((int)uVar2 / (int)local_6c) * local_70 - uVar9;
  uVar9 = ((iVar6 / (int)uVar2 | uVar11) ^ 0xfffffff6) + local_70;
  printf("%d",(ulong)uVar9,(long)iVar6 % (long)(int)uVar2 & 0xffffffff);
  printf("%d",(ulong)(uVar9 * uVar1));
  uVar8 = uVar8 - local_68;
  printf("%d",(ulong)uVar8);
  iVar3 = local_44;
  uVar10 = (uVar8 ^ uVar11) * local_44;
  printf("%d",(ulong)((int)local_58 + (int)local_38 + 8));
  printf("%d",(ulong)((uVar1 & uVar2 + uVar8 ^ (uint)local_60) * iVar3));
  iVar6 = ((int)uVar9 / iVar3) / (int)local_6c;
  printf("%d",(ulong)((uVar2 + uVar8) * iVar3 * (iVar6 / (int)uVar9)),
         (long)iVar6 % (long)(int)uVar9 & 0xffffffff);
  return uVar10 & uVar11 ^ local_70;
}

int func8(undefined8 param_1,uint param_2,uint param_3)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint local_78;
  uint local_74;
  undefined8 local_70;
  ulong local_68;
  undefined8 local_60;
  ulong local_58;
  ulong local_50;
  ulong local_48;
  ulong local_40;
  ulong local_38;
  
  local_74 = param_2;
  local_70 = param_1;
  __isoc99_scanf(&DAT_00103004,&local_78);
  __isoc99_scanf(&DAT_00103004,&local_78);
  uVar2 = local_78;
  local_58 = (ulong)local_78;
  __isoc99_scanf(&DAT_00103004,&local_78);
  __isoc99_scanf(&DAT_00103004,&local_78);
  rand();
  uVar3 = rand();
  local_60 = CONCAT44(local_60._4_4_,uVar3);
  __isoc99_scanf(&DAT_00103004,&local_78);
  rand();
  __isoc99_scanf(&DAT_00103004,&local_78);
  uVar5 = local_78;
  __isoc99_scanf(&DAT_00103004,&local_78);
  local_48 = (ulong)local_78;
  uVar3 = uVar2 ^ param_3 | uVar3;
  printf("%d",(ulong)uVar3);
  local_68 = (ulong)(uVar5 ^ 0xfffffffe);
  local_50 = (ulong)(param_3 ^ 0xfffffffc);
  uVar7 = (uint)local_70 + (param_3 ^ 0xfffffffc);
  local_40 = (ulong)uVar7;
  iVar1 = (int)((ulong)((long)(int)((uVar2 - uVar7 | (uint)local_70) & 0xfffffffc) * -0x66666667) >>
               0x20);
  local_38 = (ulong)(uint)((iVar1 >> 2) - (iVar1 >> 0x1f));
  uVar4 = -((uVar2 ^ 10) - ((int)(uVar2 ^ 10) >> 0x1f) >> 1) & 0x12;
  printf("%d",(ulong)(uVar7 * 10));
  local_74 = ((int)local_48 * 0x50 | local_74) + uVar2;
  printf("%d",(ulong)(uint)((int)local_60 + (int)local_68));
  uVar5 = (uint)local_70;
  printf("%d",(ulong)(uVar5 * 0x12 | uVar7));
  printf("%d",(ulong)(uVar4 - 8));
  uVar3 = uVar2 ^ uVar5 ^ uVar3;
  printf("%d",(ulong)uVar3);
  iVar1 = (int)local_68;
  local_60 = (ulong)(iVar1 + uVar2);
  uVar5 = (int)local_50 + 0x12U ^ uVar3;
  printf("%d",(ulong)uVar5);
  uVar6 = (int)local_70 - (int)local_68;
  printf("%d",(ulong)uVar6);
  printf("%d",(ulong)(uVar5 * (int)local_38));
  printf("%d",(ulong)(iVar1 / (int)uVar3 ^ local_74 ^ 0x12));
  uVar7 = (uint)local_68;
  printf("%d",(ulong)(((10 - uVar2 ^ (uint)local_58 ^ uVar7) & uVar6) + uVar3));
  printf("%d",(ulong)((uVar4 + (int)local_40) * uVar3));
  uVar5 = (((int)local_70 - (int)local_60) + 10) * uVar7;
  printf("%d",(ulong)uVar5);
  return uVar5 * uVar7;
}


/home/eval/DF/de/clang/Ghidra/o1/555.txt
uint func0(uint param_1,uint param_2)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint local_74;
  uint local_70;
  uint local_6c;
  uint local_68;
  uint local_64;
  ulong local_60;
  uint local_54;
  uint local_50;
  uint local_4c;
  ulong local_48;
  ulong local_40;
  ulong local_38;
  
  local_6c = param_1;
  local_64 = param_2;
  rand();
  __isoc99_scanf(&DAT_00103004,&local_74);
  local_60 = (ulong)local_74;
  iVar1 = rand();
  rand();
  __isoc99_scanf(&DAT_00103004,&local_74);
  uVar4 = local_74;
  __isoc99_scanf(&DAT_00103004,&local_74);
  __isoc99_scanf(&DAT_00103004,&local_74);
  iVar2 = rand();
  uVar3 = rand();
  local_70 = uVar3;
  rand();
  local_4c = uVar4;
  local_60._0_4_ = iVar1 * uVar4 * (iVar2 + local_74 | local_74) ^ (uint)local_60;
  printf("%d",(ulong)(uint)local_60);
  local_48 = (ulong)((uint)local_60 & uVar3);
  printf("%d");
  printf("%d",0xfffffff3);
  local_40 = (ulong)(local_6c ^ 3);
  uVar3 = iVar2 - local_74 & (uint)local_60 & uVar3;
  local_38 = (ulong)uVar3;
  uVar8 = (uint)local_60;
  uVar7 = ((uVar4 & 0xfffffff3) * uVar3 & local_74) * uVar8 - uVar3;
  printf("%d",(ulong)uVar7);
  uVar4 = ((uint)local_60 | 3) * uVar7 * 3 | local_70;
  local_68 = uVar4;
  printf("%d",(ulong)uVar4);
  iVar1 = (int)(uVar4 & uVar8) / 3;
  iVar2 = (int)local_40;
  uVar5 = (iVar1 / (int)uVar3 & uVar8 | 4) * iVar2;
  printf("%d",(ulong)uVar5,(long)iVar1 % (long)(int)uVar3 & 0xffffffff);
  uVar4 = (uint)local_48 + uVar8 & uVar3 & 4;
  uVar8 = (uVar7 * iVar2 & (uVar7 | 7) & (uint)local_48) - uVar5 & uVar8;
  local_60 = local_60 & 0xffffffff00000000 | (ulong)(uVar8 + 3);
  local_54 = (iVar2 + 7) / (int)uVar3 - 4;
  local_50 = uVar4;
  printf("%d",(ulong)local_54,(long)(iVar2 + 7) % (long)(int)uVar3 & 0xffffffff);
  uVar7 = (uint)local_48;
  printf("%d",(ulong)((int)(uVar5 * 7) / (int)uVar4 & uVar7),
         (long)(int)(uVar5 * 7) % (long)(int)uVar4 & 0xffffffff);
  uVar9 = local_70 - local_6c;
  printf("%d",(ulong)uVar9);
  uVar4 = local_64;
  uVar6 = (uVar3 | local_64) + uVar7;
  printf("%d",(ulong)uVar6);
  iVar1 = ((local_4c & 7) * uVar4 + local_68 & uVar4 | local_70) * local_68;
  local_70 = iVar1 / (int)uVar7 ^ local_54;
  uVar3 = (uint)local_38;
  uVar4 = uVar3 ^ uVar9;
  printf("%d",(ulong)uVar4,(long)iVar1 % (long)(int)uVar7 & 0xffffffff);
  iVar1 = uVar5 * local_64;
  printf("%d",(ulong)(local_50 ^ uVar3));
  uVar3 = (uint)local_40;
  uVar9 = uVar9 | uVar3;
  printf("%d",(ulong)((int)uVar9 / (int)uVar4 | uVar6),
         (long)(int)uVar9 % (long)(int)uVar4 & 0xffffffff);
  uVar4 = uVar3 - local_68 | uVar6;
  printf("%d",(ulong)uVar4);
  printf("%d",(ulong)(uVar8 + uVar6 + 3));
  printf("%d",(ulong)(uint)((int)local_70 / (int)local_6c - iVar1),
         (long)(int)local_70 % (long)(int)local_6c & 0xffffffff);
  return uVar4 | (uint)local_60;
}