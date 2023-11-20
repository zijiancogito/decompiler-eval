uint func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  
  uVar3 = f_rand_3();
  uVar4 = f_rand_0();
  f_rand_2();
  uVar5 = f_rand_4();
  uVar6 = f_rand_1();
  printf("BB: %d",0);
  uVar8 = ~uVar5;
  uVar10 = uVar3 + uVar8 ^ uVar3;
  if (uVar3 + uVar8 == 0) {
    printf("BB: %d",8);
    if ((int)uVar4 < (int)uVar3) {
      printf("BB: %d",10);
      uVar3 = (int)(uVar6 ^ uVar3) % (int)~uVar3;
    }
    else {
      printf("BB: %d",9);
      uVar10 = ~uVar10;
      uVar3 = uVar4 - uVar10 & uVar3;
      uVar5 = (~uVar3 + uVar10) * uVar6;
    }
    printf("BB: %d",0xb);
    uVar3 = uVar3 + uVar5 ^ uVar3;
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar4 < (int)uVar8) {
      printf("BB: %d",2);
      uVar7 = uVar6 ^ uVar5;
      uVar5 = uVar5 | uVar6;
      uVar9 = ((uVar5 | uVar4) + uVar10) * uVar4;
      uVar3 = (uVar10 & uVar6) + ((uVar7 - uVar3) * uVar10 ^ uVar8 | uVar6);
    }
    else {
      printf("BB: %d",3);
      uVar3 = (int)(uVar3 * uVar10 & uVar8) % (int)uVar10;
      uVar9 = uVar4 * uVar6 + uVar8;
      uVar4 = (uVar3 | uVar9) ^ uVar5;
    }
    printf("BB: %d",4);
    if (0x15d < (int)uVar3) {
      do {
        printf("BB: %d",5);
        uVar9 = (int)uVar9 / (int)uVar10 ^ uVar4;
        uVar3 = ((int)(~((uVar9 | ~uVar4 & uVar10) ^ uVar6) - uVar5) % (int)uVar5) * uVar5 ^ uVar5;
      } while (0x15d < (int)uVar3);
    }
    printf("BB: %d",6);
    if (0x2f0 < (int)uVar9) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",7);
        bVar2 = 0x2f0 < (int)uVar9;
      } while (bVar1);
    }
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return (int)((-uVar3 | 1) - uVar10) % (int)uVar10 + uVar5 | uVar5;
}
