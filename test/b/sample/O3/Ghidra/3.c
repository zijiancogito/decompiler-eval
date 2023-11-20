void func0(void)

{
  ulong uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  ulong uVar7;
  bool bVar8;
  
  iVar2 = f_rand_4();
  iVar3 = f_rand_0();
  iVar4 = f_rand_2();
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
    uVar7 = 0x100 % (long)iVar2 & 0xffffffff;
    if (!bVar8) {
      if (iVar3 != -0x1c4) {
        do {
          printf("BB: %d",4);
        } while( true );
      }
      printf("BB: %d",4,uVar7);
      uVar7 = (long)iVar6 % (long)((int)(0x100 / (long)iVar2) + 0x362);
      uVar1 = (ulong)(uint)((int)uVar7 >> 0x1f) << 0x20 | uVar7 & 0xffffffff;
      uVar7 = (long)uVar1 % (long)iVar4 & 0xffffffff;
      iVar5 = (int)((long)uVar1 / (long)iVar4);
    }
    printf("BB: %d",5,uVar7);
    iVar3 = iVar3 % 0x1c3 + 0x100;
    bVar8 = true;
  } while (iVar5 < 0x1c4);
  printf("BB: %d",6);
  printf("BB: %d",7);
  do {
    printf("BB: %d",8);
  } while( true );
}
