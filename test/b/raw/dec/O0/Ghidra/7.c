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



// WARNING: Removing unreachable block (ram,0x001012b7)

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


