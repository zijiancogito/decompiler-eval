uint func0(void)

{
  ulong uVar1;
  ulong uVar2;
  uint uVar3;
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_10;
  uint local_c;
  
  local_c = f_rand_4();
  local_10 = f_rand_0();
  uVar3 = f_rand_1();
  local_18 = f_rand_3();
  local_1c = 300;
  local_20 = 0x232;
  local_24 = f_rand_2();
  printf("BB: %d",0);
  for (; (int)local_10 <= local_24; local_10 = (int)uVar3 % (int)local_10 + local_10 & local_1c) {
    printf("BB: %d",1);
    while ((int)local_20 < 0x21) {
      printf("BB: %d",2);
      local_18 = (int)uVar3 / (int)local_20 | local_1c;
      local_20 = (local_18 ^ 0xffffffff) - local_10;
      local_1c = local_20 ^ 0xffffffff;
    }
    printf("BB: %d",3);
    local_c = (int)((int)local_10 / (int)local_20 | local_18) % (int)local_10 - local_10 & local_c;
    while ((int)uVar3 < (int)local_20) {
      printf("BB: %d",4);
      local_24 = (local_20 + local_10 | local_c) - local_10;
    }
    printf("BB: %d",5);
  }
  printf("BB: %d",6);
  if ((int)local_18 < 0x3c2) {
    printf("BB: %d",7);
    while (0x220 < (int)local_18) {
      printf("BB: %d",8);
      local_24 = (local_18 ^ uVar3) + local_c;
      local_c = (int)(local_c * local_24) / (int)local_10;
    }
    printf("BB: %d",9);
    while ((int)uVar3 <= local_24) {
      printf("BB: %d",10);
    }
    printf("BB: %d",0xb);
    uVar1 = CONCAT44((int)(local_20 ^ 0xffffffff) >> 0x1f,local_20) ^ 0xffffffff;
    uVar2 = (long)uVar1 % (long)(int)local_20;
    local_18 = local_24 * (int)((long)uVar1 / (long)(int)local_20) + local_18;
  }
  else {
    printf("BB: %d",0xc);
    local_18 = -local_10;
    uVar2 = (long)(int)((int)local_1c / (int)local_18 | local_18) % (long)(int)uVar3;
  }
  printf("BB: %d",0xd,uVar2 & 0xffffffff);
  printf("BB: %d",0xe);
  return local_18 ^ 0xffffffff;
}
