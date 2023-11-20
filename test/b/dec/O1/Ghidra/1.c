uint func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  
  uVar3 = f_rand_2();
  iVar4 = f_rand_1();
  uVar5 = f_rand_0();
  printf("BB: %d",0);
  iVar6 = (int)((ulong)((long)(int)(uVar5 + 0x5b) * -0x6a5fda97) >> 0x20) + uVar5 + 0x5b;
  if (((iVar6 >> 7) - (iVar6 >> 0x1f)) * -0xdb + uVar5 + 0x5b == uVar3) {
    printf("BB: %d",1);
    uVar5 = (uVar5 * uVar5 * (uVar5 + 0x37f) - uVar3) * uVar3;
  }
  else {
    printf("BB: %d",3);
    if (0x22b < (int)uVar3) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",4);
        bVar2 = 0x22b < (int)uVar3;
      } while (bVar1);
    }
    printf("BB: %d",5);
    if (iVar4 < (int)uVar5) {
      do {
        uVar5 = 0;
        printf("BB: %d",6);
      } while (iVar4 < 0);
    }
    printf("BB: %d",7);
    printf("BB: %d",(ulong)(0x355 < (int)uVar5 ^ 9));
    printf("BB: %d",10);
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return uVar5 | uVar3;
}
