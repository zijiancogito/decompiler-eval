undefined4 func0(void)

{
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  
  local_c = f_rand_0();
  local_10 = 0x28;
  local_14 = f_rand_1();
  local_18 = f_rand_2();
  printf("BB: %d",0);
  local_1c = ((local_18 ^ local_c) * 0x28 + local_18) * local_14;
  if (local_c == 999) {
    printf("BB: %d",1);
    while ((int)local_18 < 0x138) {
      printf("BB: %d",2);
      local_1c = 0xfffffc18;
    }
    printf("BB: %d",3);
    local_14 = (local_1c ^ 0xffffffff | local_18) + 0x28;
    printf("BB: %d",4);
    local_c = ((int)(local_14 & 999) % (int)local_14 ^ 0x28U) - local_1c;
    local_10 = ((int)local_14 / (int)local_18 &
                (uint)((long)(CONCAT44((int)(local_c ^ 0xffffffff) >> 0x1f,local_c) ^ 0xffffffff) %
                      (long)(int)local_14) ^ 0xffffffff) * local_1c ^ 0x28;
    printf("BB: %d",6,(long)(int)local_14 % (long)(int)local_18 & 0xffffffff);
    local_18 = local_c * local_10 * local_1c;
  }
  printf("BB: %d",7);
  while (local_18 != 0x2a) {
    printf("BB: %d",8);
    while (local_14 == local_10) {
      printf("BB: %d",9);
      local_18 = (int)local_1c / (int)local_10 ^ local_c;
    }
    printf("BB: %d",10);
    local_1c = local_14 + local_c ^ local_1c;
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc,(long)(int)((int)local_c / 0x2a | 0x2a) % (long)(int)local_14 & 0xffffffff);
  return 0xffffffd5;
}
