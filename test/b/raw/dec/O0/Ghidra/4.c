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


