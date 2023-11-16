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
  bool bVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  uint uVar6;
  ulong uVar7;
  int local_3c;
  
  uVar2 = f_rand_4();
  uVar7 = (ulong)uVar2;
  uVar2 = f_rand_0();
  uVar3 = f_rand_1();
  uVar4 = f_rand_3();
  local_3c = f_rand_2();
  printf("BB: %d",0);
  if ((int)uVar2 <= local_3c) {
    do {
      printf("BB: %d",1);
      printf("BB: %d",3);
      uVar6 = (int)((int)uVar2 / 0x232 | uVar4) % (int)uVar2 - uVar2 & (uint)uVar7;
      uVar7 = (ulong)uVar6;
      if ((int)uVar3 < 0x232) {
        bVar5 = true;
        do {
          bVar1 = bVar5;
          printf("BB: %d",4);
          bVar5 = (int)uVar3 < 0x232;
        } while (bVar1);
        local_3c = (uVar2 + 0x232 | uVar6) - uVar2;
      }
      printf("BB: %d",5);
      uVar2 = (int)uVar3 % (int)uVar2 + uVar2 & 300;
    } while ((int)uVar2 <= local_3c);
  }
  printf("BB: %d",6);
  if ((int)uVar4 < 0x3c2) {
    printf("BB: %d",7);
    if (0x220 < (int)uVar4) {
      do {
        printf("BB: %d",8);
        local_3c = (uVar4 ^ uVar3) + (int)uVar7;
        uVar7 = (long)((int)uVar7 * local_3c) / (long)(int)uVar2 & 0xffffffff;
      } while (0x220 < (int)uVar4);
    }
    printf("BB: %d",9);
    if ((int)uVar3 <= local_3c) {
      bVar5 = false;
      do {
        printf("BB: %d",10);
        bVar1 = !bVar5;
        bVar5 = local_3c < (int)uVar3;
      } while (bVar1);
    }
    printf("BB: %d",0xb);
    uVar4 = uVar4 - local_3c;
  }
  else {
    printf("BB: %d",0xc);
    uVar4 = -uVar2;
  }
  printf("BB: %d",0xd);
  printf("BB: %d",0xe);
  return ~uVar4;
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


