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



undefined8 func0(void)

{
  bool bVar1;
  bool bVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint local_3c;
  
  uVar3 = f_rand_0();
  uVar4 = f_rand_1();
  uVar5 = f_rand_2();
  printf("BB: %d",0);
  uVar6 = (uVar5 + (uVar5 ^ uVar3) * 0x28) * uVar4;
  if (uVar3 == 999) {
    printf("BB: %d",1);
    if ((int)uVar5 < 0x138) {
      bVar2 = true;
      do {
        bVar1 = bVar2;
        printf("BB: %d",2);
        bVar2 = (int)uVar5 < 0x138;
      } while (bVar1);
      uVar6 = 0xfffffc18;
    }
    printf("BB: %d",3);
    uVar4 = (uVar5 | ~uVar6) + 0x28;
    printf("BB: %d",4);
    uVar3 = ((uint)((long)(ulong)(uVar4 & 999) % (long)(int)uVar4) ^ 0x28) - uVar6;
    local_3c = ~((int)uVar4 / (int)uVar5 & (int)~uVar3 % (int)uVar4) * uVar6 ^ 0x28;
    printf("BB: %d",6,(long)(int)uVar4 % (long)(int)uVar5 & 0xffffffff);
    uVar5 = uVar3 * uVar6 * local_3c;
  }
  else {
    local_3c = 0x28;
  }
  printf("BB: %d",7);
  if (uVar5 != 0x2a) {
    do {
      printf("BB: %d",8);
      if (uVar4 == local_3c) {
        bVar2 = true;
        do {
          bVar1 = bVar2;
          printf("BB: %d",9);
          bVar2 = uVar4 == local_3c;
        } while (bVar1);
        uVar5 = (int)uVar6 / (int)local_3c ^ uVar3;
      }
      printf("BB: %d",10);
      uVar6 = uVar6 ^ uVar3 + uVar4;
    } while (uVar5 != 0x2a);
  }
  printf("BB: %d",0xb);
  printf("BB: %d",0xc);
  return 0xffffffd5;
}



undefined8 main(void)

{
  func0();
  printf("%d",0xffffffd5);
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


