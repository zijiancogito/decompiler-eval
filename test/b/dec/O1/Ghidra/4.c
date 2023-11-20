uint func0(void)

{
  bool bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  uint uVar6;
  ulong uVar7;
  int local_3c;
  
  uVar2 = f_rand_4();
  uVar7 = (ulong)uVar2;
  uVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_3();
  local_3c = f_rand_2();
  printf("BB: %d",0);
  if ((int)uVar2 <= local_3c) {
    do {
      printf("BB: %d",1);
      printf("BB: %d",3);
      uVar6 = (int)((int)uVar2 / 0x232 | uVar4) % (int)uVar2 - uVar2 & (uint)uVar7;
      uVar7 = (ulong)uVar6;
      if ((int)uVar3 < 0x232) {
        bVar5 = true;
        do {
          bVar1 = bVar5;
          printf("BB: %d",4);
          bVar5 = (int)uVar3 < 0x232;
        } while (bVar1);
        local_3c = (uVar2 + 0x232 | uVar6) - uVar2;
      }
      printf("BB: %d",5);
      uVar2 = (int)uVar3 % (int)uVar2 + uVar2 & 300;
    } while ((int)uVar2 <= local_3c);
  }
  printf("BB: %d",6);
  if ((int)uVar4 < 0x3c2) {
    printf("BB: %d",7);
    if (0x220 < (int)uVar4) {
      do {
        printf("BB: %d",8);
        local_3c = (uVar4 ^ uVar3) + (int)uVar7;
        uVar7 = (long)((int)uVar7 * local_3c) / (long)(int)uVar2 & 0xffffffff;
      } while (0x220 < (int)uVar4);
    }
    printf("BB: %d",9);
    if ((int)uVar3 <= local_3c) {
      bVar5 = false;
      do {
        printf("BB: %d",10);
        bVar1 = !bVar5;
        bVar5 = local_3c < (int)uVar3;
      } while (bVar1);
    }
    printf("BB: %d",0xb);
    uVar4 = uVar4 - local_3c;
  }
  else {
    printf("BB: %d",0xc);
    uVar4 = -uVar2;
  }
  printf("BB: %d",0xd);
  printf("BB: %d",0xe);
  return ~uVar4;
}
