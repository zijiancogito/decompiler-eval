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



// WARNING: Removing unreachable block (ram,0x001013d8)
// WARNING: Removing unreachable block (ram,0x00101451)
// WARNING: Removing unreachable block (ram,0x001013f5)
// WARNING: Removing unreachable block (ram,0x001014a9)

void func0(void)

{
  ulong uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint local_2c;
  uint local_24;
  uint local_18;
  uint local_10;
  uint local_c;
  
  local_10 = f_rand_3();
  iVar2 = f_rand_2();
  uVar3 = f_rand_1();
  uVar4 = f_rand_4();
  local_24 = f_rand_0();
  printf("BB: %d",0);
  local_c = (local_24 | 0x309) & uVar4;
  local_2c = local_c - 0x3d6 ^ local_10;
  do {
    printf("BB: %d",1);
    local_18 = uVar3 * iVar2 & local_10;
    if (uVar3 == local_24) {
      printf("BB: %d",3);
      local_2c = (uint)((long)(CONCAT44((int)(local_2c ^ 0xffffffff) >> 0x1f,local_2c) ^ 0xffffffff)
                       / (long)(int)uVar3);
      uVar5 = (local_10 + local_24) * local_2c - iVar2;
      uVar1 = (long)(CONCAT44((int)(uVar5 ^ 0xffffffff) >> 0x1f,uVar5) ^ 0xffffffff) %
              (long)(int)local_c;
    }
    else {
      printf("BB: %d",2);
      local_c = (int)(local_24 & local_10) / (int)local_2c;
      uVar1 = (long)(int)(local_24 & local_10) % (long)(int)local_2c;
    }
    printf("BB: %d",4,uVar1 & 0xffffffff);
    while (0x331 < iVar2) {
      printf("BB: %d",5);
      local_2c = (int)((long)(CONCAT44((int)(uVar4 ^ 0xffffffff) >> 0x1f,uVar4) ^ 0xffffffff) %
                      (long)(int)uVar4) + local_2c;
      local_10 = (int)(local_18 | 0x331) / (int)local_24;
      local_24 = (local_2c ^ 0xffffffff) * uVar4;
      local_18 = (iVar2 + local_2c) * local_24;
    }
    printf("BB: %d",6);
    while ((int)local_24 < 0xdf) {
      printf("BB: %d",7);
      local_24 = (uVar4 ^ 0xffffffff) & local_2c;
    }
    printf("BB: %d",8);
    uVar1 = (long)(int)(local_10 + local_2c) / (long)(int)local_c;
    local_24 = (uint)((long)((ulong)(uint)((int)uVar1 >> 0x1f) << 0x20 | uVar1 & 0xffffffff) /
                     (long)(int)local_24);
  } while( true );
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


