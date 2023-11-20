uint func0(void)

{
  ulong uVar1;
  bool bVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  
  iVar3 = f_rand_4();
  uVar4 = f_rand_0();
  uVar5 = f_rand_2();
  iVar6 = f_rand_1();
  iVar7 = f_rand_3();
  printf("BB: %d",0);
  iVar8 = -0x36562 % iVar6;
  bVar2 = false;
  do {
    printf("BB: %d",1);
    while (0x100 < iVar3) {
      printf("BB: %d",2);
      uVar4 = (iVar7 / iVar8 - iVar8) % iVar7;
      iVar8 = (uVar4 & iVar6 - 0x100U) - iVar6;
    }
    printf("BB: %d",3);
    uVar9 = (uint)(0x100 % (long)iVar3);
    if (!bVar2) {
      do {
        printf("BB: %d",4);
      } while (uVar4 != 0xfffffe3c);
      uVar1 = (long)iVar7 % (long)((int)(0x100 / (long)iVar3) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff;
      uVar9 = (uint)((long)uVar1 % (long)(int)uVar5);
      iVar8 = (int)((long)uVar1 / (long)(int)uVar5);
    }
    printf("BB: %d",5,(ulong)uVar9);
    uVar4 = (int)uVar4 % 0x1c3 + 0x100;
    bVar2 = true;
  } while (iVar8 < 0x1c4);
  printf("BB: %d",6);
  if (iVar3 < 0x289) {
    printf("BB: %d",7);
    do {
      printf("BB: %d",8);
    } while( true );
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return uVar5 ^ 0x100;
}
