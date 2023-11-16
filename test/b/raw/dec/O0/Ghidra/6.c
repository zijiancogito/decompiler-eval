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
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  uint local_24;
  int local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  
  uVar2 = f_rand_0();
  iVar3 = f_rand_4();
  local_18 = f_rand_2();
  local_1c = f_rand_1();
  uVar4 = f_rand_3();
  printf("BB: %d",0);
  local_24 = (int)uVar4 % 0x12a + 0x12a;
  if ((int)local_24 < iVar3) {
    printf("BB: %d",5);
    while ((int)uVar4 < local_18) {
      printf("BB: %d",6);
    }
    printf("BB: %d",7);
    local_14 = local_24 * uVar4 & uVar2;
    uVar2 = (local_1c ^ local_24) * uVar2 ^ uVar4;
    uVar6 = (long)(int)uVar4 % (long)(int)uVar2;
    while (uVar6 = uVar6 & 0xffffffff, 0x196 < (int)local_1c) {
      printf("BB: %d",8,uVar6);
      local_14 = (local_1c ^ local_24) * ((int)uVar4 / (int)uVar2 | uVar4) ^ 0xffffffff | uVar2;
      uVar6 = (long)(int)local_24 % (long)local_18;
      local_1c = ((uVar2 - local_14) + local_14) * uVar2;
    }
  }
  else {
    printf("BB: %d",1);
    local_20 = (local_24 ^ uVar4) + local_18 + uVar4;
    while (0x2ad < (int)local_1c) {
      printf("BB: %d",2);
      local_1c = 0x12a % (int)local_24 - local_18;
      local_18 = (int)((long)((ulong)(uint)((int)(0x12a / (long)local_18) >> 0x1f) << 0x20 |
                             0x12a / (long)local_18 & 0xffffffffU) % (long)local_18);
      local_20 = (int)uVar2 % (int)local_1c + local_18;
      local_24 = (uVar2 + iVar3) * iVar3;
    }
    printf("BB: %d",3);
    uVar4 = (((int)(local_20 + local_24) % (int)uVar2) * 0x12a) % (int)local_1c + local_1c;
    uVar6 = (ulong)uVar4;
    local_14 = (local_24 ^ 0xffffffff) + local_1c;
    while (local_1c == 0x12a) {
      printf("BB: %d",4,uVar6);
      local_14 = (int)(uVar4 * local_20) / local_20;
      uVar5 = (local_14 ^ 0xffffffff) - local_24;
      uVar1 = CONCAT44((int)(uVar5 ^ 0xffffffff) >> 0x1f,uVar5) ^ 0xffffffff;
      uVar6 = (long)uVar1 % (long)(int)uVar2 & 0xffffffff;
      local_20 = (int)((long)uVar1 / (long)(int)uVar2);
      local_1c = (uVar4 - uVar2) - (local_24 ^ 0xffffffff);
    }
  }
  printf("BB: %d",9,uVar6);
  local_24 = local_24 + 0x12a;
  iVar3 = ((int)local_24 / (int)local_24 | local_24) + local_14;
  local_14 = local_14 - local_1c ^ local_14;
  printf("BB: %d",10,(long)(int)local_14 % (long)iVar3 & 0xffffffff);
  return ((int)local_14 / iVar3 + local_24 | local_24) ^ 0x12a;
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


