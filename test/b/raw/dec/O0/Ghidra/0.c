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



int func0(void)

{
  ulong uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint local_28;
  uint local_24;
  uint local_20;
  uint local_1c;
  uint local_14;
  uint local_10;
  uint local_c;
  
  local_c = 0x12e;
  local_10 = f_rand_4();
  uVar2 = f_rand_3();
  local_1c = f_rand_2();
  local_20 = f_rand_1();
  local_24 = f_rand_0();
  printf("BB: %d",0);
  local_28 = (local_20 & 0xe) * local_24 | uVar2;
  uVar3 = (int)((long)(CONCAT44((int)(local_1c ^ 0xffffffff) >> 0x1f,local_1c) ^ 0xffffffff) % 0x12e
               ) + 0x2cfU & local_10;
  local_14 = (local_24 & uVar2 | uVar2) & uVar3;
  if (local_20 == 0x21f) {
    printf("BB: %d",1);
    local_28 = (local_14 | local_10 | 0x2cf) & uVar3;
    uVar2 = local_1c - 0x2d0;
    local_10 = local_24 ^ 0xffffffff;
    while (uVar3 == 0x39d) {
      printf("BB: %d",2);
      local_c = local_10 * local_c - local_20;
      uVar4 = local_20 ^ 0xffffffff;
      local_20 = (int)(0x39d - local_28) % (int)local_20 & uVar2 & local_20;
      local_28 = (int)((int)(local_28 ^ local_14 ^ local_c) / (int)local_14 | uVar4) / (int)local_24
      ;
      local_1c = (local_10 & 0x2cf) * local_24 ^ local_1c;
    }
    printf("BB: %d",3);
    while ((int)local_24 < 0x262) {
      printf("BB: %d",4);
      local_28 = (uVar2 | 0x2cf) * local_28;
    }
  }
  printf("BB: %d",5);
  while (local_10 != 0x273) {
    printf("BB: %d",6);
    while ((int)local_10 < 0x160) {
      printf("BB: %d",7);
      local_14 = local_10 ^ 0xffffffff;
      local_24 = (int)local_c % (int)uVar3 & local_c;
    }
    printf("BB: %d",8);
    uVar1 = (long)(int)(local_c ^ 0x2cf) % 0x2cf;
    if (0x2cf < (int)local_c) {
      printf("BB: %d",9);
      local_14 = (int)local_10 / (int)uVar3 & local_1c;
      local_20 = (uint)((long)(CONCAT44((int)(uVar3 ^ 0xffffffff) >> 0x1f,uVar3) ^ 0xffffffff) %
                       (long)(int)local_c);
      uVar1 = (long)(int)((local_c - local_1c) - local_28) % (long)(int)uVar1;
    }
    printf("BB: %d",10,uVar1 & 0xffffffff);
    local_28 = (int)(uVar3 * local_20 ^ uVar3) % (int)uVar3;
  }
  printf("BB: %d",0xb);
  return (int)((local_1c - 0x2cf ^ local_20) & local_24) % (int)local_14;
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


