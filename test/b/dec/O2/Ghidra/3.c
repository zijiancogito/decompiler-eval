uint func0(void)

{
  ulong uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  bool bVar8;
  
  iVar2 = f_rand_4();
  iVar3 = f_rand_0();
  uVar4 = f_rand_2();
  iVar5 = f_rand_1();
  iVar6 = f_rand_3();
  printf("BB: %d",0);
  iVar5 = -0x36562 % iVar5;
  bVar8 = false;
  do {
    printf("BB: %d",1);
    if (0x100 < iVar2) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    printf("BB: %d",3);
    uVar7 = (uint)(0x100 % (long)iVar2);
    if (!bVar8) {
      do {
        printf("BB: %d",4);
      } while (iVar3 != -0x1c4);
      uVar1 = (long)iVar6 % (long)((int)(0x100 / (long)iVar2) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff;
      uVar7 = (uint)((long)uVar1 % (long)(int)uVar4);
      iVar5 = (int)((long)uVar1 / (long)(int)uVar4);
    }
    printf("BB: %d",5,(ulong)uVar7);
    iVar3 = iVar3 % 0x1c3 + 0x100;
    bVar8 = true;
  } while (iVar5 < 0x1c4);
  printf("BB: %d",6);
  if (0x288 < iVar2) {
    printf("BB: %d",0xc);
    printf("BB: %d",0xd);
    return uVar4 ^ 0x100;
  }
  printf("BB: %d",7);
  do {
    printf("BB: %d",8);
  } while( true );
}
