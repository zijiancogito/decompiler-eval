uint func0(void)

{
  ulong uVar1;
  ulong uVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  bool bVar8;
  
  iVar3 = f_rand_4();
  iVar4 = f_rand_0();
  uVar5 = f_rand_2();
  iVar6 = f_rand_1();
  iVar7 = f_rand_3();
  printf("BB: %d",0);
  iVar6 = -0x36562 % iVar6;
  bVar8 = false;
  do {
    printf("BB: %d",1);
    if (0x100 < iVar3) {
      do {
        printf("BB: %d",2);
      } while( true );
    }
    printf("BB: %d",3);
    uVar2 = 0x100 % (long)iVar3;
    if (!bVar8) {
      do {
        printf("BB: %d",4);
      } while (iVar4 != -0x1c4);
      uVar2 = (long)iVar7 % (long)((int)(0x100 / (long)iVar3) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar2 >> 0x1f) << 0x20 | uVar2 & 0xffffffff;
      uVar2 = (long)uVar1 % (long)(int)uVar5;
      iVar6 = (int)((long)uVar1 / (long)(int)uVar5);
    }
    printf("BB: %d",5,uVar2 & 0xffffffff);
    iVar4 = iVar4 % 0x1c3 + 0x100;
    bVar8 = true;
  } while (iVar6 < 0x1c4);
  printf("BB: %d",6);
  if (0x288 < iVar3) {
    printf("BB: %d",0xc);
    printf("BB: %d",0xd);
    return uVar5 ^ 0x100;
  }
  printf("BB: %d",7);
  do {
    printf("BB: %d",8);
  } while( true );
}
