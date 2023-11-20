undefined8 func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint local_3c;
  
  uVar3 = f_rand_0();
  uVar4 = f_rand_1();
  uVar5 = f_rand_2();
  printf("BB: %d",0);
  uVar6 = (uVar5 + (uVar5 ^ uVar3) * 0x28) * uVar4;
  if (uVar3 == 999) {
    printf("BB: %d",1);
    if ((int)uVar5 < 0x138) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",2);
        bVar2 = (int)uVar5 < 0x138;
      } while (bVar1);
      uVar6 = 0xfffffc18;
    }
    printf("BB: %d",3);
    uVar4 = (uVar5 | ~uVar6) + 0x28;
    printf("BB: %d",4);
    uVar3 = ((uint)((long)(ulong)(uVar4 & 999) % (long)(int)uVar4) ^ 0x28) - uVar6;
    local_3c = ~((int)uVar4 / (int)uVar5 & (int)~uVar3 % (int)uVar4) * uVar6 ^ 0x28;
    printf("BB: %d",6,(long)(int)uVar4 % (long)(int)uVar5 & 0xffffffff);
    uVar5 = uVar3 * uVar6 * local_3c;
  }
  else {
    local_3c = 0x28;
  }
  printf("BB: %d",7);
  if (uVar5 != 0x2a) {
    do {
      printf("BB: %d",8);
      if (uVar4 == local_3c) {
        bVar2 = true;
        do {
          bVar1 = bVar2;
          printf("BB: %d",9);
          bVar2 = uVar4 == local_3c;
        } while (bVar1);
        uVar5 = (int)uVar6 / (int)local_3c ^ uVar3;
      }
      printf("BB: %d",10);
      uVar6 = uVar6 ^ uVar3 + uVar4;
    } while (uVar5 != 0x2a);
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return 0xffffffd5;
}
