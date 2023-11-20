uint func0(void)

{
  ulong uVar1;
  bool bVar2;
  bool bVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  ulong uVar9;
  uint uVar10;
  uint uVar11;
  
  uVar4 = f_rand_0();
  iVar5 = f_rand_4();
  uVar6 = f_rand_2();
  uVar9 = (ulong)uVar6;
  uVar7 = f_rand_1();
  uVar8 = f_rand_3();
  printf("BB: %d",0);
  uVar11 = (int)uVar8 % 0x12a + 0x12a;
  if ((int)uVar11 < iVar5) {
    printf("BB: %d",5);
    if ((int)uVar8 < (int)uVar6) {
      bVar3 = true;
      do {
        bVar2 = bVar3;
        printf("BB: %d",6);
        bVar3 = (int)uVar8 < (int)uVar6;
      } while (bVar2);
    }
    printf("BB: %d",7);
    uVar10 = uVar11 ^ uVar7;
    uVar6 = uVar10 * uVar4 ^ uVar8;
    if ((int)uVar7 < 0x197) {
      uVar6 = uVar8 * uVar11 & uVar4;
    }
    else {
      uVar7 = uVar6 * uVar6;
      do {
        printf("BB: %d",8);
      } while (0x196 < uVar7);
      uVar6 = uVar6 | ~(uVar10 * ((int)uVar8 / (int)uVar6 | uVar8));
    }
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar7 < 0x2ae) {
      iVar5 = uVar6 + uVar8 + (uVar11 ^ uVar8);
    }
    else {
      uVar6 = (uVar4 + iVar5) * iVar5;
      do {
        printf("BB: %d",2);
        iVar5 = (int)uVar9;
        uVar7 = (int)(0x12a % (long)(int)uVar11) - iVar5;
        uVar1 = (long)((ulong)(uint)((int)(0x12a / (long)iVar5) >> 0x1f) << 0x20 |
                      0x12a / (long)iVar5 & 0xffffffffU) % (long)iVar5;
        uVar9 = uVar1 & 0xffffffff;
        uVar11 = uVar6;
      } while (0x2ad < (int)uVar7);
      iVar5 = (int)uVar1 + (int)uVar4 % (int)uVar7;
    }
    printf("BB: %d",3);
    if (uVar7 == 0x12a) {
      uVar6 = (((int)(iVar5 + uVar11) % (int)uVar4) * 0x12a) % (int)uVar7 + 0x12a;
      uVar7 = (uVar11 - uVar4) + uVar6 + 1;
      do {
        printf("BB: %d",4);
      } while (uVar7 == 0x12a);
    }
    else {
      uVar6 = ~uVar11 + uVar7;
    }
  }
  printf("BB: %d",9);
  iVar5 = (uVar11 + 0x12a | 1) + uVar6;
  uVar6 = uVar6 - uVar7 ^ uVar6;
  printf("BB: %d",10,(long)(int)uVar6 % (long)iVar5 & 0xffffffff);
  return ((int)uVar6 / iVar5 + uVar11 + 0x12a | uVar11 + 0x12a) ^ 0x12a;
}
