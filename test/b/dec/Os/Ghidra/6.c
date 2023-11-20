uint func0(void)

{
  ulong uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  ulong uVar7;
  uint uVar8;
  uint uVar9;
  
  uVar2 = f_rand_0();
  iVar3 = f_rand_4();
  uVar4 = f_rand_2();
  uVar7 = (ulong)uVar4;
  uVar5 = f_rand_1();
  uVar6 = f_rand_3();
  printf("BB: %d",0);
  uVar9 = (int)uVar6 % 0x12a + 0x12a;
  if ((int)uVar9 < iVar3) {
    printf("BB: %d",5);
    if ((int)uVar6 < (int)uVar4) {
      do {
        printf("BB: %d",6);
      } while( true );
    }
    printf("BB: %d",7);
    uVar8 = uVar9 ^ uVar5;
    uVar4 = uVar8 * uVar2 ^ uVar6;
    if ((int)uVar5 < 0x197) {
      uVar4 = uVar6 * uVar9 & uVar2;
    }
    else {
      uVar5 = uVar4 * uVar4;
      do {
        printf("BB: %d",8);
      } while (0x196 < uVar5);
      uVar4 = uVar4 | ~(uVar8 * ((int)uVar6 / (int)uVar4 | uVar6));
    }
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar5 < 0x2ae) {
      iVar3 = uVar4 + uVar6 + (uVar9 ^ uVar6);
    }
    else {
      uVar4 = (uVar2 + iVar3) * iVar3;
      do {
        printf("BB: %d",2);
        iVar3 = (int)uVar7;
        uVar5 = (int)(0x12a % (long)(int)uVar9) - iVar3;
        uVar1 = (long)((ulong)(uint)((int)(0x12a / (long)iVar3) >> 0x1f) << 0x20 |
                      0x12a / (long)iVar3 & 0xffffffffU) % (long)iVar3;
        uVar7 = uVar1 & 0xffffffff;
        uVar9 = uVar4;
      } while (0x2ad < (int)uVar5);
      iVar3 = (int)uVar1 + (int)uVar2 % (int)uVar5;
    }
    printf("BB: %d",3);
    if (uVar5 == 0x12a) {
      uVar4 = (((int)(iVar3 + uVar9) % (int)uVar2) * 0x12a) % (int)uVar5 + 0x12a;
      uVar5 = (uVar9 - uVar2) + uVar4 + 1;
      do {
        printf("BB: %d",4);
      } while (uVar5 == 0x12a);
    }
    else {
      uVar4 = ~uVar9 + uVar5;
    }
  }
  printf("BB: %d",9);
  iVar3 = (uVar9 + 0x12a | 1) + uVar4;
  uVar4 = uVar4 - uVar5 ^ uVar4;
  printf("BB: %d",10,(long)(int)uVar4 % (long)iVar3 & 0xffffffff);
  return ((int)uVar4 / iVar3 + uVar9 + 0x12a | uVar9 + 0x12a) ^ 0x12a;
}
