uint func0(void)

{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  
  uVar1 = f_rand_3();
  uVar2 = f_rand_0();
  f_rand_2();
  uVar3 = f_rand_4();
  uVar4 = f_rand_1();
  printf("BB: %d",0);
  uVar6 = ~uVar3;
  uVar8 = uVar1 + uVar6 ^ uVar1;
  if (uVar1 + uVar6 == 0) {
    printf("BB: %d",8);
    if ((int)uVar2 < (int)uVar1) {
      printf("BB: %d",10);
      uVar1 = (int)(uVar4 ^ uVar1) % (int)~uVar1;
    }
    else {
      printf("BB: %d",9);
      uVar8 = ~uVar8;
      uVar1 = uVar2 - uVar8 & uVar1;
      uVar3 = (~uVar1 + uVar8) * uVar4;
    }
    printf("BB: %d",0xb);
    uVar1 = uVar3 + uVar1 ^ uVar1;
  }
  else {
    printf("BB: %d",1);
    if ((int)uVar2 < (int)uVar6) {
      printf("BB: %d",2);
      uVar5 = uVar4 ^ uVar3;
      uVar3 = uVar3 | uVar4;
      uVar7 = ((uVar3 | uVar2) + uVar8) * uVar2;
      uVar1 = (uVar8 & uVar4) + ((uVar5 - uVar1) * uVar8 ^ uVar6 | uVar4);
    }
    else {
      printf("BB: %d",3);
      uVar1 = (int)(uVar1 * uVar8 & uVar6) % (int)uVar8;
      uVar7 = uVar2 * uVar4 + uVar6;
      uVar2 = (uVar1 | uVar7) ^ uVar3;
    }
    printf("BB: %d",4);
    if (0x15d < (int)uVar1) {
      do {
        printf("BB: %d",5);
        uVar7 = (int)uVar7 / (int)uVar8 ^ uVar2;
        uVar1 = ((int)(~((uVar7 | ~uVar2 & uVar8) ^ uVar4) - uVar3) % (int)uVar3) * uVar3 ^ uVar3;
      } while (0x15d < (int)uVar1);
    }
    printf("BB: %d",6);
    if (0x2f0 < (int)uVar7) {
      printf("BB: %d",7);
      do {
        printf("BB: %d",7);
      } while( true );
    }
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return (int)((-uVar1 | 1) - uVar8) % (int)uVar8 + uVar3 | uVar3;
}
