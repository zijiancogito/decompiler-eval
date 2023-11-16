#include "out.h"



int _init(EVP_PKEY_CTX *ctx)

{
  int iVar1;
  
  iVar1 = __gmon_start__();
  return iVar1;
}



void FUN_00101020(void)

{
                    // WARNING: Treating indirect jump as call
  (*(code *)(undefined *)0x0)();
  return;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int printf(char *__format,...)

{
  int iVar1;
  
  iVar1 = printf(__format);
  return iVar1;
}



// WARNING: Unknown calling convention -- yet parameter storage is locked

int rand(void)

{
  int iVar1;
  
  iVar1 = rand();
  return iVar1;
}



void __cxa_finalize(void)

{
  __cxa_finalize();
  return;
}



void processEntry _start(undefined8 param_1,undefined8 param_2)

{
  undefined auStack_8 [8];
  
  __libc_start_main(main,param_2,&stack0x00000008,0,0,param_1,auStack_8);
  do {
                    // WARNING: Do nothing block with infinite loop
  } while( true );
}



// WARNING: Removing unreachable block (ram,0x001010a3)
// WARNING: Removing unreachable block (ram,0x001010af)

void deregister_tm_clones(void)

{
  return;
}



// WARNING: Removing unreachable block (ram,0x001010e4)
// WARNING: Removing unreachable block (ram,0x001010f0)

void register_tm_clones(void)

{
  return;
}



void __do_global_dtors_aux(void)

{
  if (completed_0 != '\0') {
    return;
  }
  __cxa_finalize(__dso_handle);
  deregister_tm_clones();
  completed_0 = 1;
  return;
}



void frame_dummy(void)

{
  register_tm_clones();
  return;
}



uint func0(void)

{
  uint uVar1;
  uint uVar2;
  ulong uVar3;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  
  uVar1 = f_rand_3();
  local_10 = f_rand_0();
  f_rand_2();
  local_18 = f_rand_4();
  local_1c = f_rand_1();
  printf("BB: %d",0);
  local_14 = (local_18 ^ 0xffffffff) + uVar1 ^ uVar1;
  if (uVar1 == local_14) {
    printf("BB: %d",8);
    if ((int)local_10 < (int)uVar1) {
      printf("BB: %d",10);
      uVar2 = uVar1 ^ 0xffffffff;
      local_10 = (int)(local_1c ^ 0xffffffff ^ uVar2) % (int)uVar2;
      uVar3 = (long)((ulong)(uint)((int)((long)(int)local_10 / (long)(int)uVar2) >> 0x1f) << 0x20 |
                    (long)(int)local_10 / (long)(int)uVar2 & 0xffffffffU) % (long)(int)uVar1 &
              0xffffffff;
    }
    else {
      printf("BB: %d",9);
      local_14 = local_14 ^ 0xffffffff;
      local_10 = local_10 - local_14 & uVar1;
      local_18 = ((local_10 ^ 0xffffffff) + local_14) * local_1c;
      uVar3 = (ulong)((int)((int)((local_14 ^ local_18) * uVar1 - uVar1) % (int)local_1c + local_10)
                      % (int)local_18 - local_18);
    }
    printf("BB: %d",0xb,uVar3);
    local_c = local_18 + local_10 ^ local_10;
  }
  else {
    printf("BB: %d",1);
    local_20 = local_18 ^ 0xffffffff;
    if ((int)local_10 < (int)local_20) {
      printf("BB: %d",2);
      local_c = ((local_1c ^ local_18) - uVar1) * local_14 ^ local_20 | local_1c;
      local_18 = local_18 | local_1c;
      local_20 = ((local_18 | local_10) + local_14) * local_10;
      local_14 = (local_14 | local_c) & local_14;
      local_c = (local_1c & local_14) + local_c;
    }
    else {
      printf("BB: %d",3);
      local_c = (int)((local_14 * uVar1 | local_18) - local_18) % (int)local_14;
      local_20 = local_10 * local_1c + local_20;
      local_10 = (local_c | local_20) ^ local_18;
    }
    printf("BB: %d",4);
    for (; 0x15d < (int)local_c;
        local_c = ((int)((((local_10 ^ local_14) & local_14 | local_20) ^ local_1c ^ 0xffffffff) -
                        local_c) % (int)local_18) * local_c ^ local_c) {
      printf("BB: %d",5);
      local_20 = (int)local_20 / (int)local_14 ^ local_10;
      local_c = (local_18 | local_20) & local_18;
    }
    printf("BB: %d",6);
    uVar3 = (long)(int)((local_10 ^ 0xffffffff) * local_1c - local_c) % (long)(int)local_18;
    while (0x2f0 < (int)local_20) {
      printf("BB: %d",7,uVar3 & 0xffffffff);
      uVar1 = (local_20 ^ 0xffffffff) & local_c;
      uVar3 = (long)(int)(uVar1 | local_1c | uVar1 | local_14) % (long)(int)local_c;
      local_1c = local_18 + local_c;
    }
  }
  printf("BB: %d",0xc);
  printf("BB: %d",0xd);
  return local_18 +
         (int)(((int)local_c / (int)local_c | ((local_14 ^ 0xffffffff) + local_14) * local_c) -
              local_14) % (int)local_14 | local_18;
}



undefined8 main(void)

{
  uint uVar1;
  
  uVar1 = func0();
  printf("%d",(ulong)uVar1);
  return 0;
}



int f_rand_0(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_0: %d",0);
  return iVar1;
}



int f_rand_1(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_1: %d",1);
  return iVar1;
}



int f_rand_2(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_2: %d",2);
  return iVar1;
}



int f_rand_3(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_3: %d",3);
  return iVar1;
}



int f_rand_4(void)

{
  int iVar1;
  
  iVar1 = rand();
  printf("f_rand_4: %d",4);
  return iVar1;
}



void _fini(void)

{
  return;
}


