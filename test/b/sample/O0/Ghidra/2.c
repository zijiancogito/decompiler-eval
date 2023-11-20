uint func0(void)

{
  uint uVar1;
  uint uVar2;
  int iVar3;
  uint local_20;
  uint local_10;
  
  uVar1 = f_rand_1();
  local_10 = 0x318;
  uVar2 = f_rand_3();
  f_rand_4();
  local_20 = f_rand_0();
  iVar3 = f_rand_2();
  printf("BB: %d",0);
  while ((int)local_10 < 0x3c7) {
    printf("BB: %d",1);
    local_10 = uVar1 + uVar2 & uVar2;
    local_20 = ((int)(((uVar1 - uVar2) + iVar3 ^ 0x3c6) + 0x3c6 & local_10) % (int)uVar1) * uVar1 |
               uVar1;
  }
  printf("BB: %d",2);
  printf("BB: %d",3);
  return uVar2 ^ local_20;
}
