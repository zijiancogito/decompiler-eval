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
  uint uVar1;
  uint uVar2;
  int iVar3;
  ulong uVar4;
  uint local_30;
  uint local_2c;
  uint local_1c;
  uint local_18;
  uint local_10;
  uint local_c;
  
  local_c = 0x4e;
  local_10 = f_rand_0();
  uVar1 = f_rand_1();
  local_18 = f_rand_2();
  printf("BB: %d",0);
  local_1c = 0x4e;
  while (local_18 == 0x223) {
    printf("BB: %d",1);
    while ((int)uVar1 <= (int)local_1c) {
      printf("BB: %d",2);
      uVar2 = (int)((local_c ^ local_1c) + local_1c) / (int)local_1c;
      local_1c = uVar1 ^ 0xffffffff;
      local_18 = local_c ^ 0xffffffff;
      local_10 = (uVar1 | uVar2) & local_c ^ local_1c;
    }
    printf("BB: %d",3);
    uVar4 = (ulong)(uint)((int)((long)(int)uVar1 / (long)(int)local_1c) >> 0x1f) << 0x20 |
            (long)(int)uVar1 / (long)(int)local_1c & 0xffffffffU;
    local_1c = (uint)((long)uVar4 / (long)(int)local_18);
    if (0x11e < (int)uVar1) {
      printf("BB: %d",4,(long)uVar4 % (long)(int)local_18 & 0xffffffff);
      local_10 = -uVar1;
      local_c = (int)(local_18 ^ uVar1) / (int)(local_10 ^ 0xffffffff);
      local_1c = (int)(local_18 * local_10) % (int)uVar1;
    }
  }
  printf("BB: %d",5);
  local_2c = local_10 ^ 0xffffffff;
  if (local_18 != local_2c) {
    printf("BB: %d",6);
    iVar3 = (int)(((int)(uVar1 ^ local_c) % (int)local_10) * -local_c | local_2c) % (int)local_10;
    local_30 = uVar1 ^ 0xffffffff;
    if ((int)local_2c <= (int)local_30) {
      printf("BB: %d",7);
      local_30 = (uint)((long)((ulong)(uint)((int)((long)(int)local_18 % (long)(int)local_18) >>
                                            0x1f) << 0x20 |
                              (long)(int)local_18 % (long)(int)local_18 & 0xffffffffU) /
                       (long)(int)local_c);
      local_10 = (local_18 + local_c) - local_2c;
      local_2c = (int)local_30 % (int)local_30 - uVar1;
    }
    printf("BB: %d",8);
    if ((int)local_18 < iVar3) {
      printf("BB: %d",9);
      uVar4 = (ulong)((int)(local_2c * iVar3 ^ uVar1) % (int)local_2c ^ uVar1);
    }
    else {
      printf("BB: %d",10);
      uVar4 = (long)(int)(((int)((int)((int)(((int)local_c / (int)local_2c) * local_30) /
                                       (int)local_2c + local_18) % (int)local_10 | uVar1) %
                           (int)local_c & local_18 & local_18) + local_2c) % (long)(int)local_10 &
              0xffffffff;
    }
    printf("BB: %d",0xb,uVar4);
  }
  printf("BB: %d",0xc);
  return (int)local_10 / (int)local_c;
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


