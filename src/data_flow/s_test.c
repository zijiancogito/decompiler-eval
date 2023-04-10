int func0(uint param_1)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint local_38;
  uint local_34;
  
  iVar1 = rand();
  uVar2 = rand();
  iVar3 = rand();
  uVar4 = rand();
  uVar5 = rand();
  uVar6 = rand();
  __isoc99_scanf(&DAT_00103004,&local_38);
  uVar7 = uVar4 & uVar2 | 2;
  local_38 = uVar7 * -10 ^ local_38;
  rand();
  rand();
  __isoc99_scanf(&DAT_00103004,&local_34);
  printf("%d",(ulong)(((uVar6 | 2) + iVar1 & local_34) * uVar2));
  local_34 = local_34 - 10;
  printf("%d",(ulong)local_34);
  printf("%d",(ulong)(uVar2 + uVar4));
  uVar6 = local_34 & uVar4;
  printf("%d",(ulong)((iVar3 + uVar2) - uVar4));
  printf("%d",(ulong)local_38);
  printf("%d",(ulong)(uVar5 | 2));
  uVar11 = uVar5 | 2 | param_1;
  uVar2 = (local_38 ^ 0xfffffff6) - local_34;
  printf("%d",(ulong)uVar2);
  uVar2 = (int)(uVar11 * uVar7 & uVar2) / (int)param_1;
  uVar8 = ((int)(uVar4 + local_38) / (int)uVar7) * param_1;
  printf("%d",(ulong)uVar8,(long)(int)(uVar4 + local_38) % (long)(int)uVar7 & 0xffffffff);
  uVar7 = ((local_34 | uVar2) & local_38) - uVar2;
  printf("%d",(ulong)uVar7);
  uVar10 = (uVar6 ^ uVar11) * uVar8;
  printf("%d",(ulong)uVar10);
  uVar9 = (uVar2 & 0xfffffffd) * uVar6;
  printf("%d",(ulong)uVar9);
  printf("%d",(ulong)(local_38 & (int)(uVar2 - uVar5) / (int)uVar11),
         (long)(int)(uVar2 - uVar5) % (long)(int)uVar11 & 0xffffffff);
  uVar2 = uVar9 * uVar4 - (uVar6 + uVar10);
  printf("%d",(ulong)uVar2);
  printf("%d",(ulong)(uVar2 * ((int)param_1 / (int)uVar7)),
         (long)(int)param_1 % (long)(int)uVar7 & 0xffffffff);
  printf("%d",(ulong)((uVar11 - uVar8 ^ param_1) * (uVar4 ^ param_1)));
  return uVar10 * uVar4;
}